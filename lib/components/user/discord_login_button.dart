import 'package:flutter/material.dart';

class DiscordLoginButton extends StatelessWidget {
  final Function login;

  const DiscordLoginButton({super.key, required this.login});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          fixedSize: const Size(200, 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          backgroundColor: const Color.fromARGB(255, 41, 39, 176)),
      onPressed: () async => await login(),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.discord),
            SizedBox(width: 6),
            Text("Log in with Discord")
          ]),
    );
  }
}
