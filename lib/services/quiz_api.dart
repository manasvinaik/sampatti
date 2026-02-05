import 'dart:convert';
import 'package:http/http.dart' as http;

class QuizApi {
  static Future<List> fetchQuestions() async {
    final res = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/quiz/'),
    );

    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {
      throw Exception("Failed to load quiz");
    }
  }
}
