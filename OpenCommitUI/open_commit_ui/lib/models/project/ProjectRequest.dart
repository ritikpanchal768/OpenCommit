// lib/models/project_request.dart
class ProjectRequest {
  final String title;
  final String description;
  final String username;

  ProjectRequest({
    required this.title,
    required this.description,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'username': username,
      };
}
