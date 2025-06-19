// lib/models/project.dart
class Project {
  final String id;
  final String title;
  final String description;
  final String ownerId;
  final DateTime createdon;
  final DateTime? modifiedon;
  final String? createdby;
  final String? modifiedby;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.ownerId,
    required this.createdon,
    this.modifiedon,
    this.createdby,
    this.modifiedby,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      ownerId: json['ownerid'],
      createdon: DateTime.parse(json['createdOn']),
      modifiedon:
          json['modifiedOn'] != null ? DateTime.parse(json['modifiedOn']) : null,
      createdby: json['createdBy']?.toString(),
      modifiedby: json['modifiedBy']?.toString(),
    );

}
