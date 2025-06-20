// lib/widgets/task_card.dart
import 'package:flutter/material.dart';
import '../models/task/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
          Text(
              "₹${task.reward.toStringAsFixed(0)}"
              " | Due: ${task.deadline != null ? task.deadline!.toLocal().toString().split(' ')[0] : 'No deadline'}",
            ),

            const SizedBox(height: 8),
            Text(task.description, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // TODO: Open commit submission modal/form
              },
              child: const Text("Submit Commit"),
            )
          ],
        ),
      ),
    );
  }
}
