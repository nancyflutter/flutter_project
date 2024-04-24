import 'package:flutter/material.dart';

class AboutDialogScreen extends StatelessWidget {
  const AboutDialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AboutDialog(
                applicationName: 'Flutter Tutorial',
                applicationVersion: '2.4.7',
                applicationIcon: CircleAvatar(
                  child: Image.asset(
                      'assets/images/Flutter_logo.png'),
                ),
                applicationLegalese:
                    'This application can be used by all audiences.',
                children: const [
                  Text(
                      'Learn Flutter Widgets and samples with code- for beginners.'),
                ],
              ),
            );
          },
          child: const Text("Show About Dialog"),
        ),
      ),
    );
  }
}
