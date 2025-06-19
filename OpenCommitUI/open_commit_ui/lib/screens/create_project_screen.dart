// lib/screens/create_project_screen.dart
import 'package:flutter/material.dart';
import 'package:open_commit_ui/models/project/ProjectRequest.dart';
import '../models/project/Project.dart';
import '../services/api_service.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  
  void _submitProject() async {
    if (_formKey.currentState!.validate()) {
      final request = ProjectRequest(
        title: _titleController.text,
        description: _descriptionController.text,
        username: "ritik", 
      );

      final result = await ApiService.createProject(request);


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.responseMessage)),
      );

      if (result.isValid && result.responseObject != null) {
        Navigator.pop(context); // or refresh screen
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create New Project")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Project Title"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter title" : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitProject,
                child: const Text("Create"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
