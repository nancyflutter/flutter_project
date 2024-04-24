import 'package:flutter/material.dart';

class AnimatedListWidgetScreen extends StatefulWidget {
  const AnimatedListWidgetScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedListWidgetScreen> createState() => _AnimatedListWidgetScreen();
}

class _AnimatedListWidgetScreen extends State<AnimatedListWidgetScreen> {
  final items = [];
  final GlobalKey<AnimatedListState> key = GlobalKey();

  void addItem() {
    items.insert(0, "Item ${items.length + 1}");
    key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void removeItem() {
    // String itemToRemove = items[0];
    key.currentState!.removeItem(
        0, (context, animation) => SizeTransition(sizeFactor: animation),
        duration: const Duration(milliseconds: 250));
    items.removeAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: key,
        initialItemCount: 0,
        padding: const EdgeInsets.all(10),
        itemBuilder: (_, index, animation) {
          return SizeTransition(
            key: UniqueKey(),
            sizeFactor: animation,
            child: Card(
              child: ListTile(
                title: Text(
                  items[index],
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: addItem,
            child: const Text("Add"),
          ),
          ElevatedButton(
            onPressed: () => removeItem(),
            child: const Text("Remove"),
          ),
        ],
      ),
    );
  }
}

