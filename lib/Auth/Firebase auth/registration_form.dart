import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitxcel/Auth/Firebase%20auth/firebase_login.dart';
import 'package:fitxcel/Auth/Firebase%20auth/professional_screen.dart';
import 'package:fitxcel/res/utils.dart';
import 'package:fitxcel/view/helpers/button_comp.dart';
import 'package:fitxcel/view/helpers/text_comp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker_for_web/image_picker_for_web.dart' as webPicker;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  DatabaseReference databaseref = FirebaseDatabase.instance.ref("athlete");

  final formey = GlobalKey<FormState>();
  final registeruploadimage = TextEditingController();
  final registername = TextEditingController();
  final registerfathername = TextEditingController();
  final registerage = TextEditingController();
  final registercnicnumber = TextEditingController();
  final registercity = TextEditingController();
  final registerpassword = TextEditingController();
  final registerconfirmpassword = TextEditingController();
  final registerphonenumber = TextEditingController();
  final registerusername = TextEditingController();
  final registeremail = TextEditingController();
  File? image;
  final picker = ImagePicker();

  Future getgelleryimage() async {
    if (kIsWeb) {
      final iPicker = await webPicker.ImagePickerPlugin();
      final pickedFile =
          await iPicker.getImageFromSource(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
        });
      }
    } else {
      final pickedfile =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

      setState(() {
        if (pickedfile != null) {
          image = File(pickedfile.path);
        } else {
          print("image picked error");
        }
      });
    }
  }

  Future uploadImage(File image) async {
    firebase_storage.Reference ref = await firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child("/folder" + "dp");
    ref.putFile(image);
  }

  String? selectedItemcategory = 'Hyderabad';
  String selectoption = "selectedoption";
  bool isopen = false;
  List<String> categoryitems = [
    "Karachi",
    "Hyderabad",
    "sukkur",
    "larkana",
    "nawabshah",
    "mirpurkhas",
    "lahore",
    "Rawalpindi",
    "Islamabad",
    "Rawalpindi"
  ];

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
              "Register yourself!",
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
            Form(
                key: formey,
                child: Column(
                  children: [
                    FormScreen(
                      contoller: registeruploadimage,
                      hinttext: "Upload Profile Picture",
                      prefixIcon: FontAwesomeIcons.user,
                      suffixIcon: FontAwesomeIcons.arrowUpFromBracket,
                      onPress: () {
                        getgelleryimage();
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormScreen(
                      contoller: registername,
                      hinttext: "Your Name",
                      prefixIcon: FontAwesomeIcons.user,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormScreen(
                      contoller: registerfathername,
                      hinttext: "Father Name",
                      prefixIcon: FontAwesomeIcons.user,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormScreen(
                      contoller: registerage,
                      hinttext: "Age",
                      prefixIcon: Icons.calendar_month,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormScreen(
                      contoller: registercnicnumber,
                      hinttext: "Your CNIC Number",
                      prefixIcon: FontAwesomeIcons.idCard,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // FormScreen(
                    //   contoller: registercity,
                    //   hinttext: "Select Your City ",
                    //   prefixIcon: Icons.location_on,
                    //   suffixIcon: FontAwesomeIcons.arrowDown,
                    //   onPress: () {},
                    // ),
                    InkWell(
                      onTap: () {
                        isopen = !isopen;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.white70, width: 3)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 9),
                                    child: Icon(
                                      Icons.location_on,
                                      color: Color.fromARGB(199, 247, 247, 247),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 130),
                                    child: Text(
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              199, 247, 247, 247),
                                          fontSize: 19),
                                      selectoption,
                                    ),
                                  ),
                                  Icon(
                                    isopen
                                        ? FontAwesomeIcons.arrowUp
                                        : FontAwesomeIcons.arrowDown,
                                    color: const Color.fromARGB(
                                        199, 247, 247, 247),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: selectoption == e
                                              ? Colors.black
                                              : Colors.blueAccent),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 220),
                                          child: Text(
                                            e,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    199, 247, 247, 247),
                                                fontSize: 19),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      )
                    // DropdownButtonFormField(
                    //   decoration: const InputDecoration(
                    //       border: InputBorder.none,
                    //       labelText: "Select Gender",
                    //       isDense: true,
                    //       alignLabelWithHint: true,
                    //       contentPadding: EdgeInsets.all(8)),
                    //   value: selectedItemcategory,
                    //   items: categoryitems
                    //       .map((item) => DropdownMenuItem(
                    //           value: item,
                    //           child: Text(
                    //             item,
                    //             style: const TextStyle(
                    //               fontSize: 16,
                    //               color: Colors.black,
                    //             ),
                    //           )))
                    //       .toList(),
                    //   onChanged: (item) =>
                    //       setState(() => selectedItemcategory != item),
                    // ),
                    ,
                    const SizedBox(
                      height: 30,
                    ),
                    FormScreen(
                      contoller: registeremail,
                      hinttext: "Email Address",
                      prefixIcon: FontAwesomeIcons.envelope,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormScreen(
                      contoller: registerphonenumber,
                      hinttext: "Phone Number",
                      prefixIcon: Icons.phone,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormScreen(
                      contoller: registerusername,
                      hinttext: "User Name",
                      prefixIcon: FontAwesomeIcons.user,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormScreen(
                      contoller: registerpassword,
                      hinttext: "password",
                      prefixIcon: FontAwesomeIcons.lock,
                      suffixIcon: FontAwesomeIcons.eye,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormScreen(
                      contoller: registerconfirmpassword,
                      hinttext: "Confirm Password",
                      suffixIcon: FontAwesomeIcons.eye,
                      prefixIcon: FontAwesomeIcons.lock,
                    ),
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            BtnScreen(
                width: 350,
                onpressed: () async {
                  if (formey.currentState!.validate()) {
                    print("Done");
                  } else {
                    print("error");
                    print(File(image!.path));
                  }
                  // uploadImage(File("image"));

                  // firebase_storage.Reference ref = firebase_storage
                  //     .FirebaseStorage.instance
                  //     .ref()
                  //     .child("/folder" + "dp");
                  // firebase_storage.UploadTask uploadTask =
                  //     ref.putFile(File(image!.path));

                  // await Future.value(uploadTask);

                  // var newurl = ref.getDownloadURL();
                  // databaseref.child("athlete").set({
                  //   "email": registeremail.value.toString(),
                  //   "title": newurl.toString(),
                  // });

                  FirebaseFirestore.instance
                      .collection("athlete")
                      .doc(registeremail.value.text)
                      .get()
                      .then((value) {
                    if (value.data() == null) {
                      if (registerpassword.value.text ==
                              registerconfirmpassword.value.text &&
                          formey.currentState!.validate()) {
                        FirebaseFirestore.instance
                            .collection("athlete")
                            .doc(registeremail.value.text)
                            .set({
                          'name': registername.value.text,
                          "fathername": registerfathername.value.text,
                          "age": registerage.value.text,
                          "CNIC": registercnicnumber.value.text,
                          "city": registercity.value.text,
                          "email": registeremail.value.text,
                          "phoneNumber": registerphonenumber.value.text,
                          "userName": registerusername.value.text,
                          "password": registerpassword.value.text,
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfessionalScreen(
                                    registeremail: registeremail.value.text)));
                      } else {
                        print("form data error");
                      }
                    } else {
                      Utils().toastmessage("User already exisit...");
                      print('User already exisit...');
                    }
                  });

                  // print(registeremail.value);
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
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(199, 247, 247, 247),
                  ),
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
