import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(Xylophone());
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      changeDiceNumber();
                    });
                  },
                  child: Image.asset('images/die_face_$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      changeDiceNumber();
                    });
                  },
                  child: Image.asset('images/die_face_$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeDiceNumber() {
    rightDiceNumber = Random().nextInt(6) + 1;
    leftDiceNumber = Random().nextInt(6) + 1;
  }
}

class Magic8 extends StatefulWidget {
  @override
  _Magic8State createState() => _Magic8State();
}

class _Magic8State extends State<Magic8> {
  int picture = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Magic8'),
          centerTitle: true,
        ),
        body: Center(
          child: FlatButton(
            child: Image.asset('images/ball$picture.png'),
            onPressed: () {
              setState(() {
                randomPicture();
                print(picture);
              });
            },
          ),
        ),
      ),
    );
  }

  void randomPicture() {
    picture = Random().nextInt(5) + 1;
  }
}

// ignore: must_be_immutable
class Xylophone extends StatelessWidget {
  int noteNumber;

  void changeNote({int note}) {
    final audioPlayer = AudioCache();
    audioPlayer.play('note$note.wav');
  }

  Expanded changeSound({int note, Color color}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          changeNote(note: note);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              changeSound(note: 1, color: Colors.red),
              changeSound(note: 2, color: Colors.orange),
              changeSound(note: 3, color: Colors.yellow),
              changeSound(note: 4, color: Colors.green),
              changeSound(note: 5, color: Colors.blue),
              changeSound(note: 6, color: Colors.indigo),
              changeSound(note: 7, color: Colors.teal),
            ],
          ),
        ),
      ),
    );
  }
}
