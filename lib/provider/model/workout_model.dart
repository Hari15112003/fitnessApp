// import 'package:cloud_firestore/cloud_firestore.dart';

// class WorkoutData {
//   int caloriesBurnt;
//   bool completed;
//   String difficultyLevel;
//   bool like;
//   String name;
//   List<String> times;

//   WorkoutData({
//     required this.caloriesBurnt,
//     required this.completed,
//     required this.difficultyLevel,
//     required this.like,
//     required this.name,
//     required this.times,
//   });

//   factory WorkoutData.fromMap(Map<String, dynamic> map) {
//     return WorkoutData(
//       name: map['name'] ?? '',
//       caloriesBurnt: map['caloriesBurnt'] ?? 0,
//       completed: map['completed'] ?? false,
//       difficultyLevel: map['difficultyLevel'] ?? "Beginner",
//       times: [],
//       like: map['like'] ?? false,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'caloriesBurnt': caloriesBurnt,
//       'completed': completed,
//       'difficultyLevel': difficultyLevel,
//       'like': like,
//       'name': name,
//       'times': times,
//     };
//   }
// }

// class WorkoutMonth {
//   final Map<String, List<WorkoutData>> days;

//   WorkoutMonth({required this.days});

//   Map<String, dynamic> toMap() {
//     return {'days': days};
//   }
// }

// void addWorkoutData() {
//   // Replace 'your_collection_name' with your actual Firestore collection name
//   CollectionReference<Map<String, dynamic>> workouts =
//       FirebaseFirestore.instance.collection('your_collection_name');

//   // Replace '01' with the actual month identifier
//   String monthIdentifier = '01';

//   // Replace '01' with the actual day identifier
//   String dayIdentifier = '01';

//   // Example workout data
//   WorkoutData workout = WorkoutData(
//     caloriesBurnt: 200,
//     completed: true,
//     difficultyLevel: 'Intermediate',
//     like: true,
//     name: 'Full Body Workout',
//     times: ['12:00 AM', '05:00 PM'],
//   );

//   // Create or update the workout data for a specific day in a month
//   workouts.doc(monthIdentifier).set({
//     dayIdentifier: FieldValue.arrayUnion([workout.toMap()])
//   }, SetOptions(merge: true));
// }
