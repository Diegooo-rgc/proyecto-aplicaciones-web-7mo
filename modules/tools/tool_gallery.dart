import 'package:flutter/material.dart';
import '../../widgets/neumorphic_button.dart';

class ToolGallery extends StatelessWidget {
  const ToolGallery({super.key});

  final List<String> _imagePaths = const [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Herramienta: Galería', style: theme.textTheme.titleLarge),
        backgroundColor: theme.scaffoldBackgroundColor, elevation: 0, iconTheme: theme.iconTheme,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _imagePaths.length,
        itemBuilder: (context, index) {
          final imagePath = _imagePaths[index];
          return NeumorphicButton(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Imagen ${index + 1}'),
                  content: Image.asset(imagePath, fit: BoxFit.cover),
                  actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cerrar'))],
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(imagePath, fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text('Error al cargar imagen'));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
