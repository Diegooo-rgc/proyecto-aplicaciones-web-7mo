import 'package:flutter/material.dart';

class Demo1Greetings extends StatelessWidget {
  const Demo1Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 1: Saludos x10', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          leading: Text('${index + 1}'),
          title: const Text('Hola Mundo'),
        ),
      ),
    );
  }
}
