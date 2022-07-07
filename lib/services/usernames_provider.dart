import 'dart:convert';
import 'package:githubuser_withtest/models/usernames_model.dart';
import 'package:http/http.dart' as http;

class UsernameProvider {
  Future<Map<String, dynamic>> cargarUsuario(String username) async {
    var request = http.MultipartRequest(
        'GET', Uri.parse('https://api.github.com/users/$username'));

    http.StreamedResponse response = await request.send();

    final decodedData = json.decode(await response.stream.bytesToString());

    if (response.statusCode == 200) {
      return decodedData;
    } else {
      return {};
    }
  }

  Future<UsernameModel> fetchUser(http.Client client, String username) async {
    final response =
        await client.get(Uri.parse('https://api.github.com/users/$username'));

    if (response.statusCode == 200) {
      return UsernameModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }
}
