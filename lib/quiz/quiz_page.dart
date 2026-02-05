import 'package:flutter/material.dart';
import '../services/quiz_api.dart';
import 'quiz_result.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int score = 0;
  String? selectedOption;
  List questions = [];

  @override
  void initState() {
    super.initState();
    loadQuiz();
  }

  void loadQuiz() async {
    questions = await QuizApi.fetchQuestions();
    setState(() {});
  }

  void nextQuestion() {
    if (selectedOption ==
        questions[currentIndex]['correct']) {
      score++;
    }

    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedOption = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => QuizResultPage(score: score),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final q = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text("Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              q['question'],
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ...(q['options'] as Map<String, dynamic>).entries.map<Widget>((entry) {

              return RadioListTile(
                title: Text(entry.value),
                value: entry.key,
                groupValue: selectedOption,
                onChanged: (val) {
                  setState(() {
                    selectedOption = val as String;
                  });
                },
              );
            }).toList(),
            const Spacer(),
            ElevatedButton(
              onPressed: selectedOption == null ? null : nextQuestion,
              child: const Text("Next"),
            )
          ],
        ),
      ),
    );
  }
}
