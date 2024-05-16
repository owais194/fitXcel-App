import 'package:fitxcel/Auth/Firebase%20auth/forget_pass_screen.dart';
import 'package:fitxcel/Auth/Firebase%20auth/registration_form.dart';
import 'package:fitxcel/view/helpers/button_comp.dart';
import 'package:fitxcel/view/helpers/social_comp.dart';
import 'package:fitxcel/view/helpers/text_comp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final arr = [
    {'id': 1, 'img': 'assets/images/googleicon.png'},
    {'id': 1, 'img': 'assets/images/facebookicon.png'},
    {'id': 1, 'img': 'assets/images/appleicon.png'},
  ];
  bool ischecked = false;
  final loginpasstext = TextEditingController();
  final loginusernametext = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
              "Welcome Back!",
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("Login to your account",
                style: TextStyle(fontSize: 15, color: Color(0xffFFFFFF))),
            const SizedBox(
              height: 50,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    FormScreen(
                      hinttext: "User Name",
                      contoller: loginusernametext,
                      prefixIcon: FontAwesomeIcons.user,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormScreen(
                      contoller: loginpasstext,
                      hinttext: "password",
                      prefixIcon: FontAwesomeIcons.lock,
                      suffixIcon: FontAwesomeIcons.eye,
                    ),
                  ],
                )),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Checkbox(
                    value: ischecked,
                    onChanged: (val) {
                      setState(() {
                        ischecked = val!;
                      });
                    }),
                const Text("Save my login info",
                    style: TextStyle(
                        color: Color.fromARGB(199, 247, 247, 247),
                        fontSize: 20)),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: CupertinoButton(
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Color.fromARGB(199, 247, 247, 247),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgetPassword()));
                    },
                  ),
                )
              ],
            ),
            BtnScreen(
                width: 350,
                onpressed: () {
                  if (formKey.currentState!.validate()) {
                    print('All forms are valid');
                  } else {
                    print('not a All forms are valid');
                    Text('Submit');
                  }
                },
                title: "Login"),
            const SizedBox(
              height: 50,
            ),
            const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Divider(
                    indent: 2,
                    thickness: 2,
                    color: Color.fromARGB(199, 247, 247, 247),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "or Log in with",
                      style: TextStyle(
                        color: Color.fromARGB(199, 247, 247, 247),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Divider(
                      thickness: 2,
                      color: Color.fromARGB(199, 247, 247, 247),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var imag in arr)
                  SocialScreen(
                    onpressed: () {},
                    image: imag['img'].toString(),
                    radius: 30,
                  ),

                // SocialScreen(
                //   onpressed: () {},
                //   image: 'assets/images/googleicon.png',
                //   radius: 30,
                // ),
                // SocialScreen(
                //   onpressed: () {},
                //   image: "assets/images/facebookicon.png",
                //   radius: 30,
                // ),
                // SocialScreen(
                //   onpressed: () {},
                //   image: 'assets/images/appleicon.png',
                //   radius: 30,
                // )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have account?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(199, 247, 247, 247),
                  ),
                ),
                CupertinoButton(
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Color(0xff00A3FF), fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
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
