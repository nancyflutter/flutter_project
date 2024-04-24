

import 'package:flutter/material.dart';

class AnimationTask extends StatefulWidget {
  const AnimationTask({super.key});

  @override
  State<AnimationTask> createState() => _AnimationTaskState();
}

class _AnimationTaskState extends State<AnimationTask>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  AnimationController? animationControllerTwo;
  AnimationController? animationControllerThree;
  Animation<double>? animation;
  Animation<double>? animationTwo;
  Animation<double>? animationThree;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))..forward();
    animation =
        Tween<double>(begin: 280, end: -200).animate(animationController!)
          ..addListener(() {
            setState(() {});
          });
    animationControllerTwo =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))..forward();
    animationTwo =
        Tween<double>(begin: 280, end: -400).animate(animationController!)
          ..addListener(() {
            setState(() {});
          });
    animationControllerThree =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))..forward();
    animationThree =
        Tween<double>(begin: 280, end: -300).animate(animationController!)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: Colors.deepPurple[100],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: const AlignmentDirectional(1, 2.2),
              child: Transform.translate(
                offset: Offset(0, animationThree!.value),
                child: Container(
                  height: 170,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple[300],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: const AlignmentDirectional(-1, 1),
              child: Transform.translate(
                offset: Offset(0, animation!.value),
                child: Container(
                  height: 200,
                  width: 170,
                  decoration: const BoxDecoration(
                    // color: Colors.yellow,
                      image: DecorationImage(
                    image: AssetImage('assets/images/rabbit.png'),
                  )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: const AlignmentDirectional(1, 2.1),
              child: Transform.translate(
                offset: Offset(0, animationTwo!.value),
                child: Container(
                  height: 230,
                  width: 170,
                  decoration: const BoxDecoration(
                    // color: Colors.green,
                      image: DecorationImage(
                    image: AssetImage('assets/images/panda.png'),
                  )),
                ),
              ),
            ),
          ),

          // Align(
          //   alignment: AlignmentDirectional.bottomCenter,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       animationController!.forward();
          //       animationControllerTwo!.forward();
          //       animationControllerThree!.forward();
          //     },
          //     child: const Text('Go'),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
}

//
// import 'package:flutter/material.dart';
//
// class T_B_Animation extends StatefulWidget {
//   const T_B_Animation({super.key});
//
//   @override
//   State<T_B_Animation> createState() => T_B_AnimationState();
// }
//
// class T_B_AnimationState extends State<T_B_Animation> with TickerProviderStateMixin  {
//   late Animation<double> animation;
//   late Animation<double> animation1;
//   late Animation<double> animation2;
//   late AnimationController animationController;
//   late AnimationController animationController1;
//   late AnimationController animationController2;
//
//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1))..forward();
//     animationController1 = AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();
//     animationController2 = AnimationController(vsync: this, duration: const Duration(seconds: 3))..forward();
//     animation = Tween<double>(begin: 0, end: -300).animate(animationController)..addListener(() {setState(() {});});
//     animation1 = Tween<double>(begin: 250, end: -300).animate(animationController1)..addListener(() {setState(() {});});
//     animation2 = Tween<double>(begin: 250, end: -300).animate(animationController1)..addListener(() {setState(() {});});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//
//         Align(
//           alignment: const AlignmentDirectional(-3,1.5),
//           child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Transform.translate(
//                 offset: Offset(0, animation1.value),
//                 child: Container(
//                   height: 100,
//                   width: 150,
//                   decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(16)
//                   ),
//                 ),
//               ),
//               Transform.translate(
//                 offset: Offset(0, animation2.value),
//                 child: Container(
//                   height: 100,
//                   width: 150,
//                   decoration: BoxDecoration(
//                       color: Colors.cyan,
//                       borderRadius: BorderRadius.circular(16)
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Align(
//           alignment: const AlignmentDirectional(0,2),
//           child: Transform.translate(
//             offset: Offset(0, animation.value),
//             child: Container(
//               height: 100,
//               width: 150,
//               decoration: BoxDecoration(
//                   color: Colors.yellow,
//                   borderRadius: BorderRadius.circular(16)
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }
// }
