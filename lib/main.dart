import 'package:flutter/material.dart';
import 'routes.dart';

// CORE PAGES
import 'screens/home/homepage.dart';
import 'screens/insurance/insurance_guide.dart';
import 'screens/ai/ai_detailpage.dart';
import 'screens/ai/chat_page.dart';

// INSURANCE DETAIL PAGES
import 'screens/insurance/life_insurance_page.dart';
import 'screens/insurance/health_insurance_page.dart';
import 'screens/insurance/vehicle_insurance_page.dart';
import 'screens/insurance/crop_insurance_page.dart';
import 'screens/insurance/property_insurance_page.dart';

// QUIZ PAGES
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

      /// ROUTES WITHOUT ARGUMENTS
      routes: {
        // CORE
        Routes.home: (context) => const HomePage(),
        Routes.insuranceGuide: (context) => const InsuranceGuidePage(),
        Routes.aiDetail: (context) => const AIDetailPage(),
        Routes.chat: (context) => ChatPage(),

        // INSURANCE
        Routes.lifeInsurance: (context) => const LifeInsurancePage(),
        Routes.healthInsurance: (context) => const HealthInsurancePage(),
        Routes.vehicleInsurance: (context) => const VehicleInsurancePage(),
        Routes.cropInsurance: (context) => const CropInsurancePage(),
        Routes.propertyInsurance: (context) => const PropertyInsurancePage(),

        // QUIZ
        Routes.quizIntro: (context) => const QuizIntroPage(),
        Routes.quiz: (context) => const QuizPage(),
      },

      /// ROUTES WITH ARGUMENTS
      onGenerateRoute: (settings) {
        if (settings.name == Routes.quizResult) {
          final result = settings.arguments as String;

          return MaterialPageRoute(
            builder: (_) => QuizResultPage(result: result),
          );
        }
        return null;
      },
    );
  }
}
