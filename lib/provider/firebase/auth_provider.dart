// ignore_for_file: use_build_context_synchronously, unused_local_variable, empty_statements

import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness/utils/snackbar.dart';
import 'package:flutter/material.dart';

import '../../view/login/welcome_view.dart';
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
      UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomeView(),
              ),
            ),
          )
          .onError((error, stackTrace) =>
              showSnackBar(content: error.toString(), context: context));
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

  // update the user details
  Future<void> updateUserCredentails(
      {required BuildContext context,
      required String genderChoosen,
      required String name,
      required String dob,
      required double weight,
      required double height}) async {
    try {
      // Store additional user data in Firestore
      await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'name': name,
        'height': height,
        'weight': weight,
        'dateOfBirth': dob,
        'gender': genderChoosen
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
                  'times': [times],
                  'level': [level]
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
                'times': [times],
                'level': [level]
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
              'times': [times],
              'level': [level]
            },
          },
        },
        SetOptions(
          merge: true,
        ),
      );
    }
  }

  Future<void> updateWorkoutStatusFireBase({
    required BuildContext context,
    required bool completed,
    required String workOutName,
  }) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    String monthName = DateTime.now().month.toString();
    String dayIdentifier = DateTime.now().day.toString();

    DocumentReference userRef = FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection('workout')
        .doc(monthName);

    // update the workout field:
    await userRef.update({'$dayIdentifier.$workOutName.completed': completed});
  }

  Future<void> updatelikeStatusFireBase({
    required BuildContext context,
    required bool like,
    required String workOutName,
  }) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    String monthName = DateTime.now().month.toString();
    String dayIdentifier = DateTime.now().day.toString();

    DocumentReference userRef = FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection('workout')
        .doc(monthName);

// change
    DocumentSnapshot userDoc = await userRef.get();
    if (userDoc.exists) {
      Map<String, dynamic> existingData =
          userDoc.data() as Map<String, dynamic>;

      if (existingData.containsKey(dayIdentifier)) {
        Map<String, dynamic> dayData =
            existingData[dayIdentifier] as Map<String, dynamic>;

        if (dayData.containsKey(workOutName)) {
          // If the workout already has an entry, update the 'times' field

          await userRef.update({
            '$dayIdentifier.$workOutName.like': like,
          });
        } else {
          // If the workout does not have an entry, create a new entry
          await userRef.set(
            {
              dayIdentifier: {
                workOutName: {
                  'caloriesBurnt': 0,
                  'completed': false,
                  'like': like,
                  'name': workOutName,
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
              workOutName: {
                'caloriesBurnt': 0,
                'completed': false,
                'like': like,
                'name': workOutName,
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
            workOutName: {
              'caloriesBurnt': 0,
              'completed': false,
              'like': like,
              'name': workOutName,
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

  //  delete workout scheduled

  Future<void> deleteWorkoutFromFireBase({
    required BuildContext context,
    required String workOutName,
    required String month,
    required String day,
  }) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference userRef = FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection('workout')
        .doc(month);

// change
    DocumentSnapshot userDoc = await userRef.get();
    if (userDoc.exists) {
      Map<String, dynamic> existingData =
          userDoc.data() as Map<String, dynamic>;

      if (existingData.containsKey(day)) {
        Map<String, dynamic> dayData =
            existingData[day] as Map<String, dynamic>;

        if (dayData.containsKey(workOutName)) {
          // If the workout already has an entry, update the 'times' field

          await userRef.update({
            '$day.$workOutName': FieldValue.delete(),
          });
        }
      }
    }
  }

  // adding calories to firebase

  Future<void> updateCaloriesToFireBase({
    required BuildContext context,
    required int caloriesBurnt,
    required String workOutName,
  }) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    String monthName = DateTime.now().month.toString();
    String dayIdentifier = DateTime.now().day.toString();

    DocumentReference userRef = FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection('workout')
        .doc(monthName);

// change
    DocumentSnapshot userDoc = await userRef.get();
    if (userDoc.exists) {
      Map<String, dynamic> existingData =
          userDoc.data() as Map<String, dynamic>;

      if (existingData.containsKey(dayIdentifier) &&
          existingData.entries.isNotEmpty) {
        Map<String, dynamic> dayData =
            existingData[dayIdentifier] as Map<String, dynamic>;

        if (dayData.containsKey(workOutName) && dayData.entries.isNotEmpty) {
          var totalCalories =
              userDoc.get('$dayIdentifier.$workOutName.caloriesBurnt') +
                  caloriesBurnt;

          if (totalCalories >= 1000) {
            totalCalories = 50;
          }

          await userRef.update({
            '$dayIdentifier.$workOutName.caloriesBurnt': totalCalories,
          });
        }
      }
    }
  }

//  alarm setting
  Future<void> setAlarm({
    required BuildContext context,
    required String value,
  }) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    String monthName = DateTime.now().month.toString();
    String dayIdentifier = DateTime.now().day.toString();

    DocumentReference userRef = FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection('alarm')
        .doc(monthName);
    DocumentSnapshot userDoc = await userRef.get();
    if (userDoc.exists) {
      Map<String, dynamic> existingData =
          userDoc.data() as Map<String, dynamic>;

      // If the workout already has an entry, update the 'times' field

      await userRef.update({
        dayIdentifier: value,
      });
    }
  }
}
