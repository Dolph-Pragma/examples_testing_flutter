import 'package:flutter/material.dart';
import 'package:githubuser_withtest/models/usernames_model.dart';
import 'package:githubuser_withtest/services/usernames_provider.dart';
import 'package:githubuser_withtest/widgets/btn_app.dart';
import 'package:githubuser_withtest/widgets/custom_input.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  UsernameProvider usernameProvider = UsernameProvider();
  final textCtrl = TextEditingController();
  bool isLight = false;
  String textValue = "Cambiar a claro: ";
  Color colorPpal = const Color.fromRGBO(3, 9, 23, 1);
  Color colorSdario = Colors.grey[200]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: colorSdario,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: colorPpal,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Usuario",
                style: GoogleFonts.spaceMono(
                    color: colorSdario,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                  icon: Icons.search_rounded,
                  placeholder: 'Usuario a buscar',
                  textEditingController: textCtrl),
              const SizedBox(
                height: 40,
              ),
              BtnApp(
                  textButton: 'Buscar',
                  btnColor: colorSdario,
                  onPressed: () => _buscando(context, textCtrl.text)),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textValue,
                    style: TextStyle(
                        color: colorSdario,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: isLight,
                    onChanged: toggleSwitch,
                    inactiveThumbColor: colorSdario,
                    inactiveTrackColor: colorSdario,
                    activeColor: colorSdario,
                    activeTrackColor: colorSdario,
                  ),
                ],
              )
            ],
          ),
        ));
  }

  void _buscando(BuildContext context, String username) async {
    UsernameModel info;
    textCtrl.clear();
    try {
      info = await usernameProvider.fetchUser(http.Client(), username);
      if (!mounted) return;
      Navigator.pushNamed(context, 'details', arguments: info);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "No encontrado",
        style: GoogleFonts.spaceMono(color: Colors.red),
      )));
    }
  }

  void toggleSwitch(bool value) {
    isLight = value;
    if (isLight == true) {
      textValue = "Cambiar a oscuro: ";
      colorPpal = Colors.grey[200]!;
      colorSdario = const Color.fromRGBO(3, 9, 23, 1);
      setState(() {});
    } else {
      textValue = "Cambiar a claro: ";
      colorPpal = const Color.fromRGBO(3, 9, 23, 1);
      colorSdario = Colors.grey[200]!;
      setState(() {});
    }
  }
}
