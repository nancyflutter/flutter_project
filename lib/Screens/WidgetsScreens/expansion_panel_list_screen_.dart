import 'package:flutter/material.dart';

class ExpansionPanelListScreen extends StatefulWidget {
  const ExpansionPanelListScreen({super.key});

  @override
  State<ExpansionPanelListScreen> createState() =>
      _ExpansionPanelListScreenState();
}

class _ExpansionPanelListScreenState extends State<ExpansionPanelListScreen> {
  int index = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionPanelList(
          dividerColor: Colors.deepPurple,
          expandIconColor: Colors.deepPurple,
          expandedHeaderPadding: const EdgeInsets.all(8),
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              if (index == panelIndex) {
                index = -1;
              } else {
                index = panelIndex;
              }
            });
          },
          animationDuration: const Duration(seconds: 1),
          elevation: 2,
          children: [
            ExpansionPanel(
              isExpanded: index == 0,
              canTapOnHeader: true,
              backgroundColor: Colors.green[700],
              headerBuilder: (context, isExpanded) {
                return const ListTile(
                  title: Text("Data 1"),
                );
              },
              body: const ListTile(
                title: Text("Data 1"),
                subtitle: Text("for Data 1"),
              ),
            ),
            ExpansionPanel(
              isExpanded: index == 1,
              canTapOnHeader: true,
              backgroundColor: Colors.green[600],
              headerBuilder: (context, isExpanded) {
                return const ListTile(
                  title: Text("Data 2"),
                );
              },
              body: const ListTile(
                title: Text("Data 2"),
                subtitle: Text("for Data 2"),
              ),
            ),
            ExpansionPanel(
              isExpanded: index == 2,
              canTapOnHeader: true,
              backgroundColor: Colors.green[500],
              headerBuilder: (context, isExpanded) {
                return const ListTile(
                  title: Text("Data 3"),
                );
              },
              body: const ListTile(
                title: Text("Data 3"),
                subtitle: Text("for Data 3"),
              ),
            ),
            ExpansionPanel(
              isExpanded: index == 3,
              canTapOnHeader: true,
              backgroundColor: Colors.green[400],
              headerBuilder: (context, isExpanded) {
                return const ListTile(
                  title: Text("Data 4"),
                );
              },
              body: const ListTile(
                title: Text("Data 4"),
                subtitle: Text("for Data 4"),
              ),
            ), ExpansionPanel(
              isExpanded: index == 4,
              canTapOnHeader: true,
              backgroundColor: Colors.green[300],
              headerBuilder: (context, isExpanded) {
                return const ListTile(
                  title: Text("Data 5"),
                );
              },
              body: const ListTile(
                title: Text("Data 5"),
                subtitle: Text("for Data 5"),
              ),
            ), ExpansionPanel(
              isExpanded: index == 5,
              canTapOnHeader: true,
              backgroundColor: Colors.green[200],
              headerBuilder: (context, isExpanded) {
                return const ListTile(
                  title: Text("Data 6"),
                );
              },
              body: const ListTile(
                title: Text("Data 6"),
                subtitle: Text("for Data 6"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
