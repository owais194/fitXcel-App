import 'package:fitxcel/view/helpers/button_comp.dart';
import 'package:fitxcel/view/helpers/text_comp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditEmailScreen extends StatefulWidget {
  const EditEmailScreen({super.key});

  @override
  State<EditEmailScreen> createState() => _EditEmailScreenState();
}

class _EditEmailScreenState extends State<EditEmailScreen> {
  final editoldphoneno = TextEditingController();
  final editnewphoneno = TextEditingController();
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
          "Change Your Email",
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
                          "Your Email Address",
                          style: TextStyle(
                            color: Color.fromARGB(199, 247, 247, 247),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 25),
                        child: FormScreen(
                          contoller: editoldphoneno,
                          hinttext: "Old Email Address",
                          prefixIcon: FontAwesomeIcons.envelope,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 15),
                        child: FormScreen(
                          contoller: editnewphoneno,
                          hinttext: "New Email Address",
                          prefixIcon: FontAwesomeIcons.envelope,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 22,
                          top: 15,
                        ),
                        child: Card(
                          elevation: 50,
                          color: const Color(0xff15134A),
                          child: SizedBox(
                            height: 70,
                            width: 350,
                            child: Center(
                              child: Text(
                                "Code Sent to your Email",
                                style: TextStyle(
                                    color: const Color(0xffFFFFFF)
                                        .withOpacity(0.6)),
                              ),
                            ),
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
