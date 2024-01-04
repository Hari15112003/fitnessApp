import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common/colo_extension.dart';
import '../../common_widget/round_button.dart';
import '../main_tab/main_tab_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  final collectionRef = FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: StreamBuilder<DocumentSnapshot>(
              stream: collectionRef
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String userName = snapshot.data!.get('name');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                      Image.asset(
                        "assets/img/welcome.png",
                        width: media.width * 0.75,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                      Text(
                        userName,
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "You are all set now, let’s reach your\ngoals together with us",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: TColor.gray, fontSize: 12),
                      ),
                      SizedBox(
                        height: media.height * 0.2,
                      ),
                      RoundButton(
                          title: "Go To Home",
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainTabView(),
                              ),
                            );
                          }),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              }),
        ),
      ),
    );
  }
}
