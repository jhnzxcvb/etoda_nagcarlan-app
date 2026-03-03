import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // 10.0.2.2 is the special IP for Android Emulator to see your computer's localhost
  static const String baseUrl = "http://10.0.2.2:8080";

  Future<Map<String, dynamic>> fetchDriverData() async {
    final response = await http.get(Uri.parse("$baseUrl/driver"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to connect to Go Backend");
    }
  }
}