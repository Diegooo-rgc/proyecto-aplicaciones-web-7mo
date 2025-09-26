import 'package:flutter/material.dart';
import '../../widgets/neumorphic_button.dart';

class ToolNotes extends StatefulWidget {
  const ToolNotes({super.key});

  @override
  State<ToolNotes> createState() => _ToolNotesState();
}

class _ToolNotesState extends State<ToolNotes> {
  final List<String> _notes = [];
  final _controller = TextEditingController();

  void _addNote() {
    if (_controller.text.isNotEmpty) {
      setState(() => _notes.add(_controller.text));
      _controller.clear();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nota agregada')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Herramienta: Notas', style: theme.textTheme.titleLarge),
        backgroundColor: theme.scaffoldBackgroundColor, elevation: 0, iconTheme: theme.iconTheme,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              setState(() => _notes.clear());
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Todas las notas borradas')));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_notes[index]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Escribe una nota...'),
                  ),
                ),
                const SizedBox(width: 10),
                NeumorphicButton(
                  onTap: _addNote,
                  child: const Padding(padding: EdgeInsets.all(16), child: Icon(Icons.add)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}