import 'package:flutter/material.dart';

class AutoCompleteScreen extends StatefulWidget {
  const AutoCompleteScreen({super.key});

  @override
  State<AutoCompleteScreen> createState() => _AutoCompleteScreenState();
}

class _AutoCompleteScreenState extends State<AutoCompleteScreen> {
  List<String> stringList = [
    'aardvark',
    'bobcat',
    'chameleon',
    'listener',
    'mouseRegion',
    'baseline',
    'flowWidget',
    'expansionPanel',
    // 'List',
    // 'Map',
    // 'Cast'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return stringList.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (String selection) {
          debugPrint('You just selected $selection');
        },
      ),
    );
  }
}
