// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'explore_screen.dart';
import 'my_projects_screen.dart';
import 'create_project_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OpenCommit")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Create Project"),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const CreateProjectScreen())),
            ),
            ElevatedButton(
              child: const Text("My Projects"),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MyProjectsScreen())),
            ),
            ElevatedButton(
              child: const Text("Explore Projects"),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ExploreScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
