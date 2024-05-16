import 'package:fitxcel/res/utils.dart';
import 'package:fitxcel/view/helpers/button_comp.dart';
import 'package:fitxcel/view/helpers/text_comp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailcontroler = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff070540),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: const Text(
              "Forget Password",
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormScreen(
                hinttext: "enter your email",
                contoller: emailcontroler,
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(
                height: 50,
              ),
              BtnScreen(
                  width: 350,
                  onpressed: () {
                    auth
                        .sendPasswordResetEmail(
                            email: emailcontroler.text.toString())
                        .then((value) {
                      Utils().toastmessage(
                          "we have send you email to recover password");
                    }).onError((error, stackTrace) {
                      Utils().toastmessage(error.toString());
                    });
                  },
                  title: "Forget ")
            ],
          )
        ],
      ),
    );
  }
}
