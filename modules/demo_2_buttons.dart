import 'package:flutter/material.dart';
import '../../widgets/neumorphic_button.dart';

class Demo2Buttons extends StatefulWidget {
  const Demo2Buttons({super.key});

  @override
  State<Demo2Buttons> createState() => _Demo2ButtonsState();
}

class _Demo2ButtonsState extends State<Demo2Buttons> {
  final List<String> _messages = [];

  void _addOne() {
    if (_messages.length >= 10) return;
    setState(() => _messages.add('Hola Mundo #${_messages.length + 1}'));
  }

  void _addTen() {
    if (_messages.length >= 10) return;
    setState(() {
      for (int i = 0; i < 10 && _messages.length < 10; i++) {
        _messages.add('Hola Mundo #${_messages.length + 1}');
      }
    });
  }

  void _clear() => setState(() => _messages.clear());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 2: Botones', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_messages[index]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NeumorphicButton(onTap: _addOne, child: const Padding(padding: EdgeInsets.all(16), child: Text('Agregar 1'))),
                NeumorphicButton(onTap: _addTen, child: const Padding(padding: EdgeInsets.all(16), child: Text('Agregar 10'))),
                NeumorphicButton(onTap: _clear, child: const Padding(padding: EdgeInsets.all(16), child: Icon(Icons.clear))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}