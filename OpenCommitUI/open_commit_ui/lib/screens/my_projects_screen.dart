// lib/screens/my_projects_screen.dart
import 'package:flutter/material.dart';
import '../models/project/Project.dart';
import '../screens/task_board_screen.dart';
import '../services/api_service.dart';
import '../widgets/project_card.dart';

class MyProjectsScreen extends StatefulWidget {
  const MyProjectsScreen({super.key});

  @override
  State<MyProjectsScreen> createState() => _MyProjectsScreenState();
}

class _MyProjectsScreenState extends State<MyProjectsScreen> {
  late Future<List<Project>> _projectsFuture;

  @override
  void initState() {
    super.initState();
    _projectsFuture = ApiService.fetchProjects(); // TODO: Filter by user
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Projects")),
      body: FutureBuilder<List<Project>>(
        future: _projectsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final projects = snapshot.data!;
          if (projects.isEmpty) {
            return const Center(child: Text("You haven’t created any projects yet."));
          }

          return ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return ProjectCard(
                title: project.title,
                description: project.description,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TaskBoardScreen(project: project),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
