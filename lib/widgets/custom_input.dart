import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textEditingController;
  final Color? color;

  const CustomInput(
      {Key? key,
      required this.icon,
      required this.placeholder,
      required this.textEditingController,
      this.color = const Color.fromRGBO(3, 9, 23, 1)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: textEditingController,
        cursorColor: color,
        autocorrect: false,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            focusColor: color,
            prefixIcon: Icon(icon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: placeholder,
            hintStyle: GoogleFonts.spaceMono()),
      ),
    );
  }
}
