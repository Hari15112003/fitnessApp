import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/view/workout_tracker/workout_tracker_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../common/colo_extension.dart';
import '../../common_widget/latest_activity_row.dart';
import '../../common_widget/today_target_cell.dart';

class ActivityTrackerView extends StatefulWidget {
  const ActivityTrackerView({super.key});

  @override
  State<ActivityTrackerView> createState() => _ActivityTrackerViewState();
}

class _ActivityTrackerViewState extends State<ActivityTrackerView> {
  int touchedIndex = -1;

  //TODO: requied list of workout;
  List workOutArr = [
    {
      "image": "assets/img/what_1.png",
      "title": "Fullbody Workout",
    },
    {
      "image": "assets/img/what_2.png",
      "title": "Lowebody Workout",
    },
    {
      "image": "assets/img/what_3.png",
      "title": "AB Workout",
    }
  ];

  List latestArr = [
    {
      "image": "assets/img/pic_4.png",
      "title": "Drinking 300ml Water",
      "time": "About 1 minutes ago"
    },
    {
      "image": "assets/img/pic_5.png",
      "title": "Eat Snack (Fitbar)",
      "time": "About 3 hours ago"
    },
  ];
  final collectionRef = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
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
          "Activity Tracker",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
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
      backgroundColor: TColor.white,
      body: StreamBuilder<DocumentSnapshot>(
          stream: collectionRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("workout")
              .doc(DateTime.now().month.toString())
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                Map<String, dynamic>? prin =
                    snapshot.data?.data() as Map<String, dynamic>?;
                if (prin != null &&
                    prin.containsKey((DateTime.now().day).toString())) {
                  Map<String, dynamic> docs =
                      snapshot.data!.get(DateTime.now().day.toString());

                  // skbsvkdsbvds

                  List<String> image = [];
                  List<String> searchElements = docs.keys.toList();
                  List<int> caloriesBurntList = [];
                  List<bool> likeList = [];
                  List<bool> targetCompletion = [];
                  List<String> nameList = [];

                  List sdata = docs.entries.toList();

                  for (MapEntry<String, dynamic> entry in sdata) {
                    Map<String, dynamic> workoutData = entry.value;

                    // Extract values
                    int caloriesBurnt = workoutData['caloriesBurnt'] ?? 0;
                    bool like = workoutData['like'] ?? false;
                    bool complete = workoutData['completed'] ?? [];
                    String name = workoutData['name'] ?? "assets/img/water.png";

                    // Add to respective lists
                    caloriesBurntList.add(caloriesBurnt);
                    likeList.add(like);
                    nameList.add(name);
                    targetCompletion.add(complete);
                  }

                  for (String searchElement in searchElements) {
                    int index = workOutArr.indexWhere(
                        (element) => element["title"] == searchElement);

                    if (index != -1) {
                      image.add(
                        workOutArr[index]['image'] ?? '',
                      );
                    } else {}
                  }

                  // finished-workout

                  // List<String> finishedName = [];
                  // List<String> finishedImage = [];

                  List<int> trueIndices = List<int>.generate(
                    targetCompletion.length,
                    (index) => index,
                  ).where((index) => targetCompletion[index]).toList();

                  return SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 25),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                TColor.primaryColor2.withOpacity(0.3),
                                TColor.primaryColor1.withOpacity(0.3)
                              ]),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Today Target",
                                      style: TextStyle(
                                          color: TColor.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: TColor.primaryG,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const WorkoutTrackerView()));
                                            },
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            textColor: TColor.primaryColor1,
                                            minWidth: double.maxFinite,
                                            elevation: 0,
                                            color: Colors.transparent,
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 15,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 93,
                                  child: ListView.builder(
                                    itemCount: image.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: SizedBox(
                                          width: 160,
                                          child: TodayTargetCell(
                                            //TODO: istead of checkbox go with tic icon
                                            isfinished: targetCompletion[index],
                                            icon: image[index],
                                            value: caloriesBurntList[index]
                                                .toString(),
                                            title: nameList[index],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                // const Row(
                                //   children: [
                                //     Expanded(
                                //       child: TodayTargetCell(
                                //         isfinished: true,
                                //         icon: "assets/img/water.png",
                                //         value: "8L",
                                //         title: "Water Intake",
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 15,
                                //     ),
                                //     Expanded(
                                //       child: TodayTargetCell(
                                //         isfinished: false,
                                //         icon: "assets/img/foot.png",
                                //         value: "2400",
                                //         title: "Foot Steps",
                                //       ),
                                //     ),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: media.width * 0.1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Activity  Progress",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  gradient:
                                      LinearGradient(colors: TColor.primaryG),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  "Weekly",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: TColor.white, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: media.width * 0.05,
                          ),
                          Container(
                            height: media.width * 0.5,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 0),
                            decoration: BoxDecoration(
                                color: TColor.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 3)
                                ]),
                            child: BarChart(BarChartData(
                              barTouchData: BarTouchData(
                                touchTooltipData: BarTouchTooltipData(
                                  tooltipBgColor: Colors.grey,
                                  tooltipHorizontalAlignment:
                                      FLHorizontalAlignment.right,
                                  tooltipMargin: 10,
                                  getTooltipItem:
                                      (group, groupIndex, rod, rodIndex) {
                                    String weekDay;
                                    switch (group.x) {
                                      case 0:
                                        weekDay = 'Monday';
                                        break;
                                      case 1:
                                        weekDay = 'Tuesday';
                                        break;
                                      case 2:
                                        weekDay = 'Wednesday';
                                        break;
                                      case 3:
                                        weekDay = 'Thursday';
                                        break;
                                      case 4:
                                        weekDay = 'Friday';
                                        break;
                                      case 5:
                                        weekDay = 'Saturday';
                                        break;
                                      case 6:
                                        weekDay = 'Sunday';
                                        break;
                                      default:
                                        throw Error();
                                    }
                                    return BarTooltipItem(
                                      '$weekDay\n',
                                      const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: (rod.toY - 1).toString(),
                                          style: TextStyle(
                                            color: TColor.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                touchCallback:
                                    (FlTouchEvent event, barTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        barTouchResponse == null ||
                                        barTouchResponse.spot == null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = barTouchResponse
                                        .spot!.touchedBarGroupIndex;
                                  });
                                },
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: getTitles,
                                    reservedSize: 38,
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              barGroups: showingGroups(),
                              gridData: FlGridData(show: false),
                            )),
                          ),
                          SizedBox(
                            height: media.width * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // TODO: pop from today target and push it to latest workout
                              Text(
                                "Finished Workout",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              TextButton(
                                onPressed: () {
                                  // TO DO function for see more
                                },
                                child: Text(
                                  "See More",
                                  style: TextStyle(
                                      color: TColor.gray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                          ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: trueIndices.length,
                              itemBuilder: (context, index) {
                                return LatestActivityRow(
                                  image: image[trueIndices[index]],
                                  name: nameList[trueIndices[index]],
                                  calories:
                                      caloriesBurntList[trueIndices[index]],
                                );
                              }),
                          SizedBox(
                            height: media.width * 0.1,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  // Handle the case when document or field does not exist
                  return const Center(
                      child: Text("No target Assigned for today"));
                }
              } else {
                return const SizedBox();
              }
            } else {
              return const SizedBox();
            }
          }),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    var style = TextStyle(
      color: TColor.gray,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Sun', style: style);
        break;
      case 1:
        text = Text('Mon', style: style);
        break;
      case 2:
        text = Text('Tue', style: style);
        break;
      case 3:
        text = Text('Wed', style: style);
        break;
      case 4:
        text = Text('Thu', style: style);
        break;
      case 5:
        text = Text('Fri', style: style);
        break;
      case 6:
        text = Text('Sat', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          // TODO: change Value here accordingly (maximum -20 Value)
          case 0:
            return makeGroupData(0, 20, TColor.primaryG,
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 10.5, TColor.secondaryG,
                isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, TColor.primaryG,
                isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, TColor.secondaryG,
                isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 15, TColor.primaryG,
                isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 5.5, TColor.secondaryG,
                isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 8.5, TColor.primaryG,
                isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartGroupData makeGroupData(
    int x,
    double y,
    List<Color> barColor, {
    bool isTouched = false,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          gradient: LinearGradient(
              colors: barColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.green)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: TColor.lightGray,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
