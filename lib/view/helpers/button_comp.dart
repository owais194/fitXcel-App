import 'package:flutter/material.dart';

class BtnScreen extends StatelessWidget {
  VoidCallback onpressed;
  String title;
  double? width;
  BtnScreen(
      {super.key, required this.onpressed, required this.title, this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            color: const Color(0xffFE7A00),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(color: Color(0xffFFFFFF), fontSize: 20),
        )),
      ),
    );
  }
}
