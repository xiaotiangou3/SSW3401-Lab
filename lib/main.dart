import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _step = 0;
  final _player = AudioPlayer();

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _onPressed() {
    _player.stop();
    _player.play(AssetSource('audio/orb.ogg'));
    setState(() => _step = (_step + 1) % _gradients.length);
  }

  static const _gradients = [
    [Colors.blue, Colors.purple],
    [Colors.orange, Colors.red],
    [Colors.green, Colors.teal],
    [Colors.pink, Colors.amber],
  ];

  static const _alignments = [
    (Alignment.topCenter, Alignment.bottomCenter),
    (Alignment.centerRight, Alignment.centerLeft),
    (Alignment.bottomCenter, Alignment.topCenter),
    (Alignment.centerLeft, Alignment.centerRight),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = _gradients[_step % _gradients.length];
    final (begin, end) = _alignments[_step % _alignments.length];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: begin,
              end: end,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hello world',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                TextButton(
                  onPressed: _onPressed,
                  child: const Text(
                    'Press me',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
