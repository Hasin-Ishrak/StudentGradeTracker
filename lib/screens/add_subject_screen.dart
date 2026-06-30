import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/grade_provider.dart';

class AddSubjectScreen extends StatelessWidget {
  AddSubjectScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _markController = TextEditingController();

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final mark = int.parse(_markController.text.trim());
      context.read<GradeProvider>().addSubject(name, mark);
      _nameController.clear();
      _markController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added "$name" successfully!'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Text(
              'Add a New Subject',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _nameController,
              style: TextStyle(color: colorScheme.onSurface),
              decoration: InputDecoration(
                labelText: 'Subject Name',
                labelStyle: TextStyle(color: colorScheme.onSurface),
                prefixIcon: Icon(Icons.book, color: colorScheme.primary),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Subject name cannot be empty';
                }
                return null; 
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _markController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: colorScheme.onSurface),
              decoration: InputDecoration(
                labelText: 'Mark (0-100)',
                labelStyle: TextStyle(color: colorScheme.onSurface),
                prefixIcon: Icon(Icons.grade, color: colorScheme.primary),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Mark cannot be empty';
                }
                final parsed = int.tryParse(value.trim());
                if (parsed == null) {
                  return 'Mark must be a whole number';
                }
                if (parsed < 0 || parsed > 100) {
                  return 'Mark must be between 0 and 100';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => _submit(context),
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Add Subject'),
            ),
          ],
        ),
      ),
    );
  } 
}