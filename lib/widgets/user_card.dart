import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCard extends StatelessWidget {
  final ImageProvider avatarUrl;
  final String name;
  final String login;
  final int publicRepos;
  final int followers;
  final int following;

  const UserCard(
      {Key? key,
      required this.avatarUrl,
      required this.name,
      required this.login,
      required this.publicRepos,
      required this.followers,
      required this.following})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              foregroundImage: avatarUrl,
              maxRadius: 50,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.spaceMono(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '@$login',
                  style: GoogleFonts.spaceMono(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        cardNumbers()
      ],
    );
  }

  Widget cardNumbers() {
    return Card(
      color: Color.fromRGBO(30, 42, 71, 1),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "Repos",
                  style: GoogleFonts.spaceMono(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  publicRepos.toString(),
                  style: GoogleFonts.spaceMono(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "Followers",
                  style: GoogleFonts.spaceMono(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  followers.toString(),
                  style: GoogleFonts.spaceMono(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "Following",
                  style: GoogleFonts.spaceMono(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  following.toString(),
                  style: GoogleFonts.spaceMono(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
