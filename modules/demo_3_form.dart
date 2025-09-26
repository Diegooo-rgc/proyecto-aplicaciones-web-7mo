import 'package:flutter/material.dart';
import '../../services/data_service.dart';
import '../../models/user_profile.dart';
import '../../widgets/neumorphic_button.dart';

class Demo3Form extends StatefulWidget {
  const Demo3Form({super.key});

  @override
  State<Demo3Form> createState() => _Demo3FormState();
}

class _Demo3FormState extends State<Demo3Form> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      DataService.users.add(UserProfile(
        name: _nameController.text,
        lastName: _lastNameController.text,
        password: _passwordController.text,
      ));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario registrado con éxito!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 3: Formulario', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
              validator: (v) => v!.isEmpty ? 'Campo requerido' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Apellido'),
              validator: (v) => v!.isEmpty ? 'Campo requerido' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                ),
              ),
              validator: (v) => v!.length < 6 ? 'Mínimo 6 caracteres' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: !_isPasswordVisible,
              decoration: const InputDecoration(labelText: 'Confirmar Contraseña'),
              validator: (v) => v != _passwordController.text ? 'Las contraseñas no coinciden' : null,
            ),
            const SizedBox(height: 30),
            NeumorphicButton(
              onTap: _submitForm,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(child: Text('Registrar')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}