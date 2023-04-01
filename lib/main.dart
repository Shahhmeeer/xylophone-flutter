import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget buildKey({required Color? color, required int keyNumber}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
        ),
        onPressed: () async {
          await player.setAsset('assets/note$keyNumber.wav');
          player.setVolume(0.5);
          player.play();
        },
        child: const Text(
          'Click Me',
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ),
    );
  }

  final player = AudioPlayer();
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(color: Colors.red[400], keyNumber: 1),
            buildKey(color: Colors.amber[300], keyNumber: 2),
            buildKey(color: Colors.blue[400], keyNumber: 3),
            buildKey(color: Colors.purple[400], keyNumber: 4),
            buildKey(color: Colors.blueGrey[300], keyNumber: 5),
            buildKey(color: Colors.greenAccent, keyNumber: 6),
            buildKey(color: Colors.yellow[300], keyNumber: 7),
          ],
        ),
      ),
    );
  }
}
