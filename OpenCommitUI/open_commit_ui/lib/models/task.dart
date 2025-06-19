class Task {
  final String id;
  final String title;
  final String description;
  final String status;
  final double reward;
  final DateTime deadline;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.reward,
    required this.deadline,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        status: json['status'],
        reward: (json['reward'] as num).toDouble(),
        deadline: DateTime.parse(json['deadline']),
      );
}
