import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  String? hinttext;
  final int? maxlines;
  final contoller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPress;
  final validator;

  FormScreen(
      {super.key,
      this.hinttext,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.onPress,
      this.maxlines,
      required this.contoller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.white,
        ),
        controller: contoller,
        maxLines: maxlines,
        decoration: InputDecoration(
          hintText: hinttext,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          hintStyle: const TextStyle(
            color: Color.fromARGB(199, 247, 247, 247),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Icon(
              prefixIcon,
              color: const Color.fromARGB(199, 247, 247, 247),
            ),
          ),
          suffixIcon: IconButton(
            onPressed: onPress,
            icon: Icon(
              suffixIcon,
              color: const Color.fromARGB(199, 247, 247, 247),
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.orange, width: 2)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Color(0xffF7F7F7),
                width: 2,
              )),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "field can not null";
          }
        },
      ),
    );
  }
}
