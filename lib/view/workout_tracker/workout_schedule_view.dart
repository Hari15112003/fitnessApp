import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/provider/firebase/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/colo_extension.dart';
import '../../common/common.dart';
import '../../common_widget/round_button.dart';
import 'add_schedule_view.dart';

class WorkoutScheduleView extends StatefulWidget {
  final bool like;
  final String workOutName;
  const WorkoutScheduleView({
    super.key,
    required this.like,
    required this.workOutName,
  });

  @override
  State<WorkoutScheduleView> createState() => _WorkoutScheduleViewState();
}

class _WorkoutScheduleViewState extends State<WorkoutScheduleView> {
  final CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  late DateTime _selectedDateAppBBar;

  List eventArr = [
    {
      "name": "Ab Workout",
      "start_time": "25/05/2023 07:30 AM",
    },
    {
      "name": "Upperbody Workout",
      "start_time": "25/05/2023 09:00 AM",
    },
    {
      "name": "Lowerbody Workout",
      "start_time": "25/05/2023 03:00 PM",
    },
    {
      "name": "Ab Workout",
      "start_time": "26/05/2023 07:30 AM",
    },
    {
      "name": "Upperbody Workout",
      "start_time": "26/05/2023 09:00 AM",
    },
    {
      "name": "Lowerbody Workout",
      "start_time": "26/05/2023 03:00 PM",
    },
    {
      "name": "Ab Workout",
      "start_time": "27/05/2023 07:30 AM",
    },
    {
      "name": "Upperbody Workout",
      "start_time": "27/05/2023 09:00 AM",
    },
    {
      "name": "Lowerbody Workout",
      "start_time": "27/05/2023 03:00 PM",
    }
  ];

  List selectDayEventArr = [];
  List<String> timeScheduled = [];

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    setDayEventWorkoutList();
  }

  void setDayEventWorkoutList() {
    var date = dateToStartDate(_selectedDateAppBBar);
    selectDayEventArr = eventArr.map((wObj) {
      return {
        "name": wObj["name"],
        "start_time": wObj["start_time"],
        "date": stringToDate(wObj["start_time"].toString(),
            formatStr: "dd/MM/yyyy hh:mm aa")
      };
    }).where((wObj) {
      return dateToStartDate(wObj["date"] as DateTime) == date;
    }).toList();

    if (mounted) {
      setState(() {});
    }
  }

  final collectionRef = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final ap = Provider.of<MyAuthProvider>(context, listen: false);
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
          "Workout Schedule",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: TColor.white,
      body: StreamBuilder<DocumentSnapshot>(
          stream: collectionRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("workout")
              .doc(_selectedDateAppBBar.month.toString())
              .snapshots(),
          builder: (context, snapshot) {
            List<String> image = [];

            List<int> caloriesBurntList = [];
            List<bool> likeList = [];
            List<bool> targetCompletion = [];
            List<String> nameList = [];
            List<dynamic> timefromDB = [];

            if (snapshot.hasData) {
              if (snapshot.data != null) {
                Map<String, dynamic>? prin =
                    snapshot.data?.data() as Map<String, dynamic>?;

                if (prin != null &&
                    prin.containsKey(
                        (_selectedDateAppBBar.day.toString()).toString())) {
                  Map<String, dynamic> docs =
                      snapshot.data!.get(_selectedDateAppBBar.day.toString());

                  List sdata = docs.entries.toList();
                  List<String> searchElements = docs.keys.toList();

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
                    timefromDB.add(timings.toList());
                    targetCompletion.add(complete);

                  }
                } else {
                  // return const SizedBox();
                }
              } else {
                // print(':sad');
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalendarAgenda(
                    controller: _calendarAgendaControllerAppBar,
                    appbar: false,
                    selectedDayPosition: SelectedDayPosition.center,
                    leading: IconButton(
                        onPressed: () {
                          if (DateTime.now().day > _selectedDateAppBBar.day) {
                            _calendarAgendaControllerAppBar.goToDay(
                              DateTime(
                                  _selectedDateAppBBar.year,
                                  _selectedDateAppBBar.month,
                                  _selectedDateAppBBar.day - 1),
                            );
                          }
                        },
                        icon: Image.asset(
                          "assets/img/ArrowLeft.png",
                          width: 15,
                          height: 15,
                        )),
                    training: IconButton(
                        onPressed: () {
                          if (DateTime.now().add(const Duration(days: 60)).day >
                              _selectedDateAppBBar.day) {
                            _calendarAgendaControllerAppBar.goToDay(DateTime(
                                _selectedDateAppBBar.year,
                                _selectedDateAppBBar.month,
                                _selectedDateAppBBar.day + 1));
                          }
                        },
                        icon: Image.asset(
                          "assets/img/ArrowRight.png",
                          width: 15,
                          height: 15,
                        )),
                    weekDay: WeekDay.short,
                    dayNameFontSize: 12,
                    dayNumberFontSize: 16,
                    dayBGColor: Colors.grey.withOpacity(0.15),
                    titleSpaceBetween: 15,
                    backgroundColor: Colors.transparent,
                    fullCalendarScroll: FullCalendarScroll.horizontal,
                    fullCalendarDay: WeekDay.short,
                    selectedDateColor: Colors.white,
                    dateColor: Colors.black,
                    locale: 'en',
                    initialDate: DateTime.now(),
                    calendarEventColor: TColor.primaryColor2,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 60)),
                    onDateSelected: (date) {
                      _selectedDateAppBBar = date;
                      setDayEventWorkoutList();
                    },
                    selectedDayLogo: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: TColor.primaryG,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  nameList.isNotEmpty
                      ? Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SizedBox(
                              width: media.width * 1.5,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: nameList.length,
                                itemBuilder: (context, index) {
                                  // var wObj = whatArr[index] as Map? ?? {};
                                  return Dismissible(
                                    // TODO: dismissble actions
                                    key: Key(nameList.toString()),
                                    onDismissed: (value) {
                                      // Remove the item from the data source.
                                      setState(() {
                                        nameList.remove(nameList[index]);
                                        // TODO: functions with firebase to remove the data
                                      });

                                      // Then show a snackbar.
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'The ${nameList[index]} has been Unscheduled'),
                                        ),
                                      );
                                    },
                                    // Show a red background as the item is swiped away.
                                    background: Container(
                                        color: Colors.red,
                                        child: const Icon(Icons.delete)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 20),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                TColor.primaryColor2
                                                    .withOpacity(0.3),
                                                TColor.primaryColor1
                                                    .withOpacity(0.3)
                                              ]),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        nameList[index]
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: TColor.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        timefromDB[index]
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: TColor.gray,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      width: 80,
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.54),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40),
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      child: Image.asset(
                                                        'assets/img/rd_1.png'
                                                            .toString(),
                                                        width: 90,
                                                        height: 90,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  );
                                },
                              ),
                              // child: ListView.separated(
                              //     shrinkWrap: true,
                              //     itemBuilder: (context, index) {
                              //       var availWidth = (media.width * 1.2) - (80 + 40);
                              //       var slotArr = selectDayEventArr.where((wObj) {
                              //         return (wObj["date"] as DateTime).hour == index;
                              //       }).toList();

                              //       return Container(
                              //         padding:
                              //             const EdgeInsets.symmetric(horizontal: 20),
                              //         height: 40,
                              //         child: Row(
                              //           mainAxisAlignment: MainAxisAlignment.start,
                              //           children: [
                              //             SizedBox(
                              //               width: 80,
                              //               child: Text(
                              //                 getTime(index * 60),
                              //                 style: TextStyle(
                              //                   color: TColor.black,
                              //                   fontSize: 12,
                              //                 ),
                              //               ),
                              //             ),
                              //             if (slotArr.isNotEmpty)
                              //               Expanded(
                              //                   child: Stack(
                              //                 alignment: Alignment.centerLeft,
                              //                 children: slotArr.map((sObj) {
                              //                   var min =
                              //                       (sObj["date"] as DateTime).minute;

                              //                   var pos = (min / 60) * 2 - 1;

                              //                   return Align(
                              //                     alignment: Alignment(pos, 0),
                              //                     child: InkWell(
                              //                       onTap: () {
                              //                         showDialog(
                              //                           context: context,
                              //                           builder: (context) {
                              //                             return AlertDialog(
                              //                               backgroundColor:
                              //                                   Colors.transparent,
                              //                               contentPadding:
                              //                                   EdgeInsets.zero,
                              //                               content: Container(
                              //                                 padding:
                              //                                     const EdgeInsets
                              //                                         .symmetric(
                              //                                         vertical: 15,
                              //                                         horizontal: 20),
                              //                                 decoration:
                              //                                     BoxDecoration(
                              //                                   color: TColor.white,
                              //                                   borderRadius:
                              //                                       BorderRadius
                              //                                           .circular(20),
                              //                                 ),
                              //                                 child: Column(
                              //                                   mainAxisSize:
                              //                                       MainAxisSize.min,
                              //                                   crossAxisAlignment:
                              //                                       CrossAxisAlignment
                              //                                           .start,
                              //                                   children: [
                              //                                     Row(
                              //                                       mainAxisAlignment:
                              //                                           MainAxisAlignment
                              //                                               .spaceBetween,
                              //                                       children: [
                              //                                         InkWell(
                              //                                           onTap: () {
                              //                                             Navigator.pop(
                              //                                                 context);
                              //                                           },
                              //                                           child:
                              //                                               Container(
                              //                                             margin:
                              //                                                 const EdgeInsets
                              //                                                     .all(
                              //                                                     8),
                              //                                             height: 40,
                              //                                             width: 40,
                              //                                             alignment:
                              //                                                 Alignment
                              //                                                     .center,
                              //                                             decoration: BoxDecoration(
                              //                                                 color: TColor
                              //                                                     .lightGray,
                              //                                                 borderRadius:
                              //                                                     BorderRadius.circular(10)),
                              //                                             child: Image
                              //                                                 .asset(
                              //                                               "assets/img/closed_btn.png",
                              //                                               width: 15,
                              //                                               height:
                              //                                                   15,
                              //                                               fit: BoxFit
                              //                                                   .contain,
                              //                                             ),
                              //                                           ),
                              //                                         ),
                              //                                         Text(
                              //                                           "Workout Schedule",
                              //                                           style: TextStyle(
                              //                                               color: TColor
                              //                                                   .black,
                              //                                               fontSize:
                              //                                                   16,
                              //                                               fontWeight:
                              //                                                   FontWeight
                              //                                                       .w700),
                              //                                         ),
                              //                                         InkWell(
                              //                                           onTap: () {},
                              //                                           child:
                              //                                               Container(
                              //                                             margin:
                              //                                                 const EdgeInsets
                              //                                                     .all(
                              //                                                     8),
                              //                                             height: 40,
                              //                                             width: 40,
                              //                                             alignment:
                              //                                                 Alignment
                              //                                                     .center,
                              //                                             decoration: BoxDecoration(
                              //                                                 color: TColor
                              //                                                     .lightGray,
                              //                                                 borderRadius:
                              //                                                     BorderRadius.circular(10)),
                              //                                             child: Image
                              //                                                 .asset(
                              //                                               "assets/img/more_btn.png",
                              //                                               width: 15,
                              //                                               height:
                              //                                                   15,
                              //                                               fit: BoxFit
                              //                                                   .contain,
                              //                                             ),
                              //                                           ),
                              //                                         )
                              //                                       ],
                              //                                     ),
                              //                                     const SizedBox(
                              //                                       height: 15,
                              //                                     ),
                              //                                     Text(
                              //                                       sObj["name"]
                              //                                           .toString(),
                              //                                       style: TextStyle(
                              //                                           color: TColor
                              //                                               .black,
                              //                                           fontSize: 14,
                              //                                           fontWeight:
                              //                                               FontWeight
                              //                                                   .w700),
                              //                                     ),
                              //                                     const SizedBox(
                              //                                       height: 4,
                              //                                     ),
                              //                                     Row(children: [
                              //                                       Image.asset(
                              //                                         "assets/img/time_workout.png",
                              //                                         height: 20,
                              //                                         width: 20,
                              //                                       ),
                              //                                       const SizedBox(
                              //                                         width: 8,
                              //                                       ),
                              //                                       Text(
                              //                                         "${getDayTitle(sObj["start_time"].toString())}|${getStringDateToOtherFormate(sObj["start_time"].toString(), outFormatStr: "h:mm aa")}",
                              //                                         style: TextStyle(
                              //                                             color: TColor
                              //                                                 .gray,
                              //                                             fontSize:
                              //                                                 12),
                              //                                       )
                              //                                     ]),
                              //                                     const SizedBox(
                              //                                       height: 15,
                              //                                     ),
                              //                                     RoundButton(
                              //                                         title:
                              //                                             "Mark Done",
                              //                                         onPressed:
                              //                                             () {}),
                              //                                   ],
                              //                                 ),
                              //                               ),
                              //                             );
                              //                           },
                              //                         );
                              //                       },
                              //                       child: Container(
                              //                         height: 35,
                              //                         width: availWidth * 0.5,
                              //                         padding:
                              //                             const EdgeInsets.symmetric(
                              //                                 horizontal: 8),
                              //                         alignment: Alignment.centerLeft,
                              //                         decoration: BoxDecoration(
                              //                           gradient: LinearGradient(
                              //                               colors:
                              //                                   TColor.secondaryG),
                              //                           borderRadius:
                              //                               BorderRadius.circular(
                              //                                   17.5),
                              //                         ),
                              //                         child: Text(
                              //                           "${sObj["name"].toString()}, ${getStringDateToOtherFormate(sObj["start_time"].toString(), outFormatStr: "h:mm aa")}",
                              //                           maxLines: 1,
                              //                           style: TextStyle(
                              //                             color: TColor.white,
                              //                             fontSize: 12,
                              //                           ),
                              //                         ),
                              //                       ),
                              //                     ),
                              //                   );
                              //                 }).toList(),
                              //               ))
                              //           ],
                              //         ),
                              //       );
                              //     },
                              //     separatorBuilder: (context, index) {
                              //       return Divider(
                              //         color: TColor.gray.withOpacity(0.2),
                              //         height: 1,
                              //       );
                              //     },
                              //     itemCount: 24),
                            ),
                          ),
                        )
                      : const Center(
                          child: Text("No Schedule has been made yet"),
                        ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          }),
      bottomSheet: SizedBox(
          width: 200,
          child: RoundButton(
              title: "Schedule it",
              onPressed: () {
                // if (_selectedDateAppBBar.toString().isNotEmpty) {
                //   ap.addWorkOutToFireBase(
                //       month: _selectedDateAppBBar.month.toString(),
                //       day: _selectedDateAppBBar.day.toString(),
                //       like: widget.like,
                //       name: widget.workOutName,
                //       difficultyLevel: "",
                //       times: timeScheduled,
                //       context: context);
                // } else {
                //   showSnackBar(
                //       context: context,
                //       content: "Please choose the perfect month");
                // }
              })),
      floatingActionButton: InkWell(
        onTap: () {
          var results = Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddScheduleView(
                        like: widget.like,
                        workOutName: widget.workOutName,
                        day: _selectedDateAppBBar.day.toString(),
                        month: _selectedDateAppBBar.month.toString(),
                        date: _selectedDateAppBBar,
                      )));
          results.then((value) {
            if (value[0].toString().isNotEmpty) {
              timeScheduled.add(value[0].toString());
            }
          });
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: TColor.secondaryG),
              borderRadius: BorderRadius.circular(27.5),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
              ]),
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            size: 20,
            color: TColor.white,
          ),
        ),
      ),
    );
  }
}
