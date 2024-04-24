import 'package:flutter/material.dart';

class SwitchListTileScreen extends StatefulWidget {
  const SwitchListTileScreen({super.key});

  @override
  State<SwitchListTileScreen> createState() => _SwitchListTileScreenState();
}

class _SwitchListTileScreenState extends State<SwitchListTileScreen> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSwitch ? Colors.amber : Colors.white,
      child: Center(
        child: SwitchListTile(
          value: isSwitch,
          onChanged: (value) {
            setState(() {
              isSwitch = value;
            });
          },
          title: Text(isSwitch ? "Color Switch On" : "Color Switch Off"),
          subtitle: const Text("switch"),
          secondary: const FlutterLogo(),
        ),
      ),
    );
  }
}
