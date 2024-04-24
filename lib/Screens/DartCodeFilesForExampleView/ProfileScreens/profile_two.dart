import 'package:flutter/material.dart';

class ProfileTwo extends StatelessWidget {
  const ProfileTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/correct.png'),
                ),
              ),
              const Text(
                'Proto Coders Point',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red[400],
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 200,
                child: Divider(
                  color: Colors.teal[100],
                  thickness: 1.5,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                    "Keep visiting protocolizing.com for more contents"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal[900],
                      ),
                      title: const Text(
                        '+91 85465XXX8XX',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )),
              ),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.cake,
                    color: Colors.teal[900],
                  ),
                  title: const Text(
                    '08-05-1995',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
