import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../services/quiz_api.dart';
import '../../routes.dart';

const Color appBlue = Color(0xFF5479F7);

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  String? selectedOption;
  List questions = [];

  /// LANGUAGE
  String selectedLang = 'en';

  /// SURVEY SCORES (5 INSURANCE TYPES)
  final Map<String, int> scores = {
    'life': 0,
    'health': 0,
    'vehicle': 0,
    'crop': 0,
    'property': 0,
  };

  @override
  void initState() {
    super.initState();
    loadQuiz();
  }

  Future<void> loadQuiz() async {
    final data = await QuizApi.fetchQuestions(lang: selectedLang);
    setState(() {
      questions = data;
      currentIndex = 0;
      selectedOption = null;

      for (final key in scores.keys) {
        scores[key] = 0;
      }
    });
  }

  void nextQuestion() {
    final q = questions[currentIndex];
    final Map<String, dynamic> weights = q['weights'];

    final String? category = weights[selectedOption];

    if (category == null || !scores.containsKey(category)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Question data is incomplete. Please try again."),
        ),
      );
      return;
    }

    scores[category] = scores[category]! + 1;

    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedOption = null;
      });
    } else {
      final result = scores.entries.reduce(
        (a, b) => a.value >= b.value ? a : b,
      ).key;

      Navigator.pushReplacementNamed(
        context,
        Routes.quizResult,
        arguments: result,
      );
    }
  }

  void switchLanguage(String lang) {
    if (lang == selectedLang) return;

    setState(() {
      selectedLang = lang;
      questions = [];
    });

    loadQuiz();
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final q = questions[currentIndex];
    final Map<String, dynamic> options = q['options'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Insurance Quiz",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),

        /// 🌐 LANGUAGE SWITCH (Cupertino Icon)
        actions: [
  PopupMenuButton<String>(
    onSelected: switchLanguage,
    itemBuilder: (_) => const [
      PopupMenuItem(value: 'en', child: Text("English")),
      PopupMenuItem(value: 'hi', child: Text("हिंदी")),
      PopupMenuItem(value: 'ta', child: Text("தமிழ்")),
    ],
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: const [
          Icon(
            CupertinoIcons.globe,
            color: appBlue,
            size: 20,
          ),
          SizedBox(width: 6),
          Text(
            "Switch Quiz Language",
            style: TextStyle(
              color: appBlue,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  ),
],

      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// PROGRESS
            Text(
              "Question ${currentIndex + 1} of ${questions.length}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 12),

            /// QUESTION
            Text(
              q['question_text'],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 28),

            /// OPTIONS
            ...options.entries.map<Widget>((entry) {
              final isSelected = selectedOption == entry.key;

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? appBlue : Colors.black26,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: RadioListTile<String>(
                  value: entry.key,
                  groupValue: selectedOption,
                  activeColor: appBlue,
                  title: Text(
                    entry.value,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      selectedOption = val;
                    });
                  },
                ),
              );
            }).toList(),

            const Spacer(),

            /// NEXT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: appBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: selectedOption == null ? null : nextQuestion,
                child: Text(
                  currentIndex == questions.length - 1
                      ? "See Recommendation"
                      : "Next",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
