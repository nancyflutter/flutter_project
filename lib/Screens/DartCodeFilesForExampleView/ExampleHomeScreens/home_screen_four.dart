import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenFour extends StatelessWidget {
  const HomeScreenFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple[500],
        centerTitle: true,
        title: const Text("Home"),
        actions: const [
          Icon(Icons.search),
        ],
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          Expanded(
            flex: 35,
            child: Container(
              height: Get.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.deepPurple[500],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(38),
                  bottomRight: Radius.circular(38),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white10,
                        child: Icon(Icons.share, color: Colors.white),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://googleflutter.com/sample_image.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white10,
                        child: Icon(Icons.library_add, color: Colors.white),
                      ),
                    ],
                  ),
                  const Text(
                    "Thru \ntest@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 65,
            child: SizedBox(
              height: 370,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Expanded(
                          flex: 50,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(25),
                              child: Row(
                                children: [
                                  Icon(Icons.fiber_new_sharp,
                                      color: Colors.green),
                                  VerticalDivider(
                                    color: Colors.black,
                                    thickness: 10,
                                    endIndent: 15,
                                    indent: 15,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: "130",
                                      style: TextStyle(color: Colors.orange),
                                      children: [
                                        TextSpan(
                                          text: "\nNew Follower",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 50,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(25),
                              child: Row(
                                children: [
                                  const Icon(Icons.ac_unit, color: Colors.green),
                                  const VerticalDivider(
                                    color: Colors.black,
                                    thickness: 10,
                                    endIndent: 15,
                                    indent: 15,
                                  ),
                                  Expanded(
                                    child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "500",
                                            style: TextStyle(color: Colors.green),
                                          ),
                                          TextSpan(
                                            text: "\nLikes Received",
                                            style: TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis,),

                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 50,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(25),
                              child: Row(
                                children: [
                                  Icon(Icons.all_inclusive, color: Colors.blue),
                                  VerticalDivider(
                                    color: Colors.black,
                                    thickness: 10,
                                    endIndent: 15,
                                    indent: 15,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: "6000",
                                      style: TextStyle(color: Colors.blue),
                                      children: [
                                        TextSpan(
                                            text: "\nTotal Follower",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 50,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(25),
                              child: Row(
                                children: [
                                  Icon(Icons.card_giftcard,
                                      color: Colors.deepPurple),
                                  VerticalDivider(
                                    color: Colors.black,
                                    thickness: 10,
                                    endIndent: 15,
                                    indent: 15,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: "130",
                                      style:
                                          TextStyle(color: Colors.deepPurple),
                                      children: [
                                        TextSpan(
                                            text: "\nGifts",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 50,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(25),
                              child: Row(
                                children: [
                                  Icon(Icons.person, color: Colors.greenAccent),
                                  VerticalDivider(
                                    color: Colors.black,
                                    thickness: 10,
                                    endIndent: 15,
                                    indent: 15,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: "1200",
                                      style:
                                          TextStyle(color: Colors.greenAccent),
                                      children: [
                                        TextSpan(
                                            text: "\nProfile Views",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 50,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(25),
                              child: Row(
                                children: [
                                  Icon(Icons.thumb_up, color: Colors.blue),
                                  VerticalDivider(
                                    color: Colors.black,
                                    thickness: 10,
                                    endIndent: 15,
                                    indent: 15,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: "180",
                                      style: TextStyle(color: Colors.blue),
                                      children: [
                                        TextSpan(
                                            text: "\nSuper Likes",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
