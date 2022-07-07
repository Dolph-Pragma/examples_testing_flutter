import 'package:flutter_test/flutter_test.dart';
import 'package:githubuser_withtest/models/usernames_model.dart';
import 'package:githubuser_withtest/services/usernames_provider.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_data_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group(
    'Revision de peticiones',
    () {
      test(
        'Retorna un usuario si la llamada es satisfactoria',
        () async {
          final client = MockClient();
          final service = UsernameProvider();
          const username = 'DolphH12';
          const String userTest =
              '{"login": "DolphH12","avatar_url": "https://avatars.githubusercontent.com/u/66704474?v=4","name": null,"public_repos": 42,"followers": 10,"following": 2}';

          when(client.get(Uri.parse('https://api.github.com/users/$username')))
              .thenAnswer((_) async => http.Response(userTest, 200));

          expect(
              await service.fetchUser(client, username), isA<UsernameModel>());
        },
      );

      test(
        'Lanza una excepcion en caso de que la llamada cause error',
        () {
          final client = MockClient();
          final service = UsernameProvider();
          const username = 'DolphH12';

          when(client.get(Uri.parse('https://api.github.com/users/$username')))
              .thenAnswer((_) async => http.Response('Failed to load', 404));

          expect(service.fetchUser(client, username), throwsException);
        },
      );
    },
  );
}
