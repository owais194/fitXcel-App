import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:fitxcel/Auth/Firebase%20auth/firebase_login.dart';
import 'package:fitxcel/view/helpers/button_comp.dart';
import 'package:fitxcel/view/helpers/text_comp.dart';
import 'package:fitxcel/view/screens/account_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfessionalScreen extends StatefulWidget {
  var registeremail;

  ProfessionalScreen({super.key, this.registeremail});

  // const ProfessionalScreen({super.key});

  @override
  State<ProfessionalScreen> createState() =>
      _ProfessionalScreenState(registeremail);
}

class _ProfessionalScreenState extends State<ProfessionalScreen> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  DatabaseReference databaseref = FirebaseDatabase.instance.ref("athlete");

  final professionalsport = TextEditingController(text: "hello brotther");
  final professsionalclub = TextEditingController(text: "hello brotther");
  final professionalachievement = TextEditingController(text: "hello brotther");
  final professionalexperience = TextEditingController(text: "hello brotther");
  final professionalcertificate = TextEditingController(text: "hello brotther");
  // final professionalextra1 = TextEditingController(text: "hello brotther");
  // final professionalextra2 = TextEditingController(text: "hello brotther");
  // final professionalextra3 = TextEditingController(text: "hello brotther");
  var valueFromPrevScreen;
  _ProfessionalScreenState(this.valueFromPrevScreen);
  String? sponsore;

  //
  String selectoption = "Select Your Sports";
  bool isopen = false;
  List<String> categoryitems = [
    "Hockey",
    "Boxing",
    "Weight Lifting",
    "Squash",
    "Running",
    "Swimming",
    "Archery"
  ];

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff070540),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset("assets/images/applogo.png"),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Profession Info!",
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("Create your account by filling below form",
                style: TextStyle(fontSize: 15, color: Color(0xffFFFFFF))),
            const SizedBox(
              height: 50,
            ),
            // FormScreen(
            //   contoller: professionalsport,
            //   hinttext: "Select Your Sports",
            //   prefixIcon: FontAwesomeIcons.flag,
            //   suffixIcon: FontAwesomeIcons.arrowDown,
            // ),

            //sport Dropdownmenu
            InkWell(
              onTap: () {
                isopen = !isopen;
                setState(() {});
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white70, width: 3)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 9),
                            child: Icon(
                              FontAwesomeIcons.flag,
                              color: Color.fromARGB(199, 247, 247, 247),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: Text(
                              style: const TextStyle(
                                  color: Color.fromARGB(199, 247, 247, 247),
                                  fontSize: 19),
                              selectoption,
                            ),
                          ),
                          Icon(
                            isopen
                                ? FontAwesomeIcons.arrowUp
                                : FontAwesomeIcons.arrowDown,
                            color: const Color.fromARGB(199, 247, 247, 247),
                          )
                        ],
                      ),
                    )),
              ),
            ),
            if (isopen)
              ListView(
                primary: true,
                shrinkWrap: true,
                children: categoryitems
                    .map((e) => InkWell(
                          onTap: () {
                            selectoption = e;
                            isopen = false;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: selectoption == e
                                      ? Colors.black
                                      : Colors.blueAccent),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 200),
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(199, 247, 247, 247),
                                        fontSize: 19),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),

            // dropdown end

            const SizedBox(
              height: 30,
            ),
            FormScreen(
              contoller: professsionalclub,
              hinttext: "Club (if Any)",
              prefixIcon: FontAwesomeIcons.user,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 180),
              child: Text(
                "Your Achievement",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FormScreen(
              contoller: professionalachievement,
              hinttext: "Your Achievement",
            ),

            // FormScreen(
            //   contoller: professionalachievement,
            //   maxlines: 5,
            //   hinttext: "enter your achivements ",
            // ),
            // TextFormField(
            //   maxLines: 5,
            //   decoration: InputDecoration(
            //     labelText: 'Enter your paragraph',
            //     border: OutlineInputBorder(
            //       borderSide: BorderSide(
            //         color: Colors.blue, // Set your desired border color
            //         width: 2.0, // Set your desired border width
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                "Your Experience",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FormScreen(
              contoller: professionalexperience,
              hinttext: "Your Experience  Your Certificates",
            ),
            const SizedBox(
              height: 20,
            ),

            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                "Your Certificates",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FormScreen(
              contoller: professionalcertificate,
              hinttext: "Your Certificates",
            ),

            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 170),
              child: Text(
                "Are you Sponsored",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.bold),
              ),
            ),
            RadioListTile(
              title: const Text(
                "Yes",
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(199, 247, 247, 247),
                    fontWeight: FontWeight.bold),
              ),
              value: "Yes",
              groupValue: sponsore,
              onChanged: (value) {
                setState(() {
                  sponsore = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text(
                "No",
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(199, 247, 247, 247),
                    fontWeight: FontWeight.bold),
              ),
              value: "No",
              groupValue: sponsore,
              onChanged: (value) {
                setState(() {
                  sponsore = value.toString();
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              elevation: 50,
              color: const Color(0xff15134A),
              child: SizedBox(
                height: 70,
                width: 350,
                child: Center(
                  child: Text(
                    "After verification Interview will be Schedule",
                    style: TextStyle(
                        color: const Color(0xffFFFFFF).withOpacity(0.6)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BtnScreen(
                width: 350,
                onpressed: () {
                  print(valueFromPrevScreen);

                  FirebaseFirestore.instance
                      .collection("athletedetails")
                      .doc(valueFromPrevScreen)
                      .set({
                    "club": professsionalclub.value.text,
                    "achievment": professionalachievement.value.text,
                    "Experience": professionalexperience.value.text,
                    "Certificate": professionalcertificate.value.text,
                  });
                  print("object1");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BankScreen(
                                registeremail: valueFromPrevScreen,
                              )));
                },
                title: "Next"),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF)),
                ),
                CupertinoButton(
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Color(0xff00A3FF), fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
