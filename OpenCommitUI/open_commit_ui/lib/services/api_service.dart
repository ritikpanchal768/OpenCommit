import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_commit_ui/models/common/common_response.dart';
import 'package:open_commit_ui/models/project/ProjectRequest.dart';
import '../models/project/Project.dart';
import '../models/task.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.1.193:9001/opencommit'; // adjust as needed

  static Future<List<Project>> fetchProjects() async {
    final response = await http.get(Uri.parse('$baseUrl/projects'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Project.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load projects");
    }
  }

  static Future<List<Task>> fetchTasks(String projectId) async {
    final response = await http.get(Uri.parse('$baseUrl/tasks/$projectId'));
   
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Task.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load tasks");
    }
  }
  static Future<CommonResponse<Project>> createProject(ProjectRequest request) async {
    final url = Uri.parse('$baseUrl/api/v1/projects/create/project');
    const String authorization = "Basic cm9vdDpyaXRpazc2OA==";
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': authorization
    };
    final response = await http.post(url,headers: headers,body: jsonEncode(request.toJson()),);
    print("Raw Response: ${json.decode(response.body)}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return CommonResponse.fromJson(json, (data) => Project.fromJson(data));
    } else {
      throw Exception("Failed to create project");
    }
  }
}
