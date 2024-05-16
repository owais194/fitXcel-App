import 'package:fitxcel/view/helpers/button_comp.dart';
import 'package:fitxcel/view/helpers/text_comp.dart';
import 'package:flutter/material.dart';

class EditAchievementScreen extends StatefulWidget {
  const EditAchievementScreen({super.key});

  @override
  State<EditAchievementScreen> createState() => _EditAchievementScreenState();
}

class _EditAchievementScreenState extends State<EditAchievementScreen> {
  final editachievement1 = TextEditingController();
  final editachievement2 = TextEditingController();
  final editachievement3 = TextEditingController();
  final editachievement4 = TextEditingController();
  final editachievement5 = TextEditingController();
  final editachievement6 = TextEditingController();
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
          "Edit Teams",
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
                          "Your Achievements",
                          style: TextStyle(
                            color: Color.fromARGB(199, 247, 247, 247),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 25),
                        child: FormScreen(
                          contoller: editachievement1,
                          hinttext: "Achievements #1",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 15),
                        child: FormScreen(
                          contoller: editachievement2,
                          hinttext: "Achievements #2",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 15),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, bottom: 15, top: 15),
                          child: FormScreen(
                            contoller: editachievement3,
                            hinttext: "Achievements #3",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 15),
                        child: FormScreen(
                          contoller: editachievement4,
                          hinttext: "Achievements #4",
                          onPress: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 15),
                        child: FormScreen(
                          contoller: editachievement5,
                          hinttext: "Achievements #5",
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
