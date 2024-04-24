/* ------------------------------- START ----------------------------------- */

import 'package:flutter/cupertino.dart';

class CupertinoPageScaffoldScreen extends StatelessWidget {
  const CupertinoPageScaffoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGrey4,
        resizeToAvoidBottomInset: true,
        navigationBar: CupertinoNavigationBar(
          middle: const Text("Cupertino App"),
          automaticallyImplyLeading: true,
          trailing: CupertinoButton(
            child: const Icon(
              CupertinoIcons.settings,
              color: CupertinoColors.activeBlue,
            ),
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Column(
                      children: [
                        Text(
                          "Hi",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "This is Cupertino Dialog.",
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                      ],
                    ),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () {
                          Navigator.pop(context, "Ok");
                          },
                        child: const Text("Ok"),
                      ),
                    ],
                  );
                },
              );
            }
          ),
          automaticallyImplyMiddle: true,
          transitionBetweenRoutes: true,
          // backgroundColor: CupertinoColors.black,
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("This is Cupertino page Scaffold Widget"),
            ],
          ),
        ),
      ),
    );
  }
}

/* ------------------------------- END ----------------------------------- */
