import 'package:flutter/material.dart';
import 'package:githubuser_withtest/widgets/btn_app.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Image(image: AssetImage('assets/github.gif')),
                Text(
                  'Encuentra al usuario que estas buscando',
                  style: GoogleFonts.spaceMono(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(30, 42, 71, 1)),
                ),
                const SizedBox(
                  height: 50,
                ),
                BtnApp(
                    key: const Key('welcome_btn'),
                    textButton: 'Ingresar',
                    btnColor: const Color.fromRGBO(30, 42, 71, 1),
                    onPressed: () => Navigator.pushNamed(context, 'search'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
