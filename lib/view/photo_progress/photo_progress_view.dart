// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/provider/firebase/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../common/colo_extension.dart';

class PhotoProgressView extends StatefulWidget {
  const PhotoProgressView({super.key});

  @override
  State<PhotoProgressView> createState() => _PhotoProgressViewState();
}

class _PhotoProgressViewState extends State<PhotoProgressView> {
  List photoArr = [
    {
      "time": "2 June",
      "photo": [
        "assets/img/pp_1.png",
        "assets/img/pp_2.png",
        "assets/img/pp_3.png",
        "assets/img/pp_4.png",
      ]
    },
    {
      "time": "5 May",
      "photo": [
        "assets/img/pp_5.png",
        "assets/img/pp_6.png",
        "assets/img/pp_7.png",
        "assets/img/pp_8.png",
      ]
    }
  ];
  Map<String, List<String>> monthPhotoMap = {};

  late File image;

  final collectionRef = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        leading: const SizedBox(),
        title: Text(
          "Progress Photo",
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
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
          stream: collectionRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("photos")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              for (var document in snapshot.data!.docs) {
                String month = document.id;
                List<String> photoUrls = List<String>.from(
                    (document.data() as Map<String, dynamic>)['photoUrls']);

                monthPhotoMap[month] = photoUrls;
              }
              // print(monthPhotoMap.keys);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(20),
                          height: media.width * 0.4,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                TColor.primaryColor2.withOpacity(0.4),
                                TColor.primaryColor1.withOpacity(0.4)
                              ]),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      "Track Your Progress Each\nMonth With Photo",
                                      style: TextStyle(
                                        color: TColor.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Spacer(),
                                  ]),
                              Image.asset(
                                "assets/img/progress_each_photo.png",
                                width: media.width * 0.35,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      // Container(
                      //   margin: const EdgeInsets.symmetric(horizontal: 20),
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 15, horizontal: 15),
                      //   decoration: BoxDecoration(
                      //     color: TColor.primaryColor2.withOpacity(0.3),
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "Compare my Photo",
                      //       style: TextStyle(
                      //           color: TColor.black,
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.w500),
                      //     ),
                      // SizedBox(
                      //   width: 100,
                      //   height: 25,
                      //   child: RoundButton(
                      //     title: "Compare",
                      //     type: RoundButtonType.bgGradient,
                      //     fontSize: 12,
                      //     fontWeight: FontWeight.w400,
                      //     onPressed: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) =>
                      //               const ComparisonView(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // )
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Gallery",
                              style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            // TextButton(
                            //     onPressed: () {},
                            //     child: Text(
                            //       "See more",
                            //       style: TextStyle(
                            //           color: TColor.gray, fontSize: 12),
                            //     ))
                          ],
                        ),
                      ),
                      monthPhotoMap.keys.isNotEmpty
                          ? ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: monthPhotoMap.keys.toList().length,
                              itemBuilder: ((context, index) {
                                // var pObj = photoArr[index] as Map? ?? {};
                                // var imaArr = pObj["photo"] as List? ?? [];
                                // print(monthPhotoMap[
                                //         monthPhotoMap.keys.toList()[index]]!
                                //     .length);
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        monthPhotoMap.keys.toList()[index],
                                        // pObj["time"].toString(),
                                        style: TextStyle(
                                            color: TColor.gray, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.zero,
                                        itemCount: monthPhotoMap[monthPhotoMap
                                                .keys
                                                .toList()[index]]!
                                            .length,
                                        itemBuilder: ((context, indexRow) {
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: TColor.lightGray,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                monthPhotoMap[
                                                    monthPhotoMap.keys.toList()[
                                                        index]]![indexRow],
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                );
                              }))
                          : const Center(
                              child: Text(
                                "No Photo has been Uploaded yet",
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    // icon: Icon(Icons.abc),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),

                    content: Text(
                      'Choose the method',
                      style:
                          TextStyle(color: TColor.primaryColor1, fontSize: 15),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => pickImageFromCamera(),
                        child: Text(
                          'Camera',
                          style: TextStyle(
                              color: TColor.secondaryColor1, fontSize: 13),
                        ),
                      ),
                      TextButton(
                        onPressed: () => pickImageFromGallery(),
                        child: Text(
                          'Gallery',
                          style: TextStyle(
                              color: TColor.secondaryColor1, fontSize: 13),
                        ),
                      ),
                    ],
                  ));
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
            Icons.photo_camera,
            size: 20,
            color: TColor.white,
          ),
        ),
      ),
    );
  }

  Future pickImageFromGallery() async {
    final ap = Provider.of<MyAuthProvider>(context, listen: false);
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      image = File(pickedFile!.path);
    });

    ap.savePhoto(
      imagePath: image,
      context: context,
    );
    Navigator.pop(context);
  }

  Future pickImageFromCamera() async {
    final ap = Provider.of<MyAuthProvider>(context, listen: false);
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      image = File(pickedFile!.path);
    });
    ap.savePhoto(
      imagePath: image,
      context: context,
    );
    Navigator.pop(context);
  }
}
