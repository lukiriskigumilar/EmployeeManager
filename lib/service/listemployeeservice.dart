import 'dart:convert';


import 'package:employemanager/models/listemployee.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const String baseUrl = 'https://reqres.in/api';
  static Future<List<Datum>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users'));
      final body = response.body;
      final result = jsonDecode(body);
      List<Datum> users = List<Datum>.from(
        result['data'].map(
          (user) => Datum.fromJson(user),
        ),
      );
      return users;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}