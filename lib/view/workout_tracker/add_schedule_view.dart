import 'package:fitness/provider/firebase/auth_provider.dart';
import 'package:fitness/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/colo_extension.dart';
import '../../common/common.dart';
import '../../common_widget/round_button.dart';

class AddScheduleView extends StatefulWidget {
  final DateTime date;
  final String month;
  final String workOutName;
  final String day;
  final bool like;
  const AddScheduleView(
      {super.key,
      required this.date,
      required this.month,
      required this.day,
      required this.workOutName,
      required this.like});

  @override
  State<AddScheduleView> createState() => _AddScheduleViewState();
}

class _AddScheduleViewState extends State<AddScheduleView> {
  String time = "${DateTime.now().hour}:${DateTime.now().minute}";
  String difficultyLevel = "Beginner";
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
              "assets/img/closed_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Add Schedule",
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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Image.asset(
                "assets/img/date.png",
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                dateToString(widget.date, formatStr: "E, dd MMMM yyyy"),
                style: TextStyle(color: TColor.gray, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Time",
            style: TextStyle(
                color: TColor.black, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: media.width * 0.35,
            child: CupertinoDatePicker(
              onDateTimeChanged: (newDate) {
                setState(() {
                  time = "${newDate.hour}:${newDate.minute}";
                });
              },
              initialDateTime: DateTime.now(),
              use24hFormat: false,
              minuteInterval: 1,
              mode: CupertinoDatePickerMode.time,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Details Workout",
            style: TextStyle(
                color: TColor.black, fontSize: 14, fontWeight: FontWeight.w500),
          ),

          // IconTitleNextRow(
          //     icon: "assets/img/choose_workout.png",
          //     title: "Choose Workout",
          //     time: "Upperbody",
          //     color: TColor.lightGray,
          //     onPressed: () {}),
          // const SizedBox(
          //   height: 10,
          // ),

          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            decoration: BoxDecoration(
              color: TColor.lightGray,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/img/difficulity.png",
                      width: 18,
                      height: 18,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Difficulty",
                      style: TextStyle(color: TColor.gray, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                      width: 120,
                      child: CupertinoPicker(
                          backgroundColor: TColor.lightGray,
                          itemExtent: 28,
                          useMagnifier: true,
                          onSelectedItemChanged: (value) {
                            String choose = "";
                            if (value == 0) {
                              choose = "Beginner";
                            } else if (value == 1) {
                              choose = "Intermediate";
                            } else if (value == 2) {
                              choose = "Advanced";
                            }
                            setState(() {
                              difficultyLevel = choose;
                            });
                          },
                          children: [
                            Text(
                              "Beginner",
                              style:
                                  TextStyle(color: TColor.gray, fontSize: 14),
                            ),
                            Text(
                              "Intermediate",
                              style:
                                  TextStyle(color: TColor.gray, fontSize: 14),
                            ),
                            Text(
                              "Advanced",
                              style:
                                  TextStyle(color: TColor.gray, fontSize: 14),
                            ),
                          ])),
                  const SizedBox(width: 8),
                ]),
          ),

          // IconTitleNextRow(
          //     icon: "assets/img/repetitions.png",
          //     title: "Custom Repetitions",
          //     time: "",
          //     color: TColor.lightGray,
          //     onPressed: () {}),
          // const SizedBox(
          //   height: 10,
          // ),
          // IconTitleNextRow(
          //     icon: "assets/img/repetitions.png",
          //     title: "Custom Weights",
          //     time: "",
          //     color: TColor.lightGray,
          //     onPressed: () {}
          // ),
          const Spacer(),
          RoundButton(
              title: "Save",
              onPressed: () {
                if (time.toString().isNotEmpty &&
                    difficultyLevel.toString().isNotEmpty) {
                  ap
                      .addWorkOutToFireBase(
                        completed: false,
                        level: difficultyLevel,
                        month: widget.month,
                        day: widget.day,
                        like: widget.like,
                        name: widget.workOutName,
                        times: time,
                        context: context,
                      )
                      .then((value) => Navigator.pop(
                          context, <String>[time, difficultyLevel].toList()));
                } else {
                  showSnackBar(
                      context: context,
                      content: "Please choose the perfect month");
                }
              }),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
