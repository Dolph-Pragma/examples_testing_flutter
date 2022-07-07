import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:githubuser_withtest/widgets/btn_app.dart';
import 'package:githubuser_withtest/widgets/custom_input.dart';
import 'package:githubuser_withtest/widgets/user_card.dart';

void main() {
  group(
    'Mis Widgets',
    () {
      testWidgets(
        'Mi boton se crea bien',
        (tester) async {
          await tester.pumpWidget(MaterialApp(
            home: Scaffold(
              body: BtnApp(
                textButton: 'T',
                btnColor: Colors.white,
                onPressed: () {},
                key: const Key('test'),
              ),
            ),
          ));

          final textButton = find.text('T');

          expect(textButton, findsOneWidget);
        },
      );

      testWidgets(
        'La tarjeta de usuario esta correcta',
        (tester) async {
          await tester.pumpWidget(const MaterialApp(
            home: Scaffold(
              body: UserCard(
                  avatarUrl: AssetImage('assets/github.gif'),
                  name: "DolphH12",
                  login: "DolphH12",
                  publicRepos: 10,
                  followers: 10,
                  following: 10),
            ),
          ));

          final textName = find.text('DolphH12');

          expect(textName, findsOneWidget);
        },
      );

      testWidgets('Custom input', (tester) async {
        final textCtrl = TextEditingController();
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: CustomInput(
                icon: Icons.abc,
                placeholder: 'prueba test',
                textEditingController: textCtrl),
          ),
        ));

        await tester.enterText(find.byType(TextField), 'hola');

        expect(textCtrl.text, 'hola');
        expect(find.byIcon(Icons.abc), findsOneWidget);
      });
    },
  );
}
