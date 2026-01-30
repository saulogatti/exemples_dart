import 'package:exemplos_flutter/animacoes/animated_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() => runApp(const MaterialApp(home: InteractiveSimulationWidget()));

class InteractiveSimulationWidget extends StatefulWidget {
  const InteractiveSimulationWidget({super.key});

  @override
  State<InteractiveSimulationWidget> createState() => _InteractiveSimulationWidgetState();
}

class _InteractiveSimulationWidgetState extends State<InteractiveSimulationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Simulation Demo'),
        actions: [
          IconButton(
            onPressed: () {
              // Restart the animation
              final spring = SpringDescription.withDurationAndBounce(
                duration: const Duration(seconds: 1),
                bounce: 0.5,
              );
              final sim = SpringSimulation(spring, 0, 300, 0);
              _controller.animateWith(sim);
            },
            icon: const Icon(Icons.repeat),
          ),
          IconButton(onPressed: _startFall, icon: const Icon(Icons.arrow_downward)),
        ],
      ),
      body: Row(
        children: [
          Column(
            children: [
              ActionChip(
                label: const Text("Spring"),
                onPressed: () {
                  final spring = SpringDescription.withDurationAndBounce(
                    duration: const Duration(seconds: 1),
                    bounce: 0.5,
                  );
                  final sim = SpringSimulation(spring, 0, 300, 1.5);
                  _controller.animateWith(sim);
                },
              ),
              const SizedBox(height: 20),
              ActionChip(label: const Text("Gravity"), onPressed: _startFall),
              const SizedBox(height: 20),
              ActionChip(
                label: const Text("Friction"),
                onPressed: () {
                  final friction = FrictionSimulation.through(0, 300, 500, 0);
                  _controller.animateWith(friction);
                },
              ),
              const SizedBox(height: 20),
              ActionChip(
                label: const Text("Bouncing Ball"),
                onPressed: () {
                  final gravity = GravitySimulation(9.8 * 100, 0, double.infinity, 0);
                  final bounceSim = BouncingScrollSimulation(
                    position: 0,
                    velocity: 0,
                    leadingExtent: 0,
                    trailingExtent: 300,
                    spring: SpringDescription.withDampingRatio(mass: 1, stiffness: 100, ratio: 0.5),
                  );
                  _controller.animateWith(bounceSim).then((_) {
                    _controller.animateWith(gravity);
                  });
                },
              ),
              const SizedBox(height: 20),
              ActionChip(
                label: const Text("Custom Clamped"),
                onPressed: () {
                  final sim = ClampedSimulation(
                    GravitySimulation(10.0, 0.0, double.infinity, 0.0),
                    xMin: 0.0,
                    xMax: 300.0,
                  );
                  _controller.animateWith(sim);
                },
              ),
              const SizedBox(height: 20),
              ActionChip(label: const Text("Start Spring Motion"), onPressed: _startSpringMotion),
              const SizedBox(height: 20),
              ActionChip(
                label: const Text("Animacao Icones"),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AnimatedIconWidget()),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              return Center(
                child: Transform.translate(
                  offset: Offset(0, _controller.value),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: const Icon(Icons.flutter_dash),
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Define spring physics
    final spring = SpringDescription.withDurationAndBounce(duration: const Duration(seconds: 1), bounce: 0.5);

    // Create simulation: from 0px to 300px, starting with no velocity
    final sim = SpringSimulation(spring, 0, 300, 0);

    _controller = AnimationController.unbounded(vsync: this)..animateWith(sim);
  }

  void _startFall() {
    _controller.animateWith(
      GravitySimulation(
        10.0, // acceleration, pixels per second per second
        0.0, // starting position, pixels
        300.0, // ending position, pixels
        0.0, // starting velocity, pixels per second
      ),
    );
  }

  void _startSpringMotion() {
    _controller.animateWith(
      SpringSimulation(
        const SpringDescription(mass: 1.0, stiffness: 300.0, damping: 15.0),
        0.0, // starting position
        1.0, // ending position
        0.0, // starting velocity
      ),
    );
  }
}
