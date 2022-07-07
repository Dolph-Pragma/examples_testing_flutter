import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:githubuser_withtest/models/usernames_model.dart';
import 'package:githubuser_withtest/widgets/user_card.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsernameModel username = UsernameModel.fromRawJson(
        jsonEncode(ModalRoute.of(context)!.settings.arguments));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: UserCard(
            avatarUrl: NetworkImage(username.avatarUrl),
            name: username.name == null ? username.login : username.name!,
            login: username.login,
            publicRepos: username.publicRepos,
            followers: username.followers,
            following: username.following),
      ),
    );
  }
}
