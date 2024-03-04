// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'dart:math';

import 'package:fitness/common/colo_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:last/widget/DashBoardCard.dart';
// import 'package:last/widget/buttonNav.dart';
// import 'package:last/widget/containerButton.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double miles = 0.0;
  double duration = 0.0;
  double calories = 0.0;
  double addValue = 0.025;
  int steps = 0;
  double previousDistacne = 0.0;
  double distance = 0.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            StreamBuilder<AccelerometerEvent>(
              stream: SensorsPlatform.instance.accelerometerEventStream(),
              builder: (context, snapShort) {
                if (snapShort.hasData) {
                  x = snapShort.data!.x;
                  y = snapShort.data!.y;
                  z = snapShort.data!.z;
                  distance = getValue(x, y, z);
                  if (distance > 6) {
                    steps++;
                  }
                  calories = calculateCalories(steps);
                  duration = calculateDuration(steps);
                  miles = calculateMiles(steps);
                }
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height - 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Color(0xff0C1E4E),
                            Color(0xff224A88),
                          ])),
                    ),
                    // ignore: sized_box_for_whitespace
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
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
                        ),
                        dashboardCard(steps, miles, calories, duration),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  double getValue(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousValue();
    double modDistance = magnitude - previousDistacne;
    setPreviousValue(magnitude);
    return modDistance;
  }

  void setPreviousValue(double distance) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setDouble("preValue", distance);
  }

  void getPreviousValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      previousDistacne = pref.getDouble("preValue") ?? 0.0;
    });
  }

  // void calculate data
  double calculateMiles(int steps) {
    double milesValue = (2.2 * steps) / 5280;
    return milesValue;
  }

  double calculateDuration(int steps) {
    double durationValue = (steps * 1 / 1000);
    return durationValue;
  }

  double calculateCalories(int steps) {
    double caloriesValue = (steps * 0.0566);
    return caloriesValue;
  }
}

class dashboardCard extends StatelessWidget {
  int steps;
  double miles, calories, duration;
  dashboardCard(this.steps, this.miles, this.calories, this.duration,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xff1D3768),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        text(30, "Steps Taken:"),
                        text(28, steps.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 40,
            ),
            // this is botton part
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                imageContainer("assets/steps/locations.png",
                    miles.toStringAsFixed(3), "Miles"),
                imageContainer("assets/steps/calories.png",
                    calories.toStringAsFixed(3), "Calories"),
                imageContainer("assets/steps/stopwatch.png",
                    duration.toStringAsFixed(3), "Duration"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class imageContainer extends StatelessWidget {
  String imagePath, number, textTitle;
  imageContainer(this.imagePath, this.number, this.textTitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.29,
      child: Column(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: text(16, number),
          ),

          // this is another text
          text(12, textTitle),
        ],
      ),
    );
  }
}

class text extends StatelessWidget {
  double fontSize;
  String titleText;
  text(this.fontSize, this.titleText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: GoogleFonts.aBeeZee(
        color: Colors.white,
        fontSize: fontSize,
        letterSpacing: 2,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class containerButton extends StatelessWidget {
  Icon someIcon;
  containerButton(this.someIcon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: Colors.green,
      ),
      child: Center(
        child: someIcon,
      ),
    );
  }
}
