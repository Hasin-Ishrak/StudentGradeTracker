import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/gradeprovider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Consumer<GradeProvider>(
      builder: (context, gradeProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Report Summary',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),

              _StatCard(
                icon: Icons.list_alt,
                label: 'Total Subjects',
                value: '${gradeProvider.totalSubjects}',
                colorScheme: colorScheme,
              ),
              const SizedBox(height: 16),

              _StatCard(
                icon: Icons.calculate_outlined,
                label: 'Average Mark',
                value: gradeProvider.averageMark.toStringAsFixed(1),
                colorScheme: colorScheme,
              ),
              const SizedBox(height: 16),

              _StatCard(
                icon: Icons.emoji_events_outlined,
                label: 'Overall Grade',
                value: gradeProvider.overallGrade,
                colorScheme: colorScheme,
              ),
              const SizedBox(height: 16),
              _StatCard(
                icon: Icons.check_circle_outline,
                label: 'Passing Subjects',
                value: '${gradeProvider.passingSubjects.length} / ${gradeProvider.totalSubjects}',
                colorScheme: colorScheme,
              ),
            ],
          ),
        );
      },
    );
  }
}
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final ColorScheme colorScheme;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: colorScheme.primary, size: 32),
        title: Text(
          label,
          style: TextStyle(color: colorScheme.onSurface.withOpacity(0.7)),
        ),
        trailing: Text(
          value,
          style: TextStyle(
            color: colorScheme.onSurface,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}