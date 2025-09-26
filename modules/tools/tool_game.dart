import 'dart:math';
import 'package:flutter/material.dart';
import '../../widgets/neumorphic_button.dart';

class ToolGame extends StatefulWidget {
  const ToolGame({super.key});

  @override
  State<ToolGame> createState() => _ToolGameState();
}

class _ToolGameState extends State<ToolGame> {
  int _playerScore = 0;
  int _cpuScore = 0;
  Set<String> _playerChoice = {'par'};
  int? _playerNumber;

  void _play() {
    if (_playerNumber == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor, elige un número.')));
      return;
    }

    final cpuNumber = Random().nextInt(6);
    final total = _playerNumber! + cpuNumber;
    final isTotalEven = total % 2 == 0;
    
    String result;
    if ((isTotalEven && _playerChoice.contains('par')) || (!isTotalEven && _playerChoice.contains('impar'))) {
      result = 'Ganaste! La suma fue $total.';
      _playerScore++;
    } else {
      result = 'Perdiste! La suma fue $total.';
      _cpuScore++;
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
    setState(() {
      _playerNumber = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Herramienta: Par o Impar', style: theme.textTheme.titleLarge),
        backgroundColor: theme.scaffoldBackgroundColor, elevation: 0, iconTheme: theme.iconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Jugador: $_playerScore  |  CPU: $_cpuScore', textAlign: TextAlign.center, style: theme.textTheme.titleLarge),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'par', label: Text('Par')),
                ButtonSegment(value: 'impar', label: Text('Impar')),
              ],
              selected: _playerChoice,
              onSelectionChanged: (newSelection) => setState(() => _playerChoice = newSelection),
            ),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(6, (index) {
                return NeumorphicButton(
                  onTap: () => setState(() => _playerNumber = index),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: _playerNumber == index ? Colors.teal : Colors.transparent,
                      child: Text('$index', style: TextStyle(color: _playerNumber == index ? Colors.white : theme.textTheme.bodyMedium?.color)),
                    ),
                  ),
                );
              }),
            ),
            NeumorphicButton(
              onTap: _play,
              child: const Padding(padding: EdgeInsets.all(16), child: Center(child: Text('JUGAR'))),
            ),
          ],
        ),
      ),
    );
  }
}