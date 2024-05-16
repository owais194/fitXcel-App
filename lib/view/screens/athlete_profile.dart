import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:fitxcel/view/helpers/button_comp.dart';
import 'package:fitxcel/view/screens/edit_account.dart';
import 'package:fitxcel/view/screens/edit_achievement.dart';
import 'package:fitxcel/view/screens/edit_biography.dart';
import 'package:fitxcel/view/screens/edit_email.dart';
import 'package:fitxcel/view/screens/edit_password.dart';
import 'package:fitxcel/view/screens/edit_phone_num.dart';
import 'package:fitxcel/view/screens/edit_team.dart';
import 'package:fitxcel/view/screens/editbasic_info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;
DatabaseReference databaseref = FirebaseDatabase.instance.ref("athlete");
var athleteData;

class FirebaseData {
  DocumentSnapshot<Object?>? snapshot;

  FirebaseData({this.snapshot});
}

class _UserProfileState extends State<UserProfile> {
  final awadcontrol = TextEditingController();
  Future<DocumentSnapshot> _getAthleteData() async {
    return await FirebaseFirestore.instance
        .collection("athlete")
        .doc("aimalsociety@mail.com")
        .get();
  }

  @override
  Widget build(BuildContext context) {
    //  => print(data.data()));
    // FirebaseFirestore.instance
    //     .collection("athlete")
    //     .doc("aimalsociety@mail.com")
    //     .get()
    //     .then((value) => {print(value.data())});

    print(athleteData);
    return Scaffold(
      backgroundColor: const Color(0xff070540),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color(0xff070540),
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Color(0xffF7F7F7)),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color(0xffFFFFFF), // Replace with your preferred color
        ),
      ),
      drawer: Drawer(
        surfaceTintColor: Colors.white,
        // backgroundColor: Colors.amber,
        backgroundColor: const Color(0xff070540),

        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Container(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset("assets/images/applogo.png"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditInfoScreen()));
                      },
                      child: const Text(
                        "Edit Basic Information",
                        style: TextStyle(color: Color(0xffF7F7F7)),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditTeamScreen()));
                        },
                        child: const Text("Edit Teams",
                            style: TextStyle(color: Color(0xffF7F7F7)))),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditBiographyScreen()));
                      },
                      child: const Text(
                        "Edit Bio",
                        style: TextStyle(color: Color(0xffF7F7F7)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditAchievementScreen()));
                      },
                      child: const Text(
                        "Edit Achievements",
                        style: TextStyle(color: Color(0xffF7F7F7)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditAccountScreen()));
                      },
                      child: const Text(
                        "Edit Account Details",
                        style: TextStyle(color: Color(0xffF7F7F7)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditPasswordScreen()));
                      },
                      child: const Text(
                        "Change Password",
                        style: TextStyle(color: Color(0xffF7F7F7)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditPhoneNoScreen()));
                      },
                      child: const Text(
                        "Change Phone Number",
                        style: TextStyle(color: Color(0xffF7F7F7)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditEmailScreen()));
                      },
                      child: const Text(
                        "Change Email Address",
                        style: TextStyle(color: Color(0xffF7F7F7)),
                      ),
                    ),
                    Row(
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.logout,
                              color: Color(0xffF7F7F7),
                            ),
                            label: const Text(
                              "Logout",
                              style: TextStyle(color: Color(0xffF7F7F7)),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: _getAthleteData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            print('Document data: ${snapshot.data?.data()}');
            // var athleteData = snapshot.data!["CNIC"];
            var athleteData = snapshot.data!.data();
            print(athleteData);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CircleAvatar(
                        child: Text("profile"),
                        radius: 60,
                      ),
                      Column(
                        children: [
                          Text(
                            " ${snapshot.data!['name']}",
                            style: const TextStyle(
                                color: Color(0xffF7F7F7), fontSize: 30),
                          ),
                          Text(" ${snapshot.data!['city']}",
                              style: const TextStyle(
                                  color: Color(0xffF7F7F7), fontSize: 20)),
                          const Text("Hockey Player",
                              style: TextStyle(
                                  color: Color(0xffF7F7F7), fontSize: 20)),
                          const Text("#15 in World",
                              style: TextStyle(
                                  color: Color(0xffF7F7F7), fontSize: 20)),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child: Container(
                      height: 200,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: const Color(0xff2147AF)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Available donation amount ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 17),
                              child: Text(
                                'Pr 20,000',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: BtnScreen(
                                  width: 200,
                                  onpressed: () {},
                                  title: 'Withdraw Now'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 100,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: const Color(0xff2147AF)),
                      child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                FontAwesomeIcons.chartLine,
                                color: Color(0xffF7F7F7),
                                size: 40,
                              ),
                              Text(
                                "Check Donation Stats",
                                style: TextStyle(
                                    color: Color(0xffF7F7F7),
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: const Color(0xff2147AF)),
                            child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.eye,
                                      color: Color(0xffF7F7F7),
                                      size: 25,
                                    ),
                                    Text(
                                      "Profile Views",
                                      style: TextStyle(
                                          color: Color(0xffF7F7F7),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "150",
                                      style: TextStyle(
                                          color: Color(0xffF7F7F7),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: const Color(0xff2147AF)),
                            child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.thumbsUp,
                                      color: Color(0xffF7F7F7),
                                      size: 25,
                                    ),
                                    Text(
                                      "Profile Views",
                                      style: TextStyle(
                                          color: Color(0xffF7F7F7),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "150",
                                      style: TextStyle(
                                          color: Color(0xffF7F7F7),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 10),
                        //   child: Container(
                        //       height: 100,
                        //       width: double.maxFinite,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(18),
                        //           color: Color(0xff2147AF)),
                        //       child: Column(
                        //         children: [
                        //           Icon(Icons.abc),
                        //           Text("Profile Views"),
                        //           Text("150"),
                        //         ],
                        //       )),
                        // ),
                      ],
                    ),
                  ),
                  // Text(
                  //   "Add your New Achievement Story",
                  //   style: TextStyle(color: Color(0xffF7F7F7)),
                  // ),
                  // FormScreen(
                  //   contoller: awadcontrol,
                  //   hinttext:
                  //       "Write your winnings and awards and how this app is making your athletic life easier",
                  //   maxlines: 2,
                  // )
                ],
              ),
            );
          }),
    );
  }
}
