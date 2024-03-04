import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/view/workout_tracker/workour_detail_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../common_widget/upcoming_workout_row.dart';
import '../../common_widget/what_train_row.dart';

class WorkoutTrackerView extends StatefulWidget {
  final String from;
  const WorkoutTrackerView({super.key, required this.from});

  @override
  State<WorkoutTrackerView> createState() => _WorkoutTrackerViewState();
}

class _WorkoutTrackerViewState extends State<WorkoutTrackerView> {
  List latestArr = [
    {
      "image": "assets/img/Workout1.png",
      "title": "Fullbody Workout",
      "time": "Today, 03:00pm"
    },
    {
      "image": "assets/img/Workout2.png",
      "title": "Upperbody Workout",
      "time": "June 05, 02:00pm"
    },
  ];

// List of workouts
  List workOutArr = [
    // 1
    {
      "image": "assets/photos/fullbody.png",
      "title": "Fullbody Workout",
      "exercises": "12 Exercises",
      "time": "32mins"
    },
    // 2
    {
      "image": "assets/photos/upperbody.png",
      "title": "Upperbody Workout",
      "exercises": "12 Exercises",
      "time": "30mins"
    },
    // 3
    {
      "image": "assets/photos/lowerbody.png",
      "title": "Lowerbody Workout",
      "exercises": "12 Exercises",
      "time": "32mins"
    },
    //4
    {
      "image": "assets/photos/abs.png",
      "title": "ABS Workout",
      "exercises": "12 Exercises",
      "time": "20mins"
    },
// 5
    {
      "image": "assets/photos/leg.png",
      "title": "Leg Workout",
      "exercises": "12 Exercises",
      "time": "24mins"
    },
//  6
    {
      "image": "assets/photos/chest.png",
      "title": "Chest Workout",
      "exercises": "12 Exercises",
      "time": "32mins"
    },
//  7
    {
      "image": "assets/photos/shoulder.png",
      "title": "Shoulder Workout",
      "exercises": "12 Exercises",
      "time": "27mins"
    },
//  8
    {
      "image": "assets/photos/arm.png",
      "title": "Arm Workout",
      "exercises": "12 Exercises",
      "time": "30mins"
    },
//  9
    {
      "image": "assets/photos/back.png",
      "title": "Back Workout",
      "exercises": "12 Exercises",
      "time": "14mins"
    },
//  10
    {
      "image": "assets/photos/plyometric.png",
      "title": "Plyometric  Exercise",
      "exercises": "12 Exercises",
      "time": "16mins"
    },
  ];
  final collectionRef = FirebaseFirestore.instance.collection("users");
  final double maxiumValue = 1000;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return StreamBuilder<DocumentSnapshot>(
        stream: collectionRef
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("workout")
            .doc(DateTime.now().month.toString())
            .snapshots(),
        builder: (context, snapshot) {
          // for charts

          //  /for charts

          List<String> image = [];

          List<int> caloriesBurntList = [];
          List<bool> likeList = [];
          List<bool> targetCompletion = [];
          List<String> nameList = [];
          List<int> caloriesBurnt = [];
          List<dynamic> time = [];
          List<dynamic> dataForGraph = [];
          //  Today workOut
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              Map<String, dynamic>? prin =
                  snapshot.data?.data() as Map<String, dynamic>?;

              if (prin != null &&
                  prin.containsKey((DateTime.now().day).toString())) {
                Map<String, dynamic> docs =
                    snapshot.data!.get(DateTime.now().day.toString());
                List<String> searchElements = docs.keys.toList();

                // chart
                Map<String, dynamic> documentData =
                    snapshot.data!.data() as Map<String, dynamic>;
                List<String> filteredKeys = documentData.keys.toList();
                filteredKeys
                    .sort((a, b) => int.parse(a).compareTo(int.parse(b)));

                // print(filteredKeys);

                if (filteredKeys.length >= 8) {
                  dataForGraph =
                      filteredKeys.skip(filteredKeys.length - 7).toList();
                }
                // print(dataForGraph);
                for (var p in dataForGraph) {
                  if (documentData.containsKey(p.toString())) {
                    Map<String, dynamic> mapping = documentData[p.toString()];

                    // Iterate through the entries of the mapping
                    for (var entry in mapping.entries) {
                      // Check if the key is 'calories'
                      caloriesBurnt.add(entry.value['caloriesBurnt']);
                    }
                  }
                }
                // chart

                List sdata = docs.entries.toList();

                for (MapEntry<String, dynamic> entry in sdata) {
                  Map<String, dynamic> workoutData = entry.value;

                  // Extract values
                  int caloriesBurnt = workoutData['caloriesBurnt'] ?? 0;
                  bool like = workoutData['like'] ?? false;
                  bool complete = workoutData['completed'] ?? false;
                  List<dynamic> timings = workoutData['times'].toList() ?? [];
                  String name = workoutData['name'] ?? "assets/img/water.png";

                  // Add to respective lists
                  caloriesBurntList.add(caloriesBurnt);
                  likeList.add(like);
                  nameList.add(name);
                  time.add(timings.toList());
                  targetCompletion.add(complete);
                }
                // print(time);

                for (String searchElement in searchElements) {
                  int index = workOutArr.indexWhere(
                      (element) => element["title"] == searchElement);

                  if (index != -1) {
                    image.add(
                      workOutArr[index]['image'] ?? '',
                    );
                  } else {}
                }
              } else {}

              return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: TColor.primaryG)),
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        backgroundColor: Colors.transparent,
                        centerTitle: true,
                        elevation: 0,
                        // pinned: true,
                        leading: widget.from == "activity"
                            ? InkWell(
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
                              )
                            : const SizedBox(),
                        title: Text(
                          "Workout Tracker",
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        // actions: [
                        //   InkWell(
                        //     onTap: () {},
                        //     child: Container(
                        //       margin: const EdgeInsets.all(8),
                        //       height: 40,
                        //       width: 40,
                        //       alignment: Alignment.center,
                        //       decoration: BoxDecoration(
                        //           color: TColor.lightGray,
                        //           borderRadius: BorderRadius.circular(10)),
                        //       child: Image.asset(
                        //         "assets/img/more_btn.png",
                        //         width: 15,
                        //         height: 15,
                        //         fit: BoxFit.contain,
                        //       ),
                        //     ),
                        //   )
                        // ],
                      ),
                      caloriesBurnt.isNotEmpty
                          ? SliverAppBar(
                              backgroundColor: Colors.transparent,
                              centerTitle: true,
                              elevation: 0, 
                              expandedHeight: media.width * 0.5,
                              flexibleSpace: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                height: media.width * 0.5,
                                width: double.maxFinite,
                                child: LineChart(
                                  LineChartData(
                                    lineTouchData: LineTouchData(
                                      enabled: true,
                                      handleBuiltInTouches: false,
                                      touchCallback: (FlTouchEvent event,
                                          LineTouchResponse? response) {
                                        if (response == null ||
                                            response.lineBarSpots == null) {
                                          return;
                                        }
                                        // if (event is FlTapUpEvent) {
                                        //   final spotIndex =
                                        //       response.lineBarSpots!.first.spotIndex;
                                        //   showingTooltipOnSpots.clear();
                                        //   setState(() {
                                        //     showingTooltipOnSpots.add(spotIndex);
                                        //   });
                                        // }
                                      },
                                      mouseCursorResolver: (FlTouchEvent event,
                                          LineTouchResponse? response) {
                                        if (response == null ||
                                            response.lineBarSpots == null) {
                                          return SystemMouseCursors.basic;
                                        }
                                        return SystemMouseCursors.click;
                                      },
                                      getTouchedSpotIndicator:
                                          (LineChartBarData barData,
                                              List<int> spotIndexes) {
                                        return spotIndexes.map((index) {
                                          return TouchedSpotIndicatorData(
                                            FlLine(
                                              color: Colors.transparent,
                                            ),
                                            FlDotData(
                                              show: true,
                                              getDotPainter: (spot, percent,
                                                      barData, index) =>
                                                  FlDotCirclePainter(
                                                radius: 3,
                                                color: Colors.white,
                                                strokeWidth: 3,
                                                strokeColor:
                                                    TColor.secondaryColor1,
                                              ),
                                            ),
                                          );
                                        }).toList();
                                      },
                                      touchTooltipData: LineTouchTooltipData(
                                        tooltipBgColor: TColor.secondaryColor1,
                                        tooltipRoundedRadius: 20,
                                        getTooltipItems:
                                            (List<LineBarSpot> lineBarsSpot) {
                                          return lineBarsSpot
                                              .map((lineBarSpot) {
                                            return LineTooltipItem(
                                              "${lineBarSpot.x.toInt()} mins ago",
                                              const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          }).toList();
                                        },
                                      ),
                                    ),
                                    lineBarsData: [
                                      LineChartBarData(
                                          isCurved: true,
                                          color: TColor.white,
                                          barWidth: 4,
                                          isStrokeCapRound: true,
                                          dotData: FlDotData(show: false),
                                          belowBarData:
                                              BarAreaData(show: false),
                                          spots: [
                                            // data

                                            FlSpot(
                                                1,
                                                (caloriesBurnt[0] /
                                                        maxiumValue) *
                                                    100),
                                            FlSpot(
                                                2,
                                                (caloriesBurnt[1] /
                                                        maxiumValue) *
                                                    100),
                                            FlSpot(
                                                3,
                                                (caloriesBurnt[2] /
                                                        maxiumValue) *
                                                    100),
                                            FlSpot(
                                                4,
                                                (caloriesBurnt[3] /
                                                        maxiumValue) *
                                                    100),
                                            FlSpot(
                                                5,
                                                (caloriesBurnt[4] /
                                                        maxiumValue) *
                                                    100),
                                            FlSpot(
                                                6,
                                                (caloriesBurnt[5] /
                                                        maxiumValue) *
                                                    100),
                                            FlSpot(
                                                7,
                                                (caloriesBurnt[6] /
                                                        maxiumValue) *
                                                    100),
                                          ]),
                                      // LineChartBarData(
                                      //   isCurved: true,
                                      //   color: TColor.white.withOpacity(0.5),
                                      //   barWidth: 2,
                                      //   isStrokeCapRound: true,
                                      //   dotData: FlDotData(show: false),
                                      //   belowBarData: BarAreaData(
                                      //     show: false,
                                      //   ),
                                      //   spots: const [
                                      //     // data
                                      //     FlSpot(1, 80),
                                      //     FlSpot(2, 50),
                                      //     FlSpot(3, 90),
                                      //     FlSpot(4, 40),
                                      //     FlSpot(5, 80),
                                      //     FlSpot(6, 35),
                                      //     FlSpot(7, 60),
                                      //   ],
                                      // )
                                    ],
                                    minY: -0.5,
                                    maxY: 110,
                                    titlesData: FlTitlesData(
                                        show: true,
                                        leftTitles: AxisTitles(),
                                        topTitles: AxisTitles(),
                                        bottomTitles: AxisTitles(
                                          sideTitles: bottomTitles,
                                        ),
                                        rightTitles: AxisTitles(
                                          sideTitles: rightTitles,
                                        )),
                                    gridData: FlGridData(
                                      show: true,
                                      drawHorizontalLine: true,
                                      horizontalInterval: 25,
                                      drawVerticalLine: false,
                                      getDrawingHorizontalLine: (value) {
                                        return FlLine(
                                          color: TColor.white.withOpacity(0.15),
                                          strokeWidth: 3,
                                        );
                                      },
                                    ),
                                    borderData: FlBorderData(
                                      show: true,
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SliverAppBar(
                              backgroundColor: Colors.transparent,
                              centerTitle: true,
                              elevation: 0,
                              title: Text(
                                "Not enough data  to display graph",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            )
                    ];
                  },
                  body: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: TColor.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                width: 50,
                                height: 4,
                                decoration: BoxDecoration(
                                    color: TColor.gray.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(3)),
                              ),
                            ),
                            SizedBox(
                              height: media.width * 0.05,
                            ),
                            // Container(
                            //   padding: const EdgeInsets.symmetric(
                            //       vertical: 15, horizontal: 15),
                            //   decoration: BoxDecoration(
                            //     color: TColor.primaryColor2.withOpacity(0.3),
                            //     borderRadius: BorderRadius.circular(15),
                            //   ),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Text(
                            //         "Daily Workout Schedule",
                            //         style: TextStyle(
                            //             color: TColor.black,
                            //             fontSize: 14,
                            //             fontWeight: FontWeight.w700),
                            //       ),
                            //       SizedBox(
                            //         width: 70,
                            //         height: 25,
                            //         child: RoundButton(
                            //           title: "Check",
                            //           type: RoundButtonType.bgGradient,
                            //           fontSize: 12,
                            //           fontWeight: FontWeight.w400,
                            //           onPressed: () {
                            //             // Navigator.push(
                            //             //   context,
                            //             //   MaterialPageRoute(
                            //             //     builder: (context) =>
                            //             //         const ActivityTrackerView(),
                            //             //   ),
                            //             // );
                            //           },
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: media.width * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Your Workout",
                                  style: TextStyle(
                                      color: TColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                // TextButton(
                                //   onPressed: () {
                                //   },
                                //   child: Text(
                                //     "See More",
                                //     style: TextStyle(
                                //       color: TColor.gray,
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.w700,
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                            nameList.isNotEmpty
                                ? Text(
                                    "Swipe the button to mark completed",
                                    style: TextStyle(
                                      color: TColor.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      "No workout scheduled yet",
                                      style: TextStyle(
                                        color: TColor.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                            ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: nameList.length,
                                itemBuilder: (context, index) {
                                  var wObj = latestArr[index] as Map? ?? {};

                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              WorkoutDetailView(
                                            indexingRef: index,
                                            imagePath: workOutArr[index]
                                                ['image'],
                                            forWhat: "workout",
                                            dObj: wObj,
                                            workOutName: nameList[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: UpcomingWorkoutRow(
                                      image: image[index],
                                      time: time[index].toString().substring(
                                            1,
                                            time[index].toString().length - 1,
                                          ),
                                      workOutName: nameList[index],
                                      completedOrNot: targetCompletion[index],
                                    ),
                                  );
                                }),
                            SizedBox(
                              height: media.width * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  // "What Do You Want to Train",
                                  "Schedule WorkOut",
                                  style: TextStyle(
                                      color: TColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            // StreamBuilder<QuerySnapshot>(
                            //     stream: FirebaseFirestore.instance
                            //         .collection("workout")
                            //         .snapshots(),
                            //     builder: (context, snapshot) {
                            //       if (snapshot.hasData) {
                            //         List workOuts = [];
                            //         for (var element in snapshot.data!.docs) {
                            //           workOuts.add(element);
                            //         }

                            // return
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: workOutArr.length,
                              itemBuilder: (context, index) {
                                var wObj = workOutArr[index] as Map? ?? {};
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WorkoutDetailView(
                                                    forWhat: "view",
                                                    imagePath: workOutArr[index]
                                                        ['image'],
                                                    indexingRef: index,
                                                    workOutName:
                                                        workOutArr[index]
                                                            ['title'],
                                                    dObj: wObj,
                                                  )));
                                    },
                                    child: WhatTrainRow(
                                      imagePath: workOutArr[index]['image'],
                                      wObj: wObj,
                                      workoutName: workOutArr[index]['title'],
                                      indexingRef: index,
                                    ));
                              },
                            ),

                            SizedBox(
                              height: media.width * 0.1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              // Handle the case when document or field does not exist
              return const Center(
                child: Text(
                  "No target Assigned for today",
                ),
              );
            }
          } else {
            return const SizedBox();
          }
        });
  }

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  // List<LineChartBarData> get lineBarsData1 => [
  //       lineChartBarData1_1,
  //       lineChartBarData1_2,
  //     ];

  // Widget LineChartBarData lineChart1(){
  //   return LineChartBarData(
  //       isCurved: true,
  //       color: TColor.white,
  //       barWidth: 4,
  //       isStrokeCapRound: true,
  //       dotData: FlDotData(show: false),
  //       belowBarData: BarAreaData(show: false),
  //       spots: const [
  //         // data

  //         FlSpot(1, 35),
  //         FlSpot(2, 70),
  //         FlSpot(3, 40),
  //         FlSpot(4, 80),
  //         FlSpot(5, 25),
  //         FlSpot(6, 70),
  //         FlSpot(7, 35),
  //       ],
  //     );
  // }

  // LineChartBarData get lineChartBarData1_1 => LineChartBarData(
  //       isCurved: true,
  //       color: TColor.white,
  //       barWidth: 4,
  //       isStrokeCapRound: true,
  //       dotData: FlDotData(show: false),
  //       belowBarData: BarAreaData(show: false),
  //       spots: const [
  //         // data

  //         FlSpot(1, 35),
  //         FlSpot(2, 70),
  //         FlSpot(3, 40),
  //         FlSpot(4, 80),
  //         FlSpot(5, 25),
  //         FlSpot(6, 70),
  //         FlSpot(7, 35),
  //       ],
  //     );

  // LineChartBarData get lineChartBarData1_2 => LineChartBarData(
  //       isCurved: true,
  //       color: TColor.white.withOpacity(0.5),
  //       barWidth: 2,
  //       isStrokeCapRound: true,
  //       dotData: FlDotData(show: false),
  //       belowBarData: BarAreaData(
  //         show: false,
  //       ),
  //       spots: const [
  //         // data
  //         FlSpot(1, 80),
  //         FlSpot(2, 50),
  //         FlSpot(3, 90),
  //         FlSpot(4, 40),
  //         FlSpot(5, 80),
  //         FlSpot(6, 35),
  //         FlSpot(7, 60),
  //       ],
  //     );

  SideTitles get rightTitles => SideTitles(
        getTitlesWidget: rightTitleWidgets,
        showTitles: true,
        interval: 20,
        reservedSize: 40,
      );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 20:
        text = '20%';
        break;
      case 40:
        text = '40%';
        break;
      case 60:
        text = '60%';
        break;
      case 80:
        text = '80%';
        break;
      case 100:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: TextStyle(
          color: TColor.white,
          fontSize: 12,
        ),
        textAlign: TextAlign.center);
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: TColor.white,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Sun', style: style);
        break;
      case 2:
        text = Text('Mon', style: style);
        break;
      case 3:
        text = Text('Tue', style: style);
        break;
      case 4:
        text = Text('Wed', style: style);
        break;
      case 5:
        text = Text('Thu', style: style);
        break;
      case 6:
        text = Text('Fri', style: style);
        break;
      case 7:
        text = Text('Sat', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}
