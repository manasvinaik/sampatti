import 'package:flutter/material.dart';
import '../routes.dart';

class QuizResultPage extends StatelessWidget {
  final String result;
  const QuizResultPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final recommendations = {
      'life': 'Life Insurance',
      'health': 'Health Insurance',
      'vehicle': 'Vehicle Insurance',
      'crop': 'Crop Insurance',
      'property': 'Property Insurance',
    };

    // map quiz result → route
    final resultRoutes = {
      'life': Routes.lifeInsurance,
      'health': Routes.healthInsurance,
      'vehicle': Routes.vehicleInsurance,
      'crop': Routes.cropInsurance,
      'property': Routes.propertyInsurance,
    };

    // button label logic
    final buttonLabels = {
      'life': 'View Policies',
      'health': 'View Policies',
      'vehicle': 'View Policies',
      'crop': 'View Policies',
      'property': 'View Policies',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Result"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Based on your answers, we recommend:",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Times New Roman',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              Text(
                recommendations[result] ?? "",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times New Roman',
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  final route = resultRoutes[result];
                  if (route != null) {
                    Navigator.pushNamed(context, route);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: Text(
                  buttonLabels[result] ?? "Continue",
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Times New Roman',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
