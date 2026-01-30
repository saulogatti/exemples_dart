import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SecondScreen()));
          },
          child: Hero(tag: 'hero-tag', child: Image.asset('assets/corte.png', width: 100)),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: FirstScreen());
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: Hero(tag: 'hero-tag', child: Image.asset('assets/corte.png', width: 300)),
      ),
    );
  }
}
