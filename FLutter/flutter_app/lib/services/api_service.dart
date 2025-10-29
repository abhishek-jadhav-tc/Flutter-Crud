import 'dart:convert';
import 'package:flutter_app/models/user_model.dart';
import 'package:http/http.dart' as http;


class ApiService {
  // static const String baseUrl = 'http://localhost:3000';
  static const String baseUrl = 'https://flutter-crud.apps.thecontrast.in';


  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }

  static Future<User> updateUser(User user) async {
  final response = await http.put(
    Uri.parse('$baseUrl/users/${user.id}'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(user.toJson()),
  );

  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update user');
  }
}



  static Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}
