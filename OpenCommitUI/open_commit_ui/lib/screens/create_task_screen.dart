import 'package:flutter/material.dart';
import 'package:open_commit_ui/models/task/task_request.dart';
import '../services/api_service.dart';
import 'package:intl/intl.dart';

class CreateTaskScreen extends StatefulWidget {
  final String projectId;

  const CreateTaskScreen({super.key, required this.projectId});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _rewardController = TextEditingController();
  DateTime? _selectedDeadline;
  String _selectedStatus = 'To Do';

  final List<String> _statusOptions = [
    'To Do',
    'In Progress',
    'Under Review',
    'Completed'
  ];

  void _submitTask() async {
    if (_formKey.currentState!.validate()) {
      final request = TaskRequest(
        title: _titleController.text,
        description: _descriptionController.text,
        status: _selectedStatus,
        reward: double.tryParse(_rewardController.text) ?? 0.0,
        deadline: _selectedDeadline,
        projectId: widget.projectId,
        username: "ritik", // hardcoded, you can fetch from login/user context
      );

      final response = await ApiService.createTask(request);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.responseMessage)),
      );

      if (response.isValid) {
        Navigator.pop(context, true); // return success
      }
    }
  }

  Future<void> _pickDeadline() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDeadline = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create New Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Task Title"),
                validator: (value) => value == null || value.isEmpty ? "Required" : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
                maxLines: 3,
              ),
              TextFormField(
                controller: _rewardController,
                decoration: const InputDecoration(labelText: "Reward Amount (₹)"),
                keyboardType: TextInputType.number,
              ),
              DropdownButtonFormField<String>(
                value: _selectedStatus,
                items: _statusOptions.map((status) {
                  return DropdownMenuItem(value: status, child: Text(status));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value!;
                  });
                },
                decoration: const InputDecoration(labelText: "Status"),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDeadline != null
                          ? "Deadline: ${DateFormat.yMMMd().format(_selectedDeadline!)}"
                          : "No deadline selected",
                    ),
                  ),
                  TextButton(
                    onPressed: _pickDeadline,
                    child: const Text("Pick Deadline"),
                  )
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitTask,
                child: const Text("Create Task"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
