import 'package:flutter/material.dart';

class AnimatedPaddingWidgetScreen extends StatefulWidget {
  const AnimatedPaddingWidgetScreen({super.key});

  @override
  State<AnimatedPaddingWidgetScreen> createState() =>
      _AnimatedPaddingWidgetScreenState();
}

class _AnimatedPaddingWidgetScreenState
    extends State<AnimatedPaddingWidgetScreen> {
  double padding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedPadding(
          padding: EdgeInsets.all(padding),
          duration: const Duration(seconds: 1),
          child: ElevatedButton(
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              child: const Center(
                child: Text("Tap me"),
              ),
            ),
            onPressed: () {
              setState(
                () {
                  padding = (padding == 10) ? 40 : 10;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}


// method: 2
// import 'package:flutter/material.dart';
//
// class AnimatedPaddingWidgetScreen extends StatefulWidget {
//   const AnimatedPaddingWidgetScreen({super.key});
//
//   @override
//   State<AnimatedPaddingWidgetScreen> createState() => _AnimatedPaddingExampleState();
// }
//
// class _AnimatedPaddingExampleState extends State<AnimatedPaddingWidgetScreen> {
//   final _textController = TextEditingController(text: '0');
//   double _paddingValue = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Builder(
//         builder: (context) => Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               AnimatedPadding(
//                 padding: EdgeInsets.all(_paddingValue),
//                 duration: const Duration(seconds: 1),
//                 curve: Curves.bounceIn,
//                 onEnd: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Animation ends'))
//                   );
//                 },
//                 child: Container(
//                     width: 400,
//                     height: 200,
//                     color: Colors.blue
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(
//                     width: 100,
//                     height: 30,
//                     child: TextFormField(
//                       controller: _textController,
//                       keyboardType: TextInputType.number,
//                     ),
//                   ),
//                   const SizedBox(width: 15),
//                   ElevatedButton(
//                     child: const Text('Set'),
//                     onPressed: () {
//                       setState(() {
//                         _paddingValue =  double.parse(_textController.text);
//                       });
//                     },
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
