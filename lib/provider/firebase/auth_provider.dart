// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness/utils/snackbar.dart';
import 'package:flutter/material.dart';

import '../../view/login/what_your_goal_view.dart';
import '../model/user_model.dart';

class MyAuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  UserModel? _userModel;
  UserModel get userModel => _userModel!;

// sign-in
  Future<void> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  //sign-up

  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required UserModel userModel,
      required BuildContext context}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      userModel.createdAt = DateTime.now().toString();
      userModel.uid = userCredential.user!.uid;

      _userModel = userModel;

      // Store additional user data in Firestore
      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap())
          .then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WhatYourGoalView(),
          ),
        );
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar(content: e.toString(), context: context);
    }
  }

  // sign-out
  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }

  //photo-upload
  Future<void> savePhoto(
      {required File imagePath, required BuildContext context}) async {
    // try {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    // Generate a unique filename for the photo based on the current date
    String monthName = "01";
    //  DateTime.now().month.toString();

    String filename =
        '${monthName}_${DateTime.now().millisecondsSinceEpoch}.jpg';

    // Upload the photo to Firebase Storage
    Reference storageReference =
        _firebaseStorage.ref().child('photos/$userId/$filename');
    UploadTask uploadTask = storageReference.putFile(imagePath);
    await uploadTask.whenComplete(
      () => showSnackBar(content: "Uploaded Successfully", context: context),
    );

    //     // Get the download URL of the uploaded photo
    String photoUrl = await storageReference.getDownloadURL();

    //     // Update Firestore with information about the photo
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection('photos')
        .doc(monthName)
        .set({
      'photoUrls': FieldValue.arrayUnion([photoUrl]),
    }, SetOptions(merge: true));
  }

// workout -details add
  Future<void> addWorkOutToFireBase(
      {required String month,
      required String level,
      required String day,
      required BuildContext context,
      required bool like,
      required String name,
      required bool completed,
      required String times}) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    String monthName = month;
    String dayIdentifier = day;

    DocumentReference userRef = FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection('workout')
        .doc(monthName);

    DocumentSnapshot userDoc = await userRef.get();
    if (userDoc.exists) {
      Map<String, dynamic> existingData =
          userDoc.data() as Map<String, dynamic>;

      if (existingData.containsKey(dayIdentifier)) {
        Map<String, dynamic> dayData =
            existingData[dayIdentifier] as Map<String, dynamic>;

        if (dayData.containsKey(name)) {
          // If the workout already has an entry, update the 'times' field
          List<String> existingTimes = dayData[name]['times'].cast<String>();
          existingTimes.add(times);
          List<String> workOutLevel = dayData[name]['level'].cast<String>();
          workOutLevel.add(level);

          await userRef.update({
            '$dayIdentifier.$name.times': existingTimes,
            '$dayIdentifier.$name.level': workOutLevel,
          });
        } else {
          // If the workout does not have an entry, create a new entry
          await userRef.set(
            {
              dayIdentifier: {
                name: {
                  'caloriesBurnt': 0,
                  'completed': completed,
                  'like': like,
                  'name': name,
                  'times': [],
                  'level': []
                },
              },
            },
            SetOptions(
              merge: true,
            ),
          );
        }
      } else {
        // If the day does not have an entry, create a new entry
        await userRef.set(
          {
            dayIdentifier: {
              name: {
                'caloriesBurnt': 0,
                'completed': completed,
                'like': like,
                'name': name,
                'times': [],
                'level': []
              },
            },
          },
          SetOptions(
            merge: true,
          ),
        );
      }
    } else {
      // If the document does not exist, create a new document
      await userRef.set(
        {
          dayIdentifier: {
            name: {
              'caloriesBurnt': 0,
              'completed': completed,
              'like': like,
              'name': name,
              'times': [],
              'level': []
            },
          },
        },
        SetOptions(
          merge: true,
        ),
      );
    }
  }
}
