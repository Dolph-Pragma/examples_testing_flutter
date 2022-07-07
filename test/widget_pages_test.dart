import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:githubuser_withtest/pages/search_page.dart';
import 'package:githubuser_withtest/pages/welcome_page.dart';
import 'package:githubuser_withtest/routes/routes.dart';
import 'package:githubuser_withtest/widgets/btn_app.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'widget_pages_test.mocks.dart';

@GenerateMocks([],
    customMocks: [MockSpec<NavigatorObserver>(returnNullOnMissingStub: true)])
void main() {
  group(
    'verificando paginas de la app',
    () {
      testWidgets(
        'Navegacion de la pantalla inicial',
        (tester) async {
          final mockObserver = MockNavigatorObserver();

          await tester.pumpWidget(MaterialApp(
              routes: appRoutes,
              home: const WelcomePage(),
              navigatorObservers: [mockObserver]));

          final button = find.byType(BtnApp);
          expect(button, findsOneWidget);

          await tester.tap(button);

          await tester.pumpAndSettle();

          verify(mockObserver.didPush(any, any));

          expect(find.byType(SearchPage), findsOneWidget);
        },
      );

      testWidgets('Verificando cambio de color con switch en SearchPage',
          (tester) async {
        await tester.pumpWidget(const MaterialApp(home: SearchPage()));

        expect(
            (tester.widget(find.byType(Scaffold)) as Scaffold).backgroundColor,
            const Color.fromRGBO(3, 9, 23, 1));

        final switchTap = find.byType(Switch);

        await tester.tap(switchTap);

        await tester.pumpAndSettle();

        expect(
            (tester.widget(find.byType(Scaffold)) as Scaffold).backgroundColor,
            Colors.grey[200]!);

        await tester.tap(switchTap);

        await tester.pumpAndSettle();

        expect(
            (tester.widget(find.byType(Scaffold)) as Scaffold).backgroundColor,
            const Color.fromRGBO(3, 9, 23, 1));
      });
    },
  );
}
