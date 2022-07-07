import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnApp extends StatelessWidget {
  final String textButton;
  final Color btnColor;
  final VoidCallback onPressed;

  const BtnApp(
      {Key? key,
      required this.textButton,
      required this.btnColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        key: key,
        onPressed: onPressed,
        style: raisedButtonStyle(btnColor),
        child: SizedBox(
          width: double.infinity,
          height: 45,
          child: Center(
            child: Text(textButton,
                style: GoogleFonts.spaceMono(
                  fontSize: 18,
                )),
          ),
        ));
  }

  ButtonStyle raisedButtonStyle(Color color) {
    return ElevatedButton.styleFrom(
        primary: color,
        onPrimary: color != Colors.grey[200]
            ? Colors.grey[200]
            : const Color.fromRGBO(3, 9, 23, 1),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));
  }
}
