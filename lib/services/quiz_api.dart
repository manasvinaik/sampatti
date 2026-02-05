import 'dart:convert';
import 'package:http/http.dart' as http;

class QuizApi {
  static const String baseUrl = 'http://127.0.0.1:8000/api/quiz/';

  static Future<List<dynamic>> fetchQuestions({String lang = 'en'}) async {
    final url = Uri.parse('$baseUrl?lang=$lang');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load quiz');
    }
  }
}
