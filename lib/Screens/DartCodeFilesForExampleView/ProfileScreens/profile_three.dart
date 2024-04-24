import 'package:flutter/material.dart';

class ProfileThree extends StatelessWidget {
  const ProfileThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Fill Your Profile",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Lorem Ipsum is simply dummy text of the \n printing and typesetting industry.",
              // selectionColor: Colors.black,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xff736E6E),
                height: 1.5,
                fontStyle: FontStyle.normal,
                fontSize: 18,
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: Color(0xffF9F8F8),
                    // borderRadius: BorderRadius.all(10),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/nature.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  height: 33,
                  width: 33,
                  margin: const EdgeInsets.only(top: 90,left: 90),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit, color: Colors.white, size: 24),
                    ],
                  ),
                ),
                // Icon(Icons.edit,color: Colors.black,size: 10),
              ],
            ),
            Container(
              height: 50,
              width: 340,
              padding: const EdgeInsetsDirectional.all(14),
              decoration: const BoxDecoration(
                color: Color(0xffF9F8F8),
                // color: Colors.amberAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              child: const Row(
                children: [
                  Text(
                    "Christina Ainsley",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 340,
              padding: const EdgeInsetsDirectional.all(14),
              decoration: const BoxDecoration(
                color: Color(0xffF9F8F8),
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              child: const Row(
                children: [
                  Text(
                    "Chritina",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 340,
              padding: const EdgeInsetsDirectional.all(14),
              decoration: const BoxDecoration(
                color: Color(0xffF9F8F8),
                // color: Colors.blueGrey,
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              child: Row(
                children: [
                  const Text(
                    "christina_ainsley@yourdomain.com",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.only(left: 68),
                    child: const Icon(
                      Icons.mail_outline,
                      color: Color(0xff000000),
                      // textDirection ??????
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 340,
              padding: const EdgeInsetsDirectional.all(14),
              decoration: const BoxDecoration(
                color: Color(0xffF9F8F8),
                // color: Colors.blueGrey,
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 20,
                    decoration: const BoxDecoration(
                      // color: Colors.amberAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://freepngimg.com/save/127389-logo-american-flag-picture-free-download-png-hd/1230x761"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    color: const Color(0xffF9F8F8),
                    width: 32,
                    height: 30,
                    margin: const EdgeInsetsDirectional.all(3),
                    child: const Icon(Icons.keyboard_arrow_down,
                        color: Color(
                          (0xff4C4C4C),
                        ),
                        size: 24),
                  ),
                  const Text(
                    " +1 111 467 378 399",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 8),
                  height: 50,
                  width: 150,
                  decoration: const BoxDecoration(
                    // color: Colors.blueGrey,
                    color: Color(0xffFFEEEF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Skip",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffFF575C),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  // alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                      bottom: 10, right: 10, top: 8, left: 25),
                  height: 50,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Color(0xffFF575C),
                    // color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Start",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
