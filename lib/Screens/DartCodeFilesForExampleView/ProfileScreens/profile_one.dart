import 'package:flutter/material.dart';

class ProfileOne extends StatelessWidget {
  const ProfileOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/panda.png'),
                      fit: BoxFit.fill),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "Name",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text("098765432",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 10),
                child: Text("user@gmail.com",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    )),
              ),
              const Divider(
                color: Colors.black,
                thickness: 0.8,
                indent: 8,
                endIndent: 8,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Address:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child:
                          Text("Address Line 1,\nAddress Line 2\nAddress Line 3",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              )),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Country:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text("Country Name",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
