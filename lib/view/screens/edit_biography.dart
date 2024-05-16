import 'package:fitxcel/view/helpers/button_comp.dart';
import 'package:fitxcel/view/helpers/text_comp.dart';
import 'package:flutter/material.dart';

class EditBiographyScreen extends StatefulWidget {
  const EditBiographyScreen({super.key});

  @override
  State<EditBiographyScreen> createState() => _EditBiographyScreenState();
}

class _EditBiographyScreenState extends State<EditBiographyScreen> {
  final editteam1 = TextEditingController();
  final editteam2 = TextEditingController();
  final editteam3 = TextEditingController();
  final editteam4 = TextEditingController();
  final editteam5 = TextEditingController();
  final editteam6 = TextEditingController();
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
          "Edit Bio",
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
                          "Your Biography",
                          style: TextStyle(
                            color: Color.fromARGB(199, 247, 247, 247),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 15, top: 15),
                        child: FormScreen(
                          contoller: editteam5,
                          hinttext:
                              "Sohail Abbas is the former captain of the National Hockey Team. He can be considered one of the optimum hockey players from the country. Sohail Abbas is the topmost goal scorer in international hockey with 348 international goals. He has been known as the King of the Drag Flick. Sohail Abbas also holds the world record for the highest number of hockey goals in a calendar year – he scored 60 goals in 1999",
                          maxlines: 9,
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
