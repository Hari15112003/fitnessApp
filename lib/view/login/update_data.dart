import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/common_widget/round_textfield.dart';
import 'package:fitness/provider/firebase/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateUserDetails extends StatefulWidget {
  const UpdateUserDetails({super.key, this.restorationId});
  final String? restorationId;

  @override
  State<UpdateUserDetails> createState() => _UpdateUserDetailsState();
}

class _UpdateUserDetailsState extends State<UpdateUserDetails>
    with RestorationMixin {
  bool isCheckedTermsAndConditions = false;
  bool showPassword = false;
  @override
  String? get restorationId => widget.restorationId;

  TextEditingController nameController = TextEditingController();

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();

    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  String? dateChoosen;
  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(1999, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          // initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(
            DateTime.now().year - 100,
          ),
          lastDate: DateTime(
            DateTime.now().year - 10,
          ),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        dateChoosen =
            '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  final collectionRef = FirebaseFirestore.instance.collection("users");
  String? genderChoosen;
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<MyAuthProvider>(context, listen: false);
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
      ),
      backgroundColor: TColor.white,
      body: StreamBuilder<DocumentSnapshot>(
          stream: collectionRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DocumentSnapshot ref = snapshot.data!;

              String name = ref.get('name');
              double height = double.parse(ref.get('height').toString());
              String doB = ref.get('dateOfBirth').toString();
              String gender = ref.get('gender');
              double weight = double.parse(ref.get('weight').toString());

              return SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Text(
                          "Update the required Fields",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "It will help us to know more about you!",
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children: [
                              RoundTextField(
                                controller: nameController,
                                hitText: name,
                                icon: "assets/img/gender.png",
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: media.width * 0.04,
                              ),
                              // RoundTextField(
                              //   controller: emailController,
                              //   hitText: "Email",
                              //   icon: "assets/img/email.png",
                              //   keyboardType: TextInputType.emailAddress,
                              // ),
                              Container(
                                decoration: BoxDecoration(
                                    color: TColor.lightGray,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    Container(
                                        alignment: Alignment.center,
                                        width: 50,
                                        height: 50,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Image.asset(
                                          "assets/img/gender.png",
                                          width: 20,
                                          height: 20,
                                          fit: BoxFit.contain,
                                          color: TColor.gray,
                                        )),
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: genderChoosen,
                                          items: ["Male", "Female"]
                                              .map(
                                                (name) => DropdownMenuItem(
                                                  value: name,
                                                  child: Text(
                                                    name,
                                                    style: TextStyle(
                                                        color: TColor.gray,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              genderChoosen = value!;
                                            });
                                          },
                                          isExpanded: true,
                                          hint: Text(
                                            "Choose Gender",
                                            style: TextStyle(
                                                color: TColor.gray,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: media.width * 0.04,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _restorableDatePickerRouteFuture.present();
                                  setState(() {});
                                },
                                child: RoundTextField(
                                  enabled: false,
                                  hitText: doB.toString(),
                                  icon: "assets/img/date.png",
                                ),
                              ),
                              SizedBox(
                                height: media.width * 0.04,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RoundTextField(
                                      keyboardType: TextInputType.number,
                                      controller: weightController,
                                      hitText: weight.toString(),
                                      icon: "assets/img/weight.png",
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: TColor.secondaryG,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      "KG",
                                      style: TextStyle(
                                          color: TColor.white, fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: media.width * 0.04,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RoundTextField(
                                      keyboardType: TextInputType.number,
                                      controller: heightController,
                                      hitText: height.toString(),
                                      icon: "assets/img/hight.png",
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: TColor.secondaryG,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      "CM",
                                      style: TextStyle(
                                          color: TColor.white, fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: media.width * 0.07,
                              ),
                              RoundButton(
                                  title: "Proceed",
                                  onPressed: () async {
                                    await ap
                                        .updateUserCredentails(
                                            height: heightController.text
                                                    .trim()
                                                    .isNotEmpty
                                                ? double.parse(heightController
                                                    .text
                                                    .trim())
                                                : height,
                                            weight: weightController.text
                                                    .trim()
                                                    .isNotEmpty
                                                ? double.parse(weightController
                                                    .text
                                                    .trim())
                                                : weight,
                                            name: nameController.text
                                                    .trim()
                                                    .isNotEmpty
                                                ? nameController.text.trim()
                                                : name,
                                            dob: dateChoosen ?? doB,
                                            genderChoosen:
                                                genderChoosen ?? gender,
                                            context: context)
                                        .then((value) => Navigator.pop(
                                              context,
                                            ));
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
