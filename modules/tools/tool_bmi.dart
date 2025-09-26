import 'package:flutter/material.dart';
import '../../widgets/neumorphic_button.dart';

class ToolBmi extends StatefulWidget {
  const ToolBmi({super.key});

  @override
  State<ToolBmi> createState() => _ToolBmiState();
}

class _ToolBmiState extends State<ToolBmi> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  void _calculateBmi() {
    if (_formKey.currentState!.validate()) {
      final height = double.parse(_heightController.text);
      final weight = double.parse(_weightController.text);
      final bmi = weight / (height * height);
      String category;
      if (bmi < 18.5) category = 'Bajo peso';
      else if (bmi < 25) category = 'Normal';
      else if (bmi < 30) category = 'Sobrepeso';
      else category = 'Obesidad';
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tu IMC es ${bmi.toStringAsFixed(2)} ($category)')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Herramienta: IMC', style: theme.textTheme.titleLarge),
        backgroundColor: theme.scaffoldBackgroundColor, elevation: 0, iconTheme: theme.iconTheme,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: _heightController,
              decoration: const InputDecoration(labelText: 'Altura (m)'),
              keyboardType: TextInputType.number,
              validator: (v) => v!.isEmpty || double.tryParse(v) == null || double.parse(v) <= 0
                  ? 'Ingresa un número positivo'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _weightController,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.number,
              validator: (v) => v!.isEmpty || double.tryParse(v) == null || double.parse(v) <= 0
                  ? 'Ingresa un número positivo'
                  : null,
            ),
            const SizedBox(height: 30),
            NeumorphicButton(
              onTap: _calculateBmi,
              child: const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Center(child: Text('Calcular'))),
            )
          ],
        ),
      ),
    );
  }
}
