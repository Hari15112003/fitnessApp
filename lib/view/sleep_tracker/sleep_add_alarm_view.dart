// import 'package:alarm/alarm.dart';
// import 'package:animated_toggle_switch/animated_toggle_switch.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../common/colo_extension.dart';
// import '../../common_widget/icon_title_next_row.dart';
// import '../../common_widget/round_button.dart';

// class SleepAddAlarmView extends StatefulWidget {
//   final AlarmSettings? alarmSettings;
//   const SleepAddAlarmView({super.key, this.alarmSettings});

//   @override
//   State<SleepAddAlarmView> createState() => _SleepAddAlarmViewState();
// }

// class _SleepAddAlarmViewState extends State<SleepAddAlarmView> {
//   bool loading = false;
//   String bedTime = "09:00 PM";
//   String alarmTime = "05:30 AM";

//   late bool creating;

//   String timeChoosenFor = "bedtime";
//   late DateTime selectedDateTime;
//   late double? volume;

//   bool loop = false;
//   bool vibrate = false;

//   late String assetAudio = "Marimba";

//   @override
//   void initState() {
//     super.initState();
//     creating = widget.alarmSettings == null;

//     if (creating) {
//       selectedDateTime = DateTime.now().add(const Duration(minutes: 1));
//       selectedDateTime = selectedDateTime.copyWith(second: 0, millisecond: 0);
//       loop = true;
//       vibrate = true;
//       volume = null;
//       assetAudio = 'assets/alarm/marimba.mp3';
//     } else {
//       selectedDateTime = widget.alarmSettings!.dateTime;
//       loop = widget.alarmSettings!.loopAudio;
//       vibrate = widget.alarmSettings!.vibrate;
//       volume = widget.alarmSettings!.volume;
//       assetAudio = widget.alarmSettings!.assetAudioPath;
//     }
//   }

//   String getDay() {
//     final now = DateTime.now();
//     final today = DateTime(now.year, now.month, now.day);
//     final difference = selectedDateTime.difference(today).inDays;

//     switch (difference) {
//       case 0:
//         return 'Today';
//       case 1:
//         return 'Tomorrow';
//       case 2:
//         return 'After tomorrow';
//       default:
//         return 'In $difference days';
//     }
//   }

//   Future<void> pickTime() async {
//     final res = await showTimePicker(
//       initialTime: TimeOfDay.fromDateTime(selectedDateTime),
//       context: context,
//     );

//     if (res != null) {
//       setState(() {
//         final DateTime now = DateTime.now();
//         selectedDateTime = now.copyWith(
//             hour: res.hour,
//             minute: res.minute,
//             second: 0,
//             millisecond: 0,
//             microsecond: 0);
//         if (selectedDateTime.isBefore(now)) {
//           selectedDateTime = selectedDateTime.add(const Duration(days: 1));
//         }
//       });
//     }
//   }

//   AlarmSettings buildAlarmSettings() {
//     final id = creating
//         ? DateTime.now().millisecondsSinceEpoch % 10000
//         : widget.alarmSettings!.id;

//     final alarmSettings = AlarmSettings(
//       id: id,
//       dateTime: selectedDateTime,
//       loopAudio: loop,
//       vibrate: vibrate,
//       volume: volume,
//       assetAudioPath: assetAudio,
//       notificationTitle: 'Fitness',
//       notificationBody:
//           'Your alarm ${selectedDateTime.hour}: ${selectedDateTime.minute} is ringing',
//     );
//     return alarmSettings;
//   }

//   void saveAlarm() {
//     if (loading) return;
//     setState(() => loading = true);
//     Alarm.set(alarmSettings: buildAlarmSettings()).then((res) {
//       if (res) Navigator.pop(context, true);
//       setState(() => loading = false);
//     });
//   }

