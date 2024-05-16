import 'package:fitxcel/view/helpers/button_comp.dart';
import 'package:fitxcel/view/helpers/text_comp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final editoldpassword = TextEditingController();
  final editnewpassword = TextEditingController();
  final edithconfirmpassword = TextEditingController();
  final editachievement4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff070540),
      appBar: AppBar(
        leading: BackButton(
          color: const Color(0xffF7F7F7),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color(0xff070540),
        toolbarHeight: 120,
        title: const Text(
          "Edit Account Details",
          style: TextStyle(color: Color(0xffF7F7F7)),
        ),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Color(0xff2147AF),
              ),
              height: 600,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 25, right: 8, top: 45),
                        child: Text(
                          "Your Account Password",
                          style: TextStyle(
                            color: Color.fromARGB(199, 247, 247, 247),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 25),
                        child: FormScreen(
                          contoller: editoldpassword,
                          hinttext: "Old Password",
                          prefixIcon: FontAwesomeIcons.lock,
                          suffixIcon: FontAwesomeIcons.eye,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 15),
                        child: FormScreen(
                          contoller: editnewpassword,
                          hinttext: "New Password",
                          prefixIcon: FontAwesomeIcons.lock,
                          suffixIcon: FontAwesomeIcons.eye,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 15),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 3, right: 3, bottom: 15, top: 15),
                          child: FormScreen(
                            contoller: edithconfirmpassword,
                            hinttext: "Confirm Password",
                            prefixIcon: FontAwesomeIcons.lock,
                            suffixIcon: FontAwesomeIcons.eye,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15, top: 15),
                        child:
                            BtnScreen(onpressed: () {}, title: "Save Changes"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
