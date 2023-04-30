import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const NumberGenerator());
class NumberGenerator extends StatefulWidget {
  const NumberGenerator({super.key});
  @override
 _NumberGeneratorState createState() => _NumberGeneratorState();
}

class _NumberGeneratorState extends State<NumberGenerator> {
 int _round = 0;
 int _score = 0;
 int _num1 = 0;
 int _num2 = 0;
 bool _displayScore = false;

 void _newRound() {
  setState(() {
      _num1 = Random().nextInt(100);
      _num2 = Random().nextInt(100);
      _round++;
      _displayScore = false;
    });
  }

 void _selectNumber(int number) {
    setState(() {
      if (_num1 > _num2 && number == 1) {
        _score++;
      } else if (_num2 > _num1 && number == 2) {
       _score++;
      } else {
      
      }
    if (_round == 10) {
         _displayScore = true;
     } else {
       _newRound();
        }
      });
  }

  void _reset() {
  setState(() {
    _round = 0;
    _score = 0;
      _newRound();
    });
  }
@override
  void initState() {
    super.initState();
    _newRound();
  }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Number Game',
     home: Scaffold(
       appBar: AppBar(
       title: const Text('Number Game'),
       ),
       body: Center(
         child: _displayScore
             ? Column(
               mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text(
                   'Final Score: $_score',
                     style: const TextStyle(fontSize: 24),
                     ),
                     const SizedBox(height: 20),
                     ElevatedButton(
                     onPressed: _reset,
                     child: const Text('Play Again'),
                    ),
                   ],
                   )
                   : Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text(
                     'Round $_round',
                     style: const TextStyle(fontSize: 24),
                   ),
                     const SizedBox(height: 20),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                      ElevatedButton(
                         onPressed: () => _selectNumber(1),
                     child: Text('$_num1'),
                      ),
                     ElevatedButton(
                      onPressed: () => _selectNumber(2),
                      child: Text('$_num2'),
                       ),
                       ],
                      ),
                      ],
                ),
        ),
      ),
    );
  }
}