import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:githubuser_withtest/main.dart' as app;
import 'package:githubuser_withtest/pages/details_page.dart';
import 'package:githubuser_withtest/pages/search_page.dart';
import 'package:githubuser_withtest/pages/welcome_page.dart';
import 'package:githubuser_withtest/widgets/btn_app.dart';
import 'package:githubuser_withtest/widgets/user_card.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Aplicacion total', () {
    testWidgets('Aplicacion funcional', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.byType(BtnApp), findsOneWidget);

      await tester.tap(find.byType(BtnApp));

      await tester.pumpAndSettle(const Duration(milliseconds: 4000));

      expect(find.byType(SearchPage), findsOneWidget);

      expect(find.byType(TextField), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'DolphH12');

      await tester.tap(find.byType(BtnApp));

      await tester.pumpAndSettle(const Duration(milliseconds: 4000));

      expect(find.byType(DetailsPage), findsOneWidget);
      expect(find.byType(UserCard), findsOneWidget);

      await tester.pumpAndSettle(const Duration(milliseconds: 4000));

      expect(find.byType(IconButton), findsOneWidget);

      await tester.tap(find.byType(IconButton));

      await tester.pumpAndSettle(const Duration(milliseconds: 4000));

      expect(find.byType(SearchPage), findsOneWidget);

      expect(find.byType(IconButton), findsOneWidget);

      await tester.tap(find.byType(IconButton));

      await tester.pumpAndSettle(const Duration(milliseconds: 4000));

      expect(find.byType(WelcomePage), findsOneWidget);

      await tester.pumpAndSettle(const Duration(milliseconds: 4000));

      await tester.tap(find.byType(BtnApp));

      await tester.pumpAndSettle(const Duration(milliseconds: 4000));

      await tester.enterText(find.byType(TextField), 'DolphH1');

      await tester.tap(find.byType(BtnApp));

      expect(find.text("No encontrado"), findsNothing);

      await tester.pumpAndSettle(const Duration(milliseconds: 4000));

      expect(find.text("No encontrado"), findsOneWidget);
    });
  });
}
