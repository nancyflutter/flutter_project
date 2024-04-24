
/* ------------------------------- START ------------------------------------- */


import 'package:flutter/material.dart';

class CardWidgetScreen extends StatelessWidget {
  const CardWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.camera),
              title: Text("Sample Card 1"),
              subtitle: Text("Default Elevation"),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 8,
            child: ListTile(
              leading: Icon(Icons.camera),
              title: Text("Sample Card 2"),
              subtitle: Text("Elevation - 8"),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 16,
            child: ListTile(
              leading: Icon(Icons.album),
              title: Text("Sample Card 3"),
              subtitle: Text("Elevation - 16"),
            ),
          ),
          Card(
            color: Colors.pink,
            elevation: 24,
            shadowColor: Colors.yellow,
            child: ListTile(
              leading: Icon(Icons.album),
              title: Text("Sample Card 4"),
              subtitle: Text("Elevation - 24"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.camera),
                  title: Text("Sample Card 1"),
                  subtitle: Text("Default Elevation"),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
                child: Card(
                  color: Colors.white,
                  elevation: 8,
                  child: ListTile(
                    leading: Icon(Icons.camera),
                    title: Text("Sample Card 2"),
                    subtitle: Text("Elevation - 8"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                child: Card(
                  color: Colors.white,
                  elevation: 16,
                  child: ListTile(
                    leading: Icon(Icons.album),
                    title: Text("Sample Card 3"),
                    subtitle: Text("Elevation - 16"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 48, 24, 24),
                child: Card(
                  elevation: 24,
                  child: ListTile(
                    leading: Icon(Icons.album),
                    title: Text("Sample Card 4"),
                    subtitle: Text("Elevation - 24"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


/* ------------------------------- END ------------------------------------- */
