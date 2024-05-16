import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialScreen extends StatelessWidget {
  String image;
  final VoidCallback onpressed;
  final double radius;
  SocialScreen(
      {super.key,
      required this.image,
      required this.radius,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onpressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: radius,
          backgroundImage: null,
          backgroundColor: const Color(0xffFFFFFF),
          child: Image.asset(image),
        ),
      ),
    );
  }
}
