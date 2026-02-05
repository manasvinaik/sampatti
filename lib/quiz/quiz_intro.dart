import 'package:flutter/material.dart';
import 'quiz_page.dart';

class QuizIntroPage extends StatelessWidget {
  const QuizIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color appBlue = Color(0xFF5479F7);
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Insurance Readiness Quiz",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: appBlue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Answer a few questions to understand your insurance needs.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const QuizPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Start Quiz",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}