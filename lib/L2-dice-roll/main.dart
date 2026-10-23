import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _diceNumber = 1;
  final _random = Random();
  final _player = AudioPlayer();

  static const Map<int, Set<int>> _dotPatterns = {
    1: {4},
    2: {0, 8},
    3: {0, 4, 8},
    4: {0, 2, 6, 8},
    5: {0, 2, 4, 6, 8},
    6: {0, 2, 3, 5, 6, 8},
  };

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _rollDice() {
    setState(() {
      _diceNumber = _random.nextInt(6) + 1;
    });
    _player.play(AssetSource('audio/dice_roll.mp3'));
  }

  Widget _buildDiceFace() {
    final activeDots = _dotPatterns[_diceNumber] ?? {};

    return Container(
      width: 120,
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: GridView.count(
        crossAxisCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(9, (index) {
          return Center(
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activeDots.contains(index)
                    ? Colors.black
                    : Colors.transparent,
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'ProductSans'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Lab 2 Project: Dice Roll')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDiceFace(),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _rollDice,
                child: const Text('Roll Dice'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

