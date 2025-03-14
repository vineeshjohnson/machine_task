import 'dart:convert';

import 'package:user_app/features/user/data/models/user_model.dart';
import 'package:http/http.dart ' as http;

class UserRepository {
  final String baseurl = 'https://reqres.in/api/users?page=';
  Future<List<UserModel>> fetchUsers(int page) async {
    final response = await http.get(Uri.parse("$baseurl$page"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List users = data["data"];
      return users.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<bool> createUser(String name, String job) async {
    final response = await http.post(
      Uri.parse("https://reqres.in/api/users"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "job": job}),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
