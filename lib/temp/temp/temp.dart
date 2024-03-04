// ignore_for_file: depend_on_referenced_packages, constant_identifier_names, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:fitness/temp/temp/Widgets/weightcard.dart';
import 'package:fitness/temp/temp/home_result.dart';
import 'package:fitness/temp/temp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum Gender { Male, Female }

class DietPlanner extends StatefulWidget {
  const DietPlanner({super.key});

  @override
  State<DietPlanner> createState() => _DietPlannerState();
}

class _DietPlannerState extends State<DietPlanner> {
  bool _isLoading = false;

  var age = 20;

  var height = 180;
  Gender selectedGender = Gender.Male;
  var gender = 1;
  var weight = 50;
  var activity = 1;
  final decorate = const BoxDecoration(
    color: containerColor,
    borderRadius: BorderRadius.all(
      Radius.circular(7),
    ),
    boxShadow: [
      BoxShadow(
        color: Color(0xffDDDDDD),
        blurRadius: 2.0,
        spreadRadius: 1.0,
        offset: Offset(0.0, 0.0),
      )
    ],
  );

  var breakfast;
  var lunch;
  var dinner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: bodyColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 4,
                                child: Container(
                                  decoration: decorate,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'GENDER',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedGender = Gender.Male;
                                                  gender = 1;
                                                });
                                              },
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    Icons.male_sharp,
                                                    size: 40.0,
                                                    color: selectedGender ==
                                                            Gender.Male
                                                        ? activeCardColor
                                                        : inActiveCardColor,
                                                  ),
                                                  const SizedBox(
                                                    height: 2.0,
                                                  ),
                                                  Text(
                                                    'Male',
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: selectedGender ==
                                                              Gender.Male
                                                          ? activeCardColor
                                                          : inActiveCardColor,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                            Expanded(
                                                child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedGender =
                                                      Gender.Female;
                                                  gender = 0;
                                                });
                                              },
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    Icons.female_sharp,
                                                    size: 40.0,
                                                    color: selectedGender ==
                                                            Gender.Female
                                                        ? activeCardColor
                                                        : inActiveCardColor,
                                                  ),
                                                  const SizedBox(
                                                    height: 2.0,
                                                  ),
                                                  Text(
                                                    'Female',
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: selectedGender ==
                                                              Gender.Female
                                                          ? activeCardColor
                                                          : inActiveCardColor,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ))
                                          ],
                                        )
                                      ]),
                                )),
                            Expanded(
                                flex: 5,
                                child: Container(
                                  decoration: decorate,
                                  margin: const EdgeInsets.only(top: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 25),
                                  child: WeightCard(
                                    weight: weight,
                                    onChanged: (val) =>
                                        setState(() => weight = val),
                                  ),
                                ))
                          ],
                        )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: decorate,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'HEIGHT',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RotatedBox(
                                quarterTurns: 3,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    inactiveTrackColor:
                                        const Color.fromARGB(95, 133, 190, 228),
                                    activeTrackColor: activeCardColor,
                                    thumbColor: activeCardColor,
                                    thumbShape: const RoundSliderThumbShape(
                                        enabledThumbRadius: 8.0),
                                    overlayShape: const RoundSliderThumbShape(
                                        enabledThumbRadius: 8.0),
                                  ),
                                  child: Slider(
                                    value: height.toDouble(),
                                    min: 120.0,
                                    max: 220.0,
                                    onChanged: (double newValue) {
                                      setState(() {
                                        height = newValue.round();
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    height.toString(),
                                    style: const TextStyle(
                                      fontSize: 22.0,
                                      color: activeCardColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const Text(
                                    ' cm',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: activeCardColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                )),
            Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: decorate,
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'AGE',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      age.toString(),
                                      style: const TextStyle(
                                        fontSize: 22.0,
                                        color: activeCardColor,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const Text(
                                      ' kg',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: activeCardColor,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    RotatedBox(
                                      quarterTurns: 4,
                                      child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          inactiveTrackColor:
                                              const Color.fromARGB(95, 133, 190, 228),
                                          activeTrackColor: activeCardColor,
                                          thumbColor: activeCardColor,
                                          thumbShape: const RoundSliderThumbShape(
                                              enabledThumbRadius: 8.0),
                                          overlayShape: const RoundSliderThumbShape(
                                              enabledThumbRadius: 8.0),
                                        ),
                                        child: Slider(
                                          value: age.toDouble(),
                                          min: 0,
                                          max: 100,
                                          onChanged: (double newValue) {
                                            setState(() {
                                              age = newValue.round();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        )),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(top: 10, left: 10),
                          decoration: decorate,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'ACTIVITY',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        child: Center(
                                          child: Text(
                                            activity == 1
                                                ? 'Sedentary'
                                                : activity == 2
                                                    ? "Light"
                                                    : activity == 3
                                                        ? "Moderate"
                                                        : activity == 4
                                                            ? "Active"
                                                            : "VeryActive",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: activeCardColor,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        activity == 1
                                            ? '(little or no exercise)'
                                            : activity == 2
                                                ? "(exercise 1-3 times/week)"
                                                : activity == 3
                                                    ? "(exercise 4-5 times/week)"
                                                    : activity == 4
                                                        ? "(intense 3-4 times/week)"
                                                        : "(intense 6-7 times/week)",
                                        style: const TextStyle(fontSize: 8),
                                      )
                                    ],
                                  ),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        inactiveTrackColor:
                                            const Color.fromARGB(95, 133, 193, 228),
                                        activeTrackColor: activeCardColor,
                                        thumbColor: activeCardColor,
                                        thumbShape: const RoundSliderThumbShape(
                                            enabledThumbRadius: 8.0),
                                        overlayShape: const RoundSliderThumbShape(
                                            enabledThumbRadius: 8.0),
                                      ),
                                      child: SizedBox(
                                        width: 90,
                                        child: Slider(
                                          value: activity.toDouble(),
                                          min: 1,
                                          max: 5,
                                          onChanged: (double newValue) {
                                            setState(() {
                                              activity = newValue.round();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                      ],
                    )),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await postdata();
                        const url = 'https://backend-objk.onrender.com/tp';

                        final receive = await http.get(Uri.parse(url));

                        final decoded =
                            json.decode(receive.body) as Map<String, dynamic>;
                        setState(() {
                          breakfast = decoded['breakfast'];
                          lunch = decoded['lunch'];
                          dinner = decoded['dinner'];
                        });
                        if (receive.statusCode == 200) {
                          setState(() {
                            _isLoading = false;
                          });
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeResult(
                                      breakfast: breakfast,
                                      lunch: lunch,
                                      dinner: dinner,
                                    )));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding:
                            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: const BoxDecoration(
                          color: activeCardColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffDDDDDD),
                              blurRadius: 2.0,
                              spreadRadius: 1.0,
                              offset: Offset(0.0, 0.0),
                            )
                          ],
                        ),
                        child: Center(
                          child: !_isLoading
                              ? const Text(
                                  'Calculate',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                )
                              : const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      )),
    );
  }

  postdata() async {
    String heigh = height.toString();
    String ag = age.toString();
    String gende = gender.toString();
    String weigh = weight.toString();
    String activ = activity.toString(); //url to send the post request to
    const url = 'https://backend-objk.onrender.com/tp';

    //sending a post request to the url
     await http.post(Uri.parse(url),
        headers: {
          "Content-type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          'height': heigh,
          'age': ag,
          'weight': weigh,
          'gender': gende,
          'activity': activ,
        }));
  }
}
