import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/gradeprovider.dart';
import '../models/subject.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Consumer<GradeProvider>(
      builder: (context, gradeProvider, child) {
        final subjects = gradeProvider.subjects;

        if (subjects.isEmpty) {
          return Center(
            child: Text(
              'No subjects added yet.\nGo to the "Add" tab to get started!',
              textAlign: TextAlign.center,
              style: TextStyle(color: colorScheme.onSurface, fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            final Subject subject = subjects[index];

            return Dismissible(
              key: ValueKey(subject),
              direction: DismissDirection.horizontal, 
              background: _buildSwipeBackground(colorScheme, Alignment.centerLeft),
              secondaryBackground: _buildSwipeBackground(colorScheme, Alignment.centerRight),
              onDismissed: (direction) {
              
                context.read<GradeProvider>().deleteSubject(subject);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Deleted "${subject.name}"')),
                );
              },
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _gradeColor(subject.grade, colorScheme),
                    foregroundColor: colorScheme.onPrimary,
                    child: Text(subject.grade),
                  ),
                  title: Text(
                    subject.name,
                    style: TextStyle(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Mark: ${subject.mark}',
                    style: TextStyle(color: colorScheme.onSurface.withOpacity(0.7)),
                  ),
                  trailing: Icon(Icons.swipe, color: colorScheme.outline),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSwipeBackground(ColorScheme colorScheme, Alignment alignment) {
    return Container(
      color: colorScheme.error,
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Icon(Icons.delete, color: colorScheme.onError),
    );
  }

  Color _gradeColor(String grade, ColorScheme colorScheme) {
    switch (grade) {
      case 'A':
        return colorScheme.primary;
      case 'B':
        return colorScheme.secondary;
      case 'C':
        return colorScheme.outline;
      default: // 'F'
        return colorScheme.error;
    }
  }
}