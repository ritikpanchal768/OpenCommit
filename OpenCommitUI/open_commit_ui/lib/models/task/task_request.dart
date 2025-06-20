class TaskRequest {
  final String title;
  final String description;
  final String status;
  final double reward;
  final DateTime? deadline;
  final String projectId;
  final String username;

  TaskRequest({
    required this.title,
    required this.description,
    required this.status,
    required this.reward,
    this.deadline,
    required this.projectId,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'status': status,
      'reward': reward,
      'deadline': deadline?.toIso8601String(),
      'projectId': projectId, // <-- Capital "I"
      'username': username,
    };
  }

}
