import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_commit_ui/models/common/api_logs.dart';
import 'package:open_commit_ui/models/common/common_response.dart';
import 'package:open_commit_ui/models/project/ProjectRequest.dart';
import 'package:open_commit_ui/models/task/task_request.dart';
import '../models/project/Project.dart';
import '../models/task/task.dart';

class ApiService {
  static const String baseUrl =
      'http://192.168.1.193:9001/opencommit'; // adjust as needed
  
  static const String authorization = "Basic cm9vdDpyaXRpazc2OA==";
  static const headers = {
    'Content-Type': 'application/json',
    'Authorization': authorization
  };

  static Future<List<Project>> fetchProjects() async {
    final url = Uri.parse('$baseUrl/api/v1/projects/view/all/ritik');
    final response =
        await http.get(url, headers: headers);
    // Print the request and response for debugging);
    printRequestResponse(
      method: "GET",
      url: url.toString(),
      headers: headers,
      requestBody: ({}),
      response : response
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);

      final List<dynamic> data = jsonMap['responseObject'];
      return data.map((e) => Project.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load projects");
    }
  }

  static Future<List<Task>> fetchTasks(String projectId) async {
    final url = Uri.parse('$baseUrl/api/v1/taskManagement/view/$projectId');
    final response = await http.get(url);
    printRequestResponse(
      method: "GET",
      url: url.toString(),
      headers: headers,
      requestBody: ({}),
      response : response
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);

      final List<dynamic> data = jsonMap['responseObject'];
      return data.map((e) => Task.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load projects");
    }
  }

  static Future<CommonResponse<Project>> createProject(
      ProjectRequest request) async {
    final url = Uri.parse('$baseUrl/api/v1/projects/create/project');
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(request.toJson()),
    );
    printRequestResponse(
      method: "GET",
      url: url.toString(),
      headers: headers,
      requestBody: request.toJson(),
      response : response
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return CommonResponse.fromJson(json, (data) => Project.fromJson(data));
    } else {
      throw Exception("Failed to create project");
    }
  }


  static Future<CommonResponse<Task>> createTask(TaskRequest taskRequest) async {
    final url = Uri.parse('$baseUrl/api/v1/taskManagement/create/task');
    
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(taskRequest.toJson()),
    );
    printRequestResponse(
        method: "POST",
        url: url.toString(),
        headers: headers,
        requestBody: taskRequest.toJson(),
        response : response
      );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return CommonResponse.fromJson(json, (data) => Task.fromJson(data));
    } else {
      throw Exception("Failed to create task");
    }
  }


}
