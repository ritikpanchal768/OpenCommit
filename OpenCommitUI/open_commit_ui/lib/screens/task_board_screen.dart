import 'package:flutter/material.dart';
import '../models/project/Project.dart';
import '../models/task.dart';
import '../services/api_service.dart';
import '../widgets/column_section.dart';

class TaskBoardScreen extends StatefulWidget {
  final Project project;

  const TaskBoardScreen({super.key, required this.project});

  @override
  State<TaskBoardScreen> createState() => _TaskBoardScreenState();
}

class _TaskBoardScreenState extends State<TaskBoardScreen> {
  late Future<List<Task>> _tasksFuture;

  @override
  void initState() {
    super.initState();
    _tasksFuture = ApiService.fetchTasks(widget.project.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.project.title)),
      body: FutureBuilder<List<Task>>(
        future: _tasksFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final tasks = snapshot.data!;
          final statuses = ['To Do', 'In Progress', 'Under Review', 'Completed'];

          return Row(
            children: statuses.map((status) {
              final filtered = tasks.where((t) => t.status == status).toList();
              return Expanded(
                child: ColumnSection(title: status, tasks: filtered),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
