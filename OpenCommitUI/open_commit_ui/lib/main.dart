// lib/main.dart
import 'package:flutter/material.dart';
import 'package:open_commit_ui/screens/home_screen.dart';

void main() {
  runApp(const OpenCommitApp());
}

class OpenCommitApp extends StatelessWidget {
  const OpenCommitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenCommit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
