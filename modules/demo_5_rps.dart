import 'dart:math';
import 'package:flutter/material.dart';
import '../../widgets/neumorphic_button.dart';

class Demo5RPS extends StatefulWidget {
  const Demo5RPS({super.key});

  @override
  State<Demo5RPS> createState() => _Demo5RPSState();
}

class _Demo5RPSState extends State<Demo5RPS> {
  int _playerScore = 0;
  int _cpuScore = 0;
  String _result = 'Elige una opción para comenzar';
  
  void _play(int playerChoice) {
    final cpuChoice = Random().nextInt(3); // 0: Rock, 1: Paper, 2: Scissors
    String tempResult;

    if (playerChoice == cpuChoice) {
      tempResult = 'Empate!';
    } else if ((playerChoice == 0 && cpuChoice == 2) ||
               (playerChoice == 1 && cpuChoice == 0) ||
               (playerChoice == 2 && cpuChoice == 1)) {
      tempResult = 'Ganaste!';
      _playerScore++;
    } else {
      tempResult = 'Perdiste!';
      _cpuScore++;
    }
    setState(() => _result = tempResult);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 5: Piedra, Papel o Tijera', style: theme.textTheme.titleLarge),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: theme.iconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Jugador: $_playerScore', style: theme.textTheme.titleLarge),
                Text('CPU: $_cpuScore', style: theme.textTheme.titleLarge),
              ],
            ),
            Text(_result, style: theme.textTheme.titleLarge?.copyWith(fontSize: 24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NeumorphicButton(onTap: () => _play(0), child: const Padding(padding: EdgeInsets.all(20), child: Text('✊'))),
                NeumorphicButton(onTap: () => _play(1), child: const Padding(padding: EdgeInsets.all(20), child: Text('🖐️'))),
                NeumorphicButton(onTap: () => _play(2), child: const Padding(padding: EdgeInsets.all(20), child: Text('✌️'))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
