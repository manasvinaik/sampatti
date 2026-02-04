import 'package:flutter/material.dart';
import 'routes.dart';

// pages
import 'screens/home/homepage.dart';
import 'screens/insurance/insurance_guide.dart';
import 'screens/ai/ai_detailpage.dart';
import 'screens/ai/chat_page.dart';

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
        Routes.chat: (context) => const ChatPage(),
      },
    );
  }
}
