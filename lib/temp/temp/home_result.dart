// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fitness/temp/temp/utils/colors.dart';
import 'package:flutter/material.dart';
class HomeResult extends StatefulWidget {
  final breakfast;
  final lunch;
  final dinner;

  const HomeResult({Key? key, required this.breakfast, this.lunch, this.dinner})
      : super(key: key);

  @override
  State<HomeResult> createState() => _HomeResultState();
}

class _HomeResultState extends State<HomeResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YOUR DIET',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        backgroundColor: containerColor,
        elevation: 0.5,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            color: bodyColor,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: const BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Your Diet should be : ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900)),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(widget.breakfast,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900)),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(widget.lunch,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900)),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(widget.dinner,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900)),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
