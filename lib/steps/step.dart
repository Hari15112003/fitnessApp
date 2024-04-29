import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class Pedestrain extends StatefulWidget {
  @override
  _PedestrainState createState() => _PedestrainState();
}

class _PedestrainState extends State<Pedestrain> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  double calculateCaloriesBurnt(int stepCount, double weightKg) {
    // MET value for walking
    const double MET = 3.5;

    // Convert step count to distance (assuming average step length)
    double distanceKm =
        stepCount * 0.000762; // Average step length in kilometers

    double durationHours = distanceKm / 5.0;

    // Calculate calories burnt
    double caloriesBurnt = MET * weightKg * durationHours;

    return caloriesBurnt;
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() async {
    // Request permission to access sensors
    var status = await Permission.activityRecognition.request();
    if (status.isGranted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _pedestrianStatusStream
          .listen(onPedestrianStatusChanged)
          .onError(onPedestrianStatusError);

      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);
    } else {
      // Handle case when permission is not granted
      setState(() {
        _status = 'Permission not granted';
        _steps = 'Permission not granted';
      });
    }

    if (!mounted) return;
  }

  final collectionRef = FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: TColor.white,
          centerTitle: true,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/img/black_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(
            "Step Tracker",
            style: TextStyle(
                color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        body: StreamBuilder(
          stream: collectionRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DocumentSnapshot ref = snapshot.data!;
              double weight = double.parse(ref.get('weight').toString());
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Steps Taken',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      _steps,
                      style: TextStyle(fontSize: 60),
                    ),
                    Divider(
                      height: 100,
                      thickness: 0,
                      color: Colors.white,
                    ),
                    Text(
                      'Pedestrian Status',
                      style: TextStyle(fontSize: 30),
                    ),
                    Icon(
                      _status == 'walking'
                          ? Icons.directions_walk
                          : _status == 'stopped'
                              ? Icons.accessibility_new
                              : Icons.error,
                      size: 100,
                    ),
                    Center(
                      child: Text(
                        _status,
                        style: _status == 'walking' || _status == 'stopped'
                            ? TextStyle(fontSize: 30)
                            : TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ),
                    Text("Calories Burnt : ${calculateCaloriesBurnt(
                      int.parse(_steps),
                      double.parse("$weight"),
                    )}"),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