//   void deleteAlarm() {
//     Alarm.stop(widget.alarmSettings!.id).then((res) {
//       if (res) Navigator.pop(context, true);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: TColor.white,
//         centerTitle: true,
//         elevation: 0,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Container(
//             margin: const EdgeInsets.all(8),
//             height: 40,
//             width: 40,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 color: TColor.lightGray,
//                 borderRadius: BorderRadius.circular(10)),
//             child: Image.asset(
//               "assets/img/closed_btn.png",
//               width: 15,
//               height: 15,
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//         title: Text(
//           "Add Alarm",
//           style: TextStyle(
//               color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
//         ),
//         // actions: [
//         //   InkWell(
//         //     onTap: () {},
//         //     child: Container(
//         //       margin: const EdgeInsets.all(8),
//         //       height: 40,
//         //       width: 40,
//         //       alignment: Alignment.center,
//         //       decoration: BoxDecoration(
//         //           color: TColor.lightGray,
//         //           borderRadius: BorderRadius.circular(10)),
//         //       child: Image.asset(
//         //         "assets/img/more_btn.png",
//         //         width: 15,
//         //         height: 15,
//         //         fit: BoxFit.contain,
//         //       ),
//         //     ),
//         //   )
//         // ],
//       ),
//       backgroundColor: TColor.white,
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           const SizedBox(
//             height: 8,
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//             decoration: BoxDecoration(
//               color: TColor.lightGray,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 30,
//                     height: 30,
//                     alignment: Alignment.center,
//                     child: Image.asset(
//                       "assets/img/difficulity.png",
//                       width: 18,
//                       height: 18,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       "Choose timing",
//                       style: TextStyle(color: TColor.gray, fontSize: 12),
//                     ),
//                   ),
//                   SizedBox(
//                       width: 120,
//                       child: CupertinoPicker(
//                           backgroundColor: TColor.lightGray,
//                           itemExtent: 28,
//                           useMagnifier: true,
//                           onSelectedItemChanged: (value) {
//                             String choose = "";
//                             if (value == 0) {
//                               choose = "Bedtime";
//                             } else if (value == 1) {
//                               choose = "Alarm time";
//                             }
//                             setState(() {
//                               timeChoosenFor = choose;
//                             });
//                           },
//                           children: [
//                             Text(
//                               "Bedtime",
//                               style:
//                                   TextStyle(color: TColor.gray, fontSize: 14),
//                             ),
//                             Text(
//                               "Alarmtime",
//                               style:
//                                   TextStyle(color: TColor.gray, fontSize: 14),
//                             ),
//                           ])),
//                   const SizedBox(width: 8),
//                 ]),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           timeChoosenFor == "bedtime"
//               ? IconTitleNextRow(
//                   icon: "assets/img/Bed_Add.png",
//                   title: "Bedtime",
//                   time: bedTime,
//                   color: TColor.lightGray,
//                   onPressed: () async {
//                     pickTime();
//                     // await showingTimePicker(context: context);
//                     setState(() {});
//                   })
//               : IconTitleNextRow(
//                   icon: "assets/img/HoursTime.png",
//                   title: "Alarm Time",
//                   time: alarmTime,
//                   color: TColor.lightGray,
//                   onPressed: () async {
//                     pickTime();
//                     // alarmTime = await showingTimePicker(context: context);
//                     setState(() {});
//                   }),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             decoration: BoxDecoration(
//               color: TColor.lightGray,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 Container(
//                   width: 30,
//                   height: 30,
//                   alignment: Alignment.center,
//                   child: Image.asset(
//                     "assets/img/Vibrate.png",
//                     width: 18,
//                     height: 18,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     "Vibrate When Alarm assetAudio",
//                     style: TextStyle(color: TColor.gray, fontSize: 12),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                   child: Transform.scale(
//                     scale: 0.7,
//                     child: CustomAnimatedToggleSwitch<bool>(
//                       current: vibrate,
//                       values: const [false, true],
//                       dif: 0.0,
//                       indicatorSize: const Size.square(30.0),
//                       animationDuration: const Duration(milliseconds: 200),
//                       animationCurve: Curves.linear,
//                       onChanged: (b) => setState(() => vibrate = b),
//                       iconBuilder: (context, local, global) {
//                         return const SizedBox();
//                       },
//                       defaultCursor: SystemMouseCursors.click,
//                       onTap: () => setState(() => vibrate = !vibrate),
//                       iconsTappable: false,
//                       wrapperBuilder: (context, global, child) {
//                         return Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Positioned(
//                                 left: 10.0,
//                                 right: 10.0,
//                                 height: 30.0,
//                                 child: DecoratedBox(
//                                   decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                         colors: TColor.secondaryG),
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(50.0)),
//                                   ),
//                                 )),
//                             child,
//                           ],
//                         );
//                       },
//                       foregroundIndicatorBuilder: (context, global) {
//                         return SizedBox.fromSize(
//                           size: const Size(10, 10),
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                               color: TColor.white,
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(50.0)),
//                               boxShadow: const [
//                                 BoxShadow(
//                                     color: Colors.black38,
//                                     spreadRadius: 0.05,
//                                     blurRadius: 1.1,
//                                     offset: Offset(0.0, 0.8))
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             decoration: BoxDecoration(
//               color: TColor.lightGray,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 Container(
//                   width: 30,
//                   height: 30,
//                   alignment: Alignment.center,
//                   child: Image.asset(
//                     "assets/img/Vibrate.png",
//                     width: 18,
//                     height: 18,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     "Loop alarm audio",
//                     style: TextStyle(color: TColor.gray, fontSize: 12),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                   child: Transform.scale(
//                     scale: 0.7,
//                     child: CustomAnimatedToggleSwitch<bool>(
//                       current: loop,
//                       values: const [false, true],
//                       dif: 0.0,
//                       indicatorSize: const Size.square(30.0),
//                       animationDuration: const Duration(milliseconds: 200),
//                       animationCurve: Curves.linear,
//                       onChanged: (b) => setState(() => loop = b),
//                       iconBuilder: (context, local, global) {
//                         return const SizedBox();
//                       },
//                       defaultCursor: SystemMouseCursors.click,
//                       onTap: () => setState(() => loop = !loop),
//                       iconsTappable: false,
//                       wrapperBuilder: (context, global, child) {
//                         return Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Positioned(
//                                 left: 10.0,
//                                 right: 10.0,
//                                 height: 30.0,
//                                 child: DecoratedBox(
//                                   decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                         colors: TColor.secondaryG),
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(50.0)),
//                                   ),
//                                 )),
//                             child,
//                           ],
//                         );
//                       },
//                       foregroundIndicatorBuilder: (context, global) {
//                         return SizedBox.fromSize(
//                           size: const Size(10, 10),
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                               color: TColor.white,
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(50.0)),
//                               boxShadow: const [
//                                 BoxShadow(
//                                     color: Colors.black38,
//                                     spreadRadius: 0.05,
//                                     blurRadius: 1.1,
//                                     offset: Offset(0.0, 0.8))
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//             decoration: BoxDecoration(
//               color: TColor.lightGray,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 30,
//                     height: 30,
//                     alignment: Alignment.center,
//                     child: Image.asset(
//                       "assets/img/difficulity.png",
//                       width: 18,
//                       height: 18,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       "assetAudio",
//                       style: TextStyle(color: TColor.gray, fontSize: 12),
//                     ),
//                   ),
//                   SizedBox(
//                       width: 120,
//                       child: CupertinoPicker(
//                           backgroundColor: TColor.lightGray,
//                           itemExtent: 28,
//                           useMagnifier: true,
//                           onSelectedItemChanged: (value) {
//                             String choose = "";
//                             if (value == 0) {
//                               choose = "assets/alarm/marimba.mp3";
//                             } else if (value == 1) {
//                               choose = "assets/alarm/nokia.mp3";
//                             } else if (value == 2) {
//                               choose = "assets/alarm/mozart.mp3";
//                             } else if (value == 3) {
//                               choose = "assets/alarm/star_wars.mp3";
//                             } else if (value == 4) {
//                               choose = "assets/alarm/one_piece.mp3";
//                             }
//                             setState(() {
//                               assetAudio = choose;
//                             });
//                           },
//                           children: [
//                             Text(
//                               "Marimba",
//                               style:
//                                   TextStyle(color: TColor.gray, fontSize: 14),
//                             ),
//                             Text(
//                               "Nokia",
//                               style:
//                                   TextStyle(color: TColor.gray, fontSize: 14),
//                             ),
//                             Text(
//                               'Mozart',
//                               style:
//                                   TextStyle(color: TColor.gray, fontSize: 14),
//                             ),
//                             Text(
//                               "Star Wars",
//                               style:
//                                   TextStyle(color: TColor.gray, fontSize: 14),
//                             ),
//                             Text(
//                               'One Piece',
//                               style:
//                                   TextStyle(color: TColor.gray, fontSize: 14),
//                             ),
//                           ])),
//                   const SizedBox(width: 8),
//                 ]),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             decoration: BoxDecoration(
//               color: TColor.lightGray,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 Container(
//                   width: 30,
//                   height: 30,
//                   alignment: Alignment.center,
//                   child: Image.asset(
//                     "assets/img/Vibrate.png",
//                     width: 18,
//                     height: 18,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Text(
//                     "Custom Volume",
//                     style: TextStyle(color: TColor.gray, fontSize: 12),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                   child: Transform.scale(
//                     scale: 0.7,
//                     child: CustomAnimatedToggleSwitch<bool>(
//                       current: volume != null,
//                       values: const [false, true],
//                       dif: 0.0,
//                       indicatorSize: const Size.square(30.0),
//                       animationDuration: const Duration(milliseconds: 200),
//                       animationCurve: Curves.linear,
//                       onChanged: (b) => setState(() => volume = b ? 0.7 : null),
//                       iconBuilder: (context, local, global) {
//                         return const SizedBox();
//                       },
//                       defaultCursor: SystemMouseCursors.click,
//                       // onTap: () => setState(() => customVolume = !customVolume),
//                       iconsTappable: false,
//                       wrapperBuilder: (context, global, child) {
//                         return Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Positioned(
//                                 left: 10.0,
//                                 right: 10.0,
//                                 height: 30.0,
//                                 child: DecoratedBox(
//                                   decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                         colors: TColor.secondaryG),
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(50.0)),
//                                   ),
//                                 )),
//                             child,
//                           ],
//                         );
//                       },
//                       foregroundIndicatorBuilder: (context, global) {
//                         return SizedBox.fromSize(
//                           size: const Size(10, 10),
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                               color: TColor.white,
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(50.0)),
//                               boxShadow: const [
//                                 BoxShadow(
//                                     color: Colors.black38,
//                                     spreadRadius: 0.05,
//                                     blurRadius: 1.1,
//                                     offset: Offset(0.0, 0.8))
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 30,
//             child: volume != null
//                 ? Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(
//                         volume! > 0.7
//                             ? Icons.volume_up_rounded
//                             : volume! > 0.1
//                                 ? Icons.volume_down_rounded
//                                 : Icons.volume_mute_rounded,
//                       ),
//                       Expanded(
//                         child: Slider(
//                           value: volume!,
//                           onChanged: (value) {
//                             setState(() => volume = value);
//                           },
//                         ),
//                       ),
//                     ],
//                   )
//                 : const SizedBox(),
//           ),
//           if (!creating)
//             TextButton(
//               onPressed: deleteAlarm,
//               child: Text(
//                 'Delete Alarm',
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleMedium!
//                     .copyWith(color: Colors.red),
//               ),
//             ),
//           const Spacer(),
//           Center(
//             child: TextButton(
//               onPressed: saveAlarm,
//               child: loading
//                   ? const CircularProgressIndicator()
//                   : Text(
//                       "Save",
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleLarge!
//                           .copyWith(color: Colors.blueAccent),
//                     ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//         ]),
//       ),
//     );
//   }
// }

// Future<String> showingTimePicker({required BuildContext context}) async {
//   final TimeOfDay? time = await showTimePicker(
//     context: context,
//     initialTime: TimeOfDay.now(),
//     builder: (BuildContext context, Widget? child) {
//       return Directionality(
//         textDirection: TextDirection.rtl,
//         child: child!,
//       );
//     },
//   );
//   // ignore: use_build_context_synchronously
//   return time!.format(context);
// }
