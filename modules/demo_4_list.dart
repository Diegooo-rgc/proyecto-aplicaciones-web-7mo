import 'package:flutter/material.dart';
import '../../services/data_service.dart';

class Demo4List extends StatelessWidget {
  const Demo4List({super.key});

  @override
  Widget build(BuildContext context) {
    final users = DataService.users;
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 4: Lista de Registros', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: users.isEmpty
          ? const Center(child: Text('No hay usuarios registrados.'))
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('${user.name} ${user.lastName}'),
                  subtitle: const Text('Usuario Registrado'),
                );
              },
            ),
    );
  }
}