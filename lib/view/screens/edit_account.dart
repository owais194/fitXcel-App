import 'package:fitxcel/view/helpers/button_comp.dart';
import 'package:fitxcel/view/helpers/text_comp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final editbank = TextEditingController();
  final editaccountno = TextEditingController();
  final editholdername = TextEditingController();
  final editachievement4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff070540),
      appBar: AppBar(
        leading: BackButton(
          color: Color(0xffF7F7F7),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color(0xff070540),
        toolbarHeight: 120,
        title: Text(
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
              decoration: BoxDecoration(
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 8, top: 45),
                        child: Text(
                          "Your Bank Account Details",
                          style: TextStyle(
                            color: Color.fromARGB(199, 247, 247, 247),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 25),
                        child: FormScreen(
                          contoller: editbank,
                          hinttext: "Select Bank",
                          prefixIcon: FontAwesomeIcons.buildingColumns,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 15),
                        child: FormScreen(
                          contoller: editaccountno,
                          hinttext: "Account Number Account Holder Name",
                          prefixIcon: FontAwesomeIcons.key,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 15),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, bottom: 15, top: 15),
                          child: FormScreen(
                            contoller: editholdername,
                            hinttext: "Account Holder Name",
                            prefixIcon: FontAwesomeIcons.user,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 50,
                          color: const Color(0xff15134A),
                          child: SizedBox(
                            height: 70,
                            width: 350,
                            child: Center(
                              child: Text(
                                "Account should be on your Name",
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 15, top: 15),
                    child: BtnScreen(onpressed: () {}, title: "Save Changes"),
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
