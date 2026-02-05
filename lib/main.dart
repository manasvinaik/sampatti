import 'package:flutter/material.dart';
import 'routes.dart';

// pages
import 'screens/home/homepage.dart';
import 'screens/insurance/insurance_guide.dart';
import 'screens/ai/ai_detailpage.dart';
import 'screens/ai/chat_page.dart';

// quiz pages
import 'quiz/quiz_intro.dart';
import 'quiz/quiz_page.dart';
import 'quiz/quiz_result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sampatti',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => const HomePage(),
        Routes.insuranceGuide: (context) => const InsuranceGuidePage(),
        Routes.aiDetail: (context) => const AIDetailPage(),
        Routes.chat: (context) => ChatPage(), // ❌ not const if stateful

        // QUIZ
        Routes.quizIntro: (context) => const QuizIntroPage(),
        Routes.quiz: (context) => const QuizPage(),
        Routes.quizResult: (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as int;
          return QuizResultPage(score: args);
        },
      },
    );
  }
}
