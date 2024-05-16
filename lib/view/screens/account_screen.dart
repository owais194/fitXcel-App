import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitxcel/Auth/Firebase%20auth/firebase_login.dart';
import 'package:fitxcel/controllers/bankscreen_controller.dart';
import 'package:fitxcel/view/helpers/button_comp.dart';
import 'package:fitxcel/view/helpers/text_comp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BankScreen extends StatelessWidget {
  final String registeremail;

  BankScreen({Key? key, required this.registeremail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BankScreenController>(context);

    return Scaffold(
      backgroundColor: const Color(0xff070540),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset("assets/images/applogo.png"),
            const SizedBox(height: 50),
            const Text(
              "Account Details!",
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Create your account by filling below form",
              style: TextStyle(fontSize: 15, color: Color(0xffFFFFFF)),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                controller.toggleDropdown();
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white70, width: 3),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 9),
                          child: Icon(
                            FontAwesomeIcons.buildingColumns,
                            color: Color.fromARGB(199, 247, 247, 247),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: Text(
                            controller.selectedBank,
                            style: const TextStyle(
                              color: Color.fromARGB(199, 247, 247, 247),
                              fontSize: 19,
                            ),
                          ),
                        ),
                        Icon(
                          controller.isDropdownOpen
                              ? FontAwesomeIcons.arrowUp
                              : FontAwesomeIcons.arrowDown,
                          color: const Color.fromARGB(199, 247, 247, 247),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (controller.isDropdownOpen)
              ListView(
                primary: true,
                shrinkWrap: true,
                children: controller.categoryItems
                    .map((e) => InkWell(
                          onTap: () {
                            controller.selectBank(e);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller.selectedBank == e
                                    ? Colors.black
                                    : Colors.blueAccent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 200),
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      color: Color.fromARGB(199, 247, 247, 247),
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            const SizedBox(height: 30),
            FormScreen(
              contoller: controller.accountNumberController,
              hinttext: "Account Number",
              prefixIcon: FontAwesomeIcons.key,
            ),
            const SizedBox(height: 30),
            FormScreen(
              contoller: controller.accountNameController,
              hinttext: "Account Holder Name",
              prefixIcon: FontAwesomeIcons.user,
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 50,
              color: const Color(0xff15134A),
              child: SizedBox(
                height: 70,
                width: 350,
                child: Center(
                  child: Text(
                    "After verification, Interview will be Scheduled",
                    style: TextStyle(
                      color: const Color(0xffFFFFFF).withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            BtnScreen(
              width: 350,
              onpressed: () {
                FirebaseFirestore.instance
                    .collection("athletedetails")
                    .doc(registeremail)
                    .update({
                  "bank": controller.selectedBank,
                  "account number": controller.accountNumberController.text,
                  "account name": controller.accountNameController.text,
                });
                print("Data updated successfully");
              },
              title: "Next",
            ),
            const SizedBox(height: 30),
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
                          builder: (context) => const LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
