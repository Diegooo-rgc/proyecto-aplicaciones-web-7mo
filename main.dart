import 'package:flutter/material.dart';
// Se corrige la ruta de 'views' a 'view' para que coincida con tu estructura de carpetas.
import 'view/app_container.dart'; 

void main() {
  runApp(const NeumorphicPortfolioApp());
}

// Widget raíz de la aplicación
class NeumorphicPortfolioApp extends StatefulWidget {
  const NeumorphicPortfolioApp({super.key});

  @override
  State<NeumorphicPortfolioApp> createState() => _NeumorphicPortfolioAppState();

  static _NeumorphicPortfolioAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_NeumorphicPortfolioAppState>()!;
}

class _NeumorphicPortfolioAppState extends State<NeumorphicPortfolioApp> {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define los colores base para el tema claro y oscuro
    const lightThemeColor = Color(0xFFE0E5EC);
    const darkThemeColor = Color(0xFF2E3239);
    
    return MaterialApp(
      title: 'Neumorphic Portfolio',
      theme: ThemeData(
        scaffoldBackgroundColor: lightThemeColor,
        brightness: Brightness.light,
        primaryColor: lightThemeColor,
        iconTheme: IconThemeData(color: Colors.grey.shade800),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.grey.shade800),
          titleLarge: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold),
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: darkThemeColor,
        brightness: Brightness.dark,
        primaryColor: darkThemeColor,
        iconTheme: const IconThemeData(color: Colors.white70),
         textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const AppContainer(), // La pantalla de inicio es el contenedor de la app.
    );
  }
}
