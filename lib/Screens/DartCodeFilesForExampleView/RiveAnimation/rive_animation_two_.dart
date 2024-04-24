import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class OTPScreenTwo extends StatefulWidget {
  const OTPScreenTwo({super.key});

  @override
  State<OTPScreenTwo> createState() => _OTPScreenTwoState();
}

class _OTPScreenTwoState extends State<OTPScreenTwo> {
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
                  Get.to(const SimpleAssetAnimation());
                },
                child: const Text("SimpleAssetAnimation"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(const LiquidDownload());
                },
                child: const Text("LiquidDownload"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(const PlayPauseAnimation());
                },
                child: const Text("PlayPauseAnimation"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(const PlayOneShotAnimation());
                },
                child: const Text("PlayOneShotAnimation"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(const SpeedyAnimation());
                },
                child: const Text("SpeedyAnimation"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(const SimpleStateMachine());
                },
                child: const Text("SimpleStateMachine"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Basic example playing a Rive animation from a packaged asset.
class SimpleAssetAnimation extends StatelessWidget {
  const SimpleAssetAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Animation'),
      ),
      body: const Center(
        child: RiveAnimation.asset(
          'assets/RiveAssets/off_road_car.riv',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LiquidDownload extends StatefulWidget {
  const LiquidDownload({Key? key}) : super(key: key);

  @override
  State<LiquidDownload> createState() => _LiquidDownloadState();
}

class _LiquidDownloadState extends State<LiquidDownload> {
  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<bool>? _start;
  SMIInput<double>? _progress;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/RiveAssets/liquid_download.riv').then(
          (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(artboard, 'Download');
        if (controller != null) {
          artboard.addController(controller);
          _start = controller.findInput('Download');
          _progress = controller.findInput('Progress');
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liquid Download'),
      ),
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : GestureDetector(
          onTapDown: (_) => _start?.value = true,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'Press to activate, slide for progress...',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Slider(
                value: _progress!.value,
                min: 0,
                max: 100,
                label: _progress!.value.round().toString(),
                onChanged: (double value) => setState(() {
                  _progress!.value = value;
                }),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Rive(
                  artboard: _riveArtboard!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayPauseAnimation extends StatefulWidget {
  const PlayPauseAnimation({Key? key}) : super(key: key);

  @override
  State<PlayPauseAnimation> createState() => _PlayPauseAnimationState();
}

class _PlayPauseAnimationState extends State<PlayPauseAnimation> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Toggles between play and pause animation states
  void _togglePlay() => setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Example'),
      ),
      body: RiveAnimation.asset(
        'assets/RiveAssets/off_road_car.riv',
        fit: BoxFit.cover,
        controllers: [_controller],
        // Update the play state when the widget's initialized
        onInit: (_) => setState(() {}),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

/// Demonstrates playing a one-shot animation on demand
class PlayOneShotAnimation extends StatefulWidget {
  const PlayOneShotAnimation({Key? key}) : super(key: key);

  @override
  State<PlayOneShotAnimation> createState() => _PlayOneShotAnimationState();
}

class _PlayOneShotAnimationState extends State<PlayOneShotAnimation> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'bounce',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One-Shot Example'),
      ),
      body: Center(
        child: RiveAnimation.asset(
          'assets/RiveAssets/vehicles.riv',
          animations: const ['idle', 'curves'],
          fit: BoxFit.cover,
          controllers: [_controller],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // disable the button while playing the animation
        onPressed: () => _isPlaying ? null : _controller.isActive = true,
        tooltip: 'Bounce',
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}

class SpeedyAnimation extends StatelessWidget {
  const SpeedyAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Controller - Speed'),
      ),
      body: Center(
        child: RiveAnimation.asset(
          'assets/RiveAssets/vehicles.riv',
          fit: BoxFit.cover,
          animations: const ['idle'],
          controllers: [SpeedController('curves', speedMultiplier: 3)],
        ),
      ),
    );
  }
}

class SpeedController extends SimpleAnimation {
  final double speedMultiplier;

  SpeedController(
      String animationName, {
        double mix = 1,
        this.speedMultiplier = 1,
      }) : super(animationName, mix: mix);

  @override
  void apply(RuntimeArtboard artboard, double elapsedSeconds) {
    if (instance == null || !instance!.keepGoing) {
      isActive = false;
    }
    instance!
      ..animation.apply(instance!.time, coreContext: artboard, mix: mix)
      ..advance(elapsedSeconds * speedMultiplier);
  }
}

/// An example demonstrating a simple state machine.
///
/// The "bumpy" state machine will be activated on tap of the vehicle.
class SimpleStateMachine extends StatefulWidget {
  const SimpleStateMachine({Key? key}) : super(key: key);

  @override
  State<SimpleStateMachine> createState() => _SimpleStateMachineState();
}

class _SimpleStateMachineState extends State<SimpleStateMachine> {
  SMITrigger? _bump;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'bumpy');
    artboard.addController(controller!);
    _bump = controller.findInput<bool>('bump') as SMITrigger;
  }

  void _hitBump() => _bump?.fire();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple State Machine'),
      ),
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: _hitBump,
              child: RiveAnimation.asset(
                'assets/RiveAssets/vehicles.riv',
                fit: BoxFit.cover,
                onInit: _onRiveInit,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Bump the van!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
