import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class RiveAnimationOne extends StatelessWidget {
  const RiveAnimationOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(const PlantScreen());
                },
                child: const Text("PlantScreen"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(const LoginForm());
                },
                child: const Text("LoginForm"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(const ShapeAnimationOnBoarding());
                },
                child: const Text("ShapeAnimationOnBoarding"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(const LittleMachine());
                },
                child: const Text("LittleMachine"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(const SkinningDemo());
                },
                child: const Text("SkinningDemo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//====================================plant------------------------------------------------------------
class PlantScreen extends StatefulWidget {
  const PlantScreen({Key? key}) : super(key: key);

  @override
  State<PlantScreen> createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  Artboard? _riveArtboard;
  StateMachineController? controller;
  SMIInput<double>? _progress;
  String plantButtonText = "";

  late Timer _timer;
  int _treeProgress = 0;
  int _treeMaxProgress = 60;

  @override
  void initState() {
    super.initState();
    plantButtonText = "Plant";
    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/RiveAssets/tree_demo.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(artboard, 'Grow');
        if (controller != null) {
          artboard.addController(controller);
          _progress = controller.findInput('input');
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_treeProgress == _treeMaxProgress) {
          stopTimer();
          plantButtonText = "Plant";
          _treeProgress = 0;
          _treeMaxProgress = 60;
        } else {
          setState(() {
            _treeProgress++;
            _progress?.value = _treeProgress.toDouble();
          });
        }
      },
    );
  }

  void stopTimer() {
    setState(() {
      _timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    double treeWidth = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        title: const Text("Growing Tree"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60),
            child: Text(
              "Stay Focused",
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Center(
              child: _riveArtboard == null
                  ? const SizedBox()
                  : Container(
                      width: treeWidth,
                      height: treeWidth,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(treeWidth / 2), border: Border.all(color: Colors.white12, width: 10)),
                      child: Rive(alignment: Alignment.center, artboard: _riveArtboard!),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              intToTimeLeft(_treeMaxProgress - _treeProgress).toString(),
              style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              "Time left to grow the plant",
              style: TextStyle(color: Colors.white60, fontSize: 10, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: MaterialButton(
              height: 40.0,
              minWidth: 180.0,
              elevation: 8.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                if (_treeProgress > 0) {
                  stopTimer();
                  plantButtonText = "Plant";
                  _treeProgress = 0;
                  _treeMaxProgress = 60;
                } else {
                  plantButtonText = "Surrender";
                  startTimer();
                }
              },
              splashColor: Colors.redAccent,
              child: Text(plantButtonText),
            ),
          )
        ],
      ),
    );
  }
}

// Converts int to duration, returns duration left in MM:SS format
String intToTimeLeft(int value) {
  int h, m, s;

  h = value ~/ 3600;

  m = ((value - h * 3600)) ~/ 60;

  s = value - (h * 3600) - (m * 60);

  String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();

  String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();

  String result = "$minuteLeft:$secondsLeft";

  return result;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

//===============================================Login____=============================================

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late String animationURL;
  Artboard? _teddyArtboard;
  SMITrigger? successTrigger, failTrigger;
  SMIBool? isHandsUp, isChecking;
  SMINumber? numLook;

  StateMachineController? stateMachineController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationURL = defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS
        ? 'assets/RiveAssets/login_cartoon.riv'
        : 'RiveAssets/login_cartoon.riv';
    rootBundle.load(animationURL).then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        stateMachineController = StateMachineController.fromArtboard(artboard, "Login Machine");
        if (stateMachineController != null) {
          artboard.addController(stateMachineController!);

          for (var e in stateMachineController!.inputs) {
            debugPrint(e.runtimeType.toString());
            debugPrint("name${e.name}End");
          }

          for (var element in stateMachineController!.inputs) {
            if (element.name == "trigSuccess") {
              successTrigger = element as SMITrigger;
            } else if (element.name == "trigFail") {
              failTrigger = element as SMITrigger;
            } else if (element.name == "isHandsUp") {
              isHandsUp = element as SMIBool;
            } else if (element.name == "isChecking") {
              isChecking = element as SMIBool;
            } else if (element.name == "numLook") {
              numLook = element as SMINumber;
            }
          }
        }

        setState(() => _teddyArtboard = artboard);
      },
    );
  }

  void handsOnTheEyes() {
    isHandsUp?.change(true);
  }

  void lookOnTheTextField() {
    isHandsUp?.change(false);
    isChecking?.change(true);
    numLook?.change(0);
  }

  void moveEyeBalls(val) {
    numLook?.change(val.length.toDouble());
  }

  void login() {
    isChecking?.change(false);
    isHandsUp?.change(false);
    if (_emailController.text == "admin" && _passwordController.text == "admin") {
      successTrigger?.fire();
    } else {
      failTrigger?.fire();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd6e2ea),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text("LogIn Form")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_teddyArtboard != null)
                SizedBox(
                  width: 400,
                  height: 300,
                  child: Rive(
                    artboard: _teddyArtboard!,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              Container(
                alignment: Alignment.center,
                width: 400,
                padding: const EdgeInsets.only(bottom: 15),
                margin: const EdgeInsets.only(bottom: 15 * 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          const SizedBox(height: 15 * 2),
                          TextField(
                            controller: _emailController,
                            onTap: lookOnTheTextField,
                            onChanged: moveEyeBalls,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(fontSize: 14),
                            cursorColor: const Color(0xffb04863),
                            decoration: const InputDecoration(
                              hintText: "Email/Username",
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              focusColor: Color(0xffb04863),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffb04863),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextField(
                            controller: _passwordController,
                            onTap: handsOnTheEyes,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            style: const TextStyle(fontSize: 14),
                            cursorColor: const Color(0xffb04863),
                            decoration: const InputDecoration(
                              hintText: "Password",
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              focusColor: Color(0xffb04863),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffb04863),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //remember me checkbox
                              Row(
                                children: [
                                  Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                  ),
                                  const Text("Remember me"),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffb04863),
                                ),
                                child: const Text("Login"),
                              ),
                            ],
                          ),
                        ],
                      ),
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
//=================================shape========================================


class ShapeAnimationOnBoarding extends StatefulWidget {
  const ShapeAnimationOnBoarding({super.key});

  @override
  State<ShapeAnimationOnBoarding> createState() => _ShapeAnimationOnBoardingState();
}

class _ShapeAnimationOnBoardingState extends State<ShapeAnimationOnBoarding> {
  late RiveAnimationController btnAnimationController;

  bool isShowSignInDialog = false;

  @override
  void initState() {
    btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shape RIV")),
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/images/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
            // "assets/RiveAssets/loading.riv"
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: [
                          Text(
                            "Learn design & code",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 3),
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

// =========================  little ============================================

/// An example showing how to drive a StateMachine via a trigger input.
class LittleMachine extends StatefulWidget {
  const LittleMachine({Key? key}) : super(key: key);

  @override
  State<LittleMachine> createState() => _LittleMachineState();
}

class _LittleMachineState extends State<LittleMachine> {
  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  /// Message that displays when state has changed
  String stateChangeMessage = '';

  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<bool>? _trigger;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/RiveAssets/little_machine.riv').then(
          (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(
          artboard,
          'State Machine 1',
          onStateChange: _onStateChange,
        );
        if (controller != null) {
          artboard.addController(controller);
          _trigger = controller.findInput('Trigger 1');
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  /// Do something when the state machine changes state
  void _onStateChange(String stateMachineName, String stateName) => setState(
        () => stateChangeMessage = 'State Changed in $stateMachineName to $stateName',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Little Machine')),
      body: Stack(
        children: [
          _riveArtboard == null
              ? const SizedBox()
              : GestureDetector(
            onTapDown: (_) => _trigger?.value = true,
            child: Rive(
              artboard: _riveArtboard!,
              fit: BoxFit.cover,
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Press to activate!',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                stateChangeMessage,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
//===================================== ======================================

/// Basic skinning example. The skinning states is set in the Rive editor and
/// triggers are used to change the value.
class SkinningDemo extends StatefulWidget {
  const SkinningDemo({Key? key}) : super(key: key);

  @override
  State<SkinningDemo> createState() => _SkinningDemoState();
}

class _SkinningDemoState extends State<SkinningDemo> {
  static const _skinMapping = {"Skin_0": "Plain", "Skin_1": "Summer", "Skin_2": "Elvis", "Skin_3": "Superhero", "Skin_4": "Astronaut"};

  String _currentState = 'Plain';

  SMITrigger? _skin;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      'Motion',
      onStateChange: _onStateChange,
    );

    artboard.addController(controller!);
    _skin = controller.findInput<bool>('Skin') as SMITrigger;
  }

  void _onStateChange(String stateMachineName, String stateName) {
    if (stateName.contains("Skin_")) {
      setState(() {
        _currentState = _skinMapping[stateName] ?? 'Plain';
      });
    }
  }

  void _swapSkin() {
    _skin?.fire();
  }

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFFefcb7d);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Skinning Demo'),
      ),
      body: Stack(
        children: [
          Center(
            child: RiveAnimation.asset(
              'assets/RiveAssets/skins_demo.riv',
              fit: BoxFit.cover,
              onInit: _onRiveInit,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    'Choose an Avatar',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: _swapSkin,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xFF7d99ef)),
                  ),
                  child: const Text('Swap Skin'),
                ),
                const Spacer(),
                Text(
                  'Skin: $_currentState',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 48)
              ],
            ),
          )
        ],
      ),
    );
  }
}
