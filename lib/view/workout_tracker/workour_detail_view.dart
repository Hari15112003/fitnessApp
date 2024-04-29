import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/exercises_row.dart';
import 'package:fitness/common_widget/icon_title_next_row.dart';
import 'package:fitness/provider/firebase/auth_provider.dart';
import 'package:fitness/view/workout_tracker/exercises_stpe_details.dart';
import 'package:fitness/view/workout_tracker/workout_schedule_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutDetailView extends StatefulWidget {
  final Map dObj;
  final String forWhat;
  final int indexingRef;
  final String imagePath;

  final String workOutName;
  const WorkoutDetailView({
    super.key,
    required this.dObj,
    required this.workOutName,
    required this.forWhat,
    required this.indexingRef,
    required this.imagePath,
  });

  @override
  State<WorkoutDetailView> createState() => _WorkoutDetailViewState();
}

class _WorkoutDetailViewState extends State<WorkoutDetailView> {
  // List latestArr = [
  //   {
  //     "image": "assets/img/Workout2.png",
  //     "title": "Fullbody Workout",
  //     "time": "Today, 03:00pm"
  //   },
  //   {
  //     "image": "assets/img/Workout2.png",
  //     "title": "Upperbody Workout",
  //     "time": "June 05, 02:00pm"
  //   },
  // ];

  // needed array

  List<dynamic> neededThingsArray = [
    // 0-full body
    [
      {"image": "assets/img/barbell.png", "title": "Barbell"},
      {"image": "assets/photos/dumbbells.png", "title": "Dumbbells"},
      {"image": "assets/photos/bench.png", "title": "Bench"},
      {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
    ],
    // 1-upper
    [
      {"image": "assets/photos/dumbbells.png", "title": "Dumbbells"},
      {"image": "assets/photos/pullup.png", "title": "Pull-up Bar"},
      {"image": "assets/photos/bench.png", "title": "Bench"},
      {"image": "assets/img/barbell.png", "title": "Barbell"},
      {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
    ],
    // 2 -lower
    [
      {"image": "assets/img/barbell.png", "title": "Barbell"},
      {"image": "assets/photos/dumbbells.png", "title": "Dumbbells"},
      {"image": "assets/photos/kettle.png", "title": "Kettlebell"},
      {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
    ],
    // 3 -abs
    [
      {"image": "assets/photos/bosu.png", "title": "Bosu Ball"},
      {"image": "assets/photos/mat.png", "title": "Exercise Mat"},
      {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
    ],
    // 4 -leg
    [
      {"image": "assets/img/barbell.png", "title": "Barbell"},
      {"image": "assets/photos/dumbbells.png", "title": "Dumbbells"},
      {"image": "assets/photos/legpress.png", "title": "Leg Press Machine"},
      {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
    ],
// 5-  chest
    [
      {"image": "assets/img/barbell.png", "title": "Barbell"},
      {"image": "assets/photos/bench.png", "title": "Bench"},
      {"image": "assets/photos/dumbbells.png", "title": "Dumbbells"},
      {"image": "assets/photos/medicine.png", "title": "Medicine Ball"},
      {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
    ],
// 6- shoulder
    [
      {"image": "assets/img/barbell.png", "title": "Barbell"},
      {"image": "assets/photos/dumbbells.png", "title": "Dumbbells"},
      {"image": "assets/photos/medicine.png", "title": "Medicine Ball"},
      {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
    ],
// 7-arm
    [
      {"image": "assets/img/barbell.png", "title": "Barbell"},
      {"image": "assets/photos/dumbbells.png", "title": "Dumbbells"},
      {
        "image": "assets/photos/resistanceband.png",
        "title": "Resistance Bands"
      },
      {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
    ],
// 8 -back
    [
      {"image": "assets/img/barbell.png", "title": "Barbell"},
      {"image": "assets/photos/dumbbells.png", "title": "Dumbbells"},
      {
        "image": "assets/photos/resistanceband.png",
        "title": "Resistance Bands"
      },
      {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
    ],
// 9 -plyom
    [
      {"image": "assets/img/skipping_rope.png", "title": "Jump Rope"},
      {"image": "assets/photos/medicine.png", "title": "Medicine Ball"},
      {"image": "assets/photos/bench.png", "title": "Bench"},
      {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
    ],
  ];
  List exercisesArr = [
    {
      "name": "FullBody WorkOut",
      "set": [
        {
          "image": "assets/fullbody/squats.png",
          "title": "Squats",
          "value": "05:00"
        },
        {
          "image": "assets/fullbody/deadlifts.png",
          "title": "Deadlifts",
          "value": "15x"
        },
        {
          "image": "assets/fullbody/benchpress.png",
          "title": "Benchpress",
          "value": "20x"
        },
        {
          "image": "assets/fullbody/pullups.png",
          "title": "Pull ups",
          "value": "00:53"
        },
        {
          "image": "assets/fullbody/overhead.png",
          "title": "Overhead",
          "value": "02:00"
        },
        {"image": "assets/img/img_2.png", "title": "Lunges", "value": "02:00"},
        {
          "image": "assets/fullbody/planks.png",
          "title": "Planks",
          "value": "20x"
        },
        {
          "image": "assets/fullbody/russian.png",
          "title": "Russian Twists",
          "value": "30x"
        },
        {
          "image": "assets/fullbody/kettle.png",
          "title": "Kettlebell Swings",
          "value": "20x"
        },
        {
          "image": "assets/fullbody/buepess.png",
          "title": "Burpees",
          "value": "20x"
        },
        {
          "image": "assets/fullbody/boxjumps.png",
          "title": "Box Jumps",
          "value": "20x"
        },
        {
          "image": "assets/fullbody/medicine.png",
          "title": "Medicine Ball Slams",
          "value": "20x"
        },
      ],
    },
    //2 workout
    {
      "name": "UpperBody WorkOut",
      "set": [
        {
          "image": "assets/fullbody/squats.png",
          "title": "Push-ups",
          "value": "20x"
        },
        {
          "image": "assets/fullbody/pullups.png",
          "title": "Pull-ups",
          "value": "18x"
        },
        {
          "image": "assets/fullbody/overhead.png",
          "title": "Overhead Press",
          "value": "20x"
        },
        {
          "image": "assets/fullbody/benchpress.png",
          "title": "Bench Press",
          "value": "22x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Dumbbell Flyes",
          "value": "20x"
        },
        {
          "image": "assets/fullbody/buepess.png",
          "title": "Lat Pulldowns",
          "value": "20x"
        },
        {
          "image": "assets/fullbody/boxjumps.png",
          "title": "Bent Over Rows",
          "value": "25x"
        },
        {
          "image": "assets/fullbody/medicine.png",
          "title": "Bicep Curls",
          "value": "20x"
        },
        {
          "image": "assets/fullbody/kettle.png",
          "title": "Tricep Dips",
          "value": "20x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Hammer Curls",
          "value": "21x"
        },
        {
          "image": "assets/fullbody/planks.png",
          "title": "Lateral Raises",
          "value": "20x"
        },
        {
          "image": "assets/fullbody/deadlifts.png",
          "title": "Front Raises",
          "value": "20x"
        },
      ]
    },
    //3 workout
    {
      "name": "LowerBody WorkOut",
      "set": [
        {"image": "assets/img/img_2.png", "title": "Squats", "value": "02:00"},
        {"image": "assets/img/img_2.png", "title": "Deadlifts", "value": "29x"},
        {"image": "assets/img/img_2.png", "title": "Lunges", "value": "29x"},
        {"image": "assets/img/img_2.png", "title": "Leg Press", "value": "29x"},
        {"image": "assets/img/img_2.png", "title": "Leg Curls", "value": "29x"},
        {
          "image": "assets/img/img_2.png",
          "title": "Bodyweight Squats",
          "value": "29x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Bulgarian Split Squats",
          "value": "29x"
        },
        {"image": "assets/img/img_2.png", "title": "Box Jumps", "value": "29x"},
        {
          "image": "assets/img/img_2.png",
          "title": "Calf Raises",
          "value": "15x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Glute Bridges",
          "value": "15x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Side Lunges",
          "value": "15x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Step-Ups",
          "value": "02:00"
        },
      ]
    },
    // 4 workout
    {
      "name": "Abs WorkOut",
      "set": [
        {"image": "assets/img/img_2.png", "title": "Crunches", "value": "18x"},
        {"image": "assets/img/img_2.png", "title": "Planks", "value": "18x"},
        {
          "image": "assets/img/img_2.png",
          "title": "Russian Twists",
          "value": "02:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Bicycle Crunches",
          "value": "17x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Hanging Leg Raises",
          "value": "17x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Ab Rollouts",
          "value": "17x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Mountain Climbers",
          "value": "12x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Reverse Crunches",
          "value": "12x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Woodchoppers",
          "value": "12x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Flutter Kicks",
          "value": "13x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Side Planks",
          "value": "13x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Toe Touches",
          "value": "13x"
        },
      ]
    },
    // 4 workout
    {
      "name": "Leg WorkOut",
      "set": [
        {"image": "assets/img/img_2.png", "title": "Squats", "value": "13x"},
        {"image": "assets/img/img_2.png", "title": "Lunges", "value": "02:00"},
        {"image": "assets/img/img_2.png", "title": "Leg Press", "value": "16x"},
        {"image": "assets/img/img_2.png", "title": "Leg Curls", "value": "16x"},
        {
          "image": "assets/img/img_2.png",
          "title": "Bulgarian Split Squats",
          "value": "16x"
        },
        {"image": "assets/img/img_2.png", "title": "Box Jumps", "value": "16x"},
        {
          "image": "assets/img/img_2.png",
          "title": "Calf Raises",
          "value": "16x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Glute Bridges",
          "value": "14x"
        },
        {"image": "assets/img/img_2.png", "title": "Step-Ups", "value": "14x"},
        {"image": "assets/img/img_2.png", "title": "Deadlifts", "value": "14x"},
        {
          "image": "assets/img/img_2.png",
          "title": "Side Lunges",
          "value": "14x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Sumo Squats",
          "value": "19x"
        },
      ],
    },
    // 5 - workout
    {
      "name": "Chest WorkOut",
      "set": [
        {
          "image": "assets/img/img_2.png",
          "title": "Bench Press",
          "value": "19x"
        },
        {"image": "assets/img/img_2.png", "title": "Push-ups", "value": "19x"},
        {
          "image": "assets/img/img_2.png",
          "title": "Dumbbell Flyes",
          "value": "19x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Cable Crossover",
          "value": "02:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Incline Bench Press",
          "value": "02:20"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Chest Dips",
          "value": "02:20"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Chest Press Machine",
          "value": "02:20"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Pec Deck Machine",
          "value": "02:20"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Medicine Ball Chest Pass",
          "value": "02:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Plyometric Push-ups",
          "value": "02:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Decline Bench Press",
          "value": "04:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Squeeze Press",
          "value": "04:00"
        },
      ],
    },
    // 7
    {
      "name": "Shoulder WorkOut",
      "set": [
        {
          "image": "assets/img/img_2.png",
          "title": "Overhead Press",
          "value": "04:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Lateral Raises",
          "value": "04:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Front Raises",
          "value": "04:00"
        },
        {"image": "assets/img/img_2.png", "title": "Shrugs", "value": "04:00"},
        {
          "image": "assets/img/img_2.png",
          "title": "Upright Rows",
          "value": "02:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Face Pulls",
          "value": "02:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Reverse Flyes",
          "value": "09:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Seated Dumbbell Press",
          "value": "09:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Arnold Press",
          "value": "09:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Lateral Dumbbell Raises",
          "value": "09:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Barbell Shoulder Press",
          "value": "09:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Cuban Press",
          "value": "09:00"
        },
      ]
    },
    // 8
    {
      "name": "Arm WorkOut",
      "set": [
        {
          "image": "assets/img/img_2.png",
          "title": "Bicep Curls",
          "value": "09:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Tricep Dips",
          "value": "09:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Hammer Curls",
          "value": "17x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Skull Crushers",
          "value": "17x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Preacher Curls",
          "value": "17x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Tricep Kickbacks",
          "value": "17x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Concentration Curls",
          "value": "17x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Diamond Push-ups",
          "value": "17x"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Barbell Curl",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Overhead Tricep Extension",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Cable Hammer Curls",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Close Grip Bench Press",
          "value": "05:00"
        },
      ]
    },

    // 9
    {
      "name": "Back WorkOut",
      "set": [
        {
          "image": "assets/img/img_2.png",
          "title": "Lat Pulldowns",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Bent Over Rows",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "T-Bar Rows",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Pull-ups",
          "value": "02:00"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Deadlifts",
          "value": "06:20"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Face Pulls",
          "value": "06:20"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Cable Rows",
          "value": "06:20"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Single-Arm Dumbbell Rows",
          "value": "06:20"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Seated Cable Rows",
          "value": "06:20"
        },
        {
          "image": "assets/img/img_2.png",
          "title": "Hyperextensions",
          "value": "06:20"
        },
        {
          "image": "assets/img/img_2.png",
          "title": 'Reverse Flyes',
          "value": "06:20"
        },
        {
          "image": "assets/img/img_2.png",
          "title": 'Deadlift Variations',
          "value": "06:20"
        },
      ]
    },
    // 10
    {
      "name": "Plyometric WorkOut",
      "set": [
        {
          "image": "assets/img/img_1.png",
          "title": "Box Jumps",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Jumping Lunges",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Plyometric Push-ups",
          "value": "05:00"
        },
        {"image": "assets/img/img_1.png", "title": "Burpees", "value": "05:00"},
        {
          "image": "assets/img/img_1.png",
          "title": "Jump Squats",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Medicine Ball Slams",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Jump Rope",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Jumping Jacks",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "High Knees",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Broad Jumps",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Depth Jumps",
          "value": "05:00"
        },
        {
          "image": "assets/img/img_1.png",
          "title": "Lateral Box Jumps",
          "value": "05:00"
        },
      ],
    }
  ];

  // List exercisesArr = [
  //   {
  //     "name": "Set 1",
  //     "set": [
  //       {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
  //       {
  //         "image": "assets/img/img_2.png",
  //         "title": "Jumping Jack",
  //         "value": "12x"
  //       },
  //       {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
  //       {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
  //       {
  //         "image": "assets/img/img_1.png",
  //         "title": "Arm Raises",
  //         "value": "00:53"
  //       },
  //       {
  //         "image": "assets/img/img_2.png",
  //         "title": "Rest and Drink",
  //         "value": "06:20"
  //       },
  //     ],
  //   },
  //   {
  //     "name": "Set 2",
  //     "set": [
  //       {"image": "assets/img/img_1.png", "title": "Warm Up", "value": "05:00"},
  //       {
  //         "image": "assets/img/img_2.png",
  //         "title": "Jumping Jack",
  //         "value": "12x"
  //       },
  //       {"image": "assets/img/img_1.png", "title": "Skipping", "value": "15x"},
  //       {"image": "assets/img/img_2.png", "title": "Squats", "value": "20x"},
  //       {
  //         "image": "assets/img/img_1.png",
  //         "title": "Arm Raises",
  //         "value": "00:53"
  //       },
  //       {
  //         "image": "assets/img/img_2.png",
  //         "title": "Rest and Drink",
  //         "value": "02:00"
  //       },
  //     ],
  //   }
  // ];
  final String workOutScheduled = "Fullbody Workout";
  bool isfavorite = false;
  final collectionRef = FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final ap = Provider.of<MyAuthProvider>(context, listen: false);
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: TColor.primaryG)),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
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
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: media.width * 0.5,
              flexibleSpace: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  widget.imagePath,
                  // "assets/img/detail_top.png",
                  width: media.width * 0.75,
                  height: media.width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ];
        },
        body: StreamBuilder<DocumentSnapshot>(
            // to implement stream builder
            stream: collectionRef
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection("workout")
                .doc(DateTime.now().month.toString())
                .snapshots(),
            builder: (context, snapshot) {
              // cjw
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  Map<String, dynamic>? prin =
                      snapshot.data?.data() as Map<String, dynamic>?;

                  if (prin != null &&
                      prin.containsKey((DateTime.now().day).toString())) {
                    Map<String, dynamic> docs =
                        snapshot.data!.get(DateTime.now().day.toString());
                    List<String> searchElements = docs.keys.toList();

                    if (searchElements.contains(widget.workOutName)) {
                      var somethingLike = (docs[widget.workOutName]['like']);
                      if (somethingLike != null) {
                        isfavorite = somethingLike as bool;
                      }
                    }
                  } else {
                    isfavorite = false;
                  }
                } else {
                  isfavorite = false;
                }
              } else {
                isfavorite = false;
              }

              // :d'
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 50,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: TColor.gray.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            SizedBox(
                              height: media.width * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.dObj["title"].toString(),
                                        style: TextStyle(
                                            color: TColor.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "12 Exericses | Today | 320 Calories Burn",
                                        style: TextStyle(
                                            color: TColor.gray, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                widget.forWhat == 'view'
                                    ? const SizedBox()
                                    : TextButton(
                                        onPressed: () async {
                                          await ap.updatelikeStatusFireBase(
                                              context: context,
                                              like: !isfavorite,
                                              workOutName: widget.workOutName);
                                          setState(() {
                                            isfavorite = !isfavorite;
                                          });
                                        },
                                        child: Icon(
                                          isfavorite == true
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: isfavorite == true
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                        // child: Image.asset(
                                        //   isfavorite
                                        //       ? "assets/img/fav.png"
                                        //       : "assets/img/fav.png",
                                        //   width: 15,
                                        //   height: 15,
                                        //   fit: BoxFit.contain,
                                        // ),
                                      )
                              ],
                            ),
                            SizedBox(
                              height: media.width * 0.05,
                            ),
                            widget.forWhat == "view"
                                ? IconTitleNextRow(
                                    icon: "assets/img/time.png",
                                    title: "Schedule Workout",
                                    time: "",
                                    color:
                                        TColor.primaryColor2.withOpacity(0.3),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WorkoutScheduleView(
                                                    workOutName:
                                                        widget.workOutName,
                                                    like: isfavorite,
                                                  )));
                                    })
                                : const SizedBox(),
                            SizedBox(
                              height: media.width * 0.02,
                            ),
                            // TODO: implement begginer, advance etc,..(to show here )
                            // IconTitleNextRow(
                            //     icon: "assets/img/difficulity.png",
                            //     title: "Difficulity",
                            //     time: "Beginner",
                            //     color: TColor.secondaryColor2.withOpacity(0.3),
                            //     onPressed: () {}),
                            SizedBox(
                              height: media.width * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "You'll Need",
                                  style: TextStyle(
                                      color: TColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "${neededThingsArray[widget.indexingRef].length} Items",
                                    style: TextStyle(
                                        color: TColor.gray, fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: media.width * 0.5,
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount:
                                      neededThingsArray[widget.indexingRef]
                                          .length,
                                  itemBuilder: (context, index) {
                                    var yObj =
                                        neededThingsArray[widget.indexingRef]
                                                [index] as Map? ??
                                            {};
                                    return Container(
                                        margin: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: media.width * 0.35,
                                              width: media.width * 0.35,
                                              decoration: BoxDecoration(
                                                  color: TColor.lightGray,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                yObj["image"].toString(),
                                                width: media.width * 0.2,
                                                height: media.width * 0.2,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                yObj["title"].toString(),
                                                style: TextStyle(
                                                    color: TColor.black,
                                                    fontSize: 12),
                                              ),
                                            )
                                          ],
                                        ));
                                  }),
                            ),
                            SizedBox(
                              height: media.width * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Exercises",
                                  style: TextStyle(
                                      color: TColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "${exercisesArr[widget.indexingRef]['set'].length} Exercises",
                                    style: TextStyle(
                                        color: TColor.gray, fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                            ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: exercisesArr[widget.indexingRef]
                                        ['set']
                                    .length,
                                itemBuilder: (context, index) {
                                  var sObj = exercisesArr[widget.indexingRef]
                                          ['set'][index] as Map? ??
                                      {};
                                  return ExercisesRow(
                                    eObj: sObj,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ExercisesStepDetails(
                                            whatFor: widget.forWhat,
                                            workoutName: widget.workOutName,
                                            workoutIndex: widget.indexingRef,
                                            exerciseIndex: index,
                                            eObj: sObj,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                            SizedBox(
                              height: media.width * 0.1,
                            ),
                          ],
                        ),
                      ),
                      // SafeArea(
                      //   child: Column(
                      //     mainAxisSize: MainAxisSize.max,
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       // TODO:

                      //       RoundButton(
                      //           title: workOutScheduled == "Fullbody Workou"
                      //               ? "Start Workout"
                      //               : "Schedule Workout",
                      //           onPressed: () {})
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
