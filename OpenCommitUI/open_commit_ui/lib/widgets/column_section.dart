// lib/widgets/column_section.dart
import 'package:flutter/material.dart';
import '../models/task/task.dart';
import 'task_card.dart';

class ColumnSection extends StatelessWidget {
  final String title;
  final List<Task> tasks;

  const ColumnSection({
    Key? key,
    required this.title,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...tasks.map((task) => TaskCard(task: task)).toList(),
        ],
      ),
    );
  }
}
