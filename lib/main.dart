import 'package:flutter/material.dart';
import 'dart:math';

var color = Colors.red;
void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade600,
          title: Text(
            'Dice Roller',
          ),
        ),
        body: Dice(),
        backgroundColor: color,
      ),
    ),
  );
}

class Dice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UI();
  }
}

class UI extends State<Dice> {
  int x = 1;
  int y = 6;
  int xScore = 0;
  int yScore = 0;

  @override
  Widget build(BuildContext ctx) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Score: $xScore',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Text(
                  'Score: $yScore',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  child: Image.asset('assets/images/dice${x}.png'),
                  onPressed: () {
                    changeDice('left');
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image.asset('assets/images/dice${y}.png'),
                  onPressed: () {
                    changeDice('right');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void changeDice(String score) {
    setState(() {
      Random m = Random();
      x = m.nextInt(6) + 1;
      y = m.nextInt(6) + 1;
      if (x == y) {
        if (score == 'left') {
          xScore++;
        } else {
          yScore++;
        }
      }
    });
  }
}
