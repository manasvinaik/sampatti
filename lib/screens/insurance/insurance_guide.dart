import 'package:flutter/material.dart';
import '../../routes.dart';


const Color appBlue = Color(0xFF5479F7);
const Color headingColor = Color.fromRGBO(0, 0, 0, 0.85);
const Color bodyColor = Color.fromRGBO(0, 0, 0, 0.7);

class InsuranceGuidePage extends StatelessWidget {
  const InsuranceGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const NavBar(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.language, color: appBlue, size: 18),
                  label: const Text(
                    "Switch Language",
                    style: TextStyle(
                      color: appBlue,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Column(
                  children: const [
                    InsuranceGuideHeading(),
                    SizedBox(height: 48),
                    InsuranceGuideContent(),
                    SizedBox(height: 80),
                    WhyInsuranceMattersSection(),
                    SizedBox(height: 100),
                    TypesOfInsuranceSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ===================== NAVBAR ===================== */

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth > 800
            ? const DesktopNavBar()
            : const MobileNavBar();
      },
    );
  }
}

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        children: [
          const Text(
            "SAMPATTI",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Times New Roman',
              color: headingColor,
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  _NavItem("Home"),
                  SizedBox(width: 24),
                  _NavItem("Insurance Guide"),
                  SizedBox(width: 24),
                  _NavItem("About"),
                  SizedBox(width: 24),
                  _NavItem("Virtual Assistant"),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: appBlue,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              "Login",
              style: TextStyle(fontFamily: 'Times New Roman'),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String text;
  const _NavItem(this.text);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Times New Roman',
          color: bodyColor,
        ),
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "SAMPATTI",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Times New Roman',
              color: headingColor,
            ),
          ),
          Icon(Icons.menu),
        ],
      ),
    );
  }
}

/* ===================== HEADING ===================== */

class InsuranceGuideHeading extends StatelessWidget {
  const InsuranceGuideHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
            color: headingColor,
          ),
          children: [
            TextSpan(text: "InsuranceGuide: "),
            TextSpan(text: "Learn "),
            TextSpan(text: ". "),
            TextSpan(
              text: "Invest ",
              style: TextStyle(color: appBlue),
            ),
            TextSpan(text: ". Grow"),
          ],
        ),
      ),
    );
  }
}

/* ===================== MAIN CONTENT ===================== */

class InsuranceGuideContent extends StatelessWidget {
  const InsuranceGuideContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return isDesktop
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              GuideImage(),
              SizedBox(width: 16),
              Expanded(child: GuideText()),
            ],
          )
        : Column(
            children: const [
              GuideImage(),
              SizedBox(height: 32),
              GuideText(),
            ],
          );
  }
}

class GuideImage extends StatelessWidget {
  const GuideImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 36), // 👈 shifts image toward text
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 500,
            maxHeight: 500,
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              'assets/images/img2.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}


class GuideText extends StatelessWidget {
  const GuideText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "What is Insurance? / बीमा क्या है?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Times New Roman',
                color: headingColor,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "When life takes an unexpected turn — a sudden illness, an accident, or a loss — insurance stands beside you. Insurance creates a safety net that protects families, livelihoods, and dreams.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                height: 1.6,
                fontFamily: 'Times New Roman',
                color: bodyColor,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "////////////////////////////////////////////////////////////",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
                color: appBlue,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "जब जीवन अचानक मोड़ लेता है — बीमारी, दुर्घटना या किसी नुकसान के रूप में — तब बीमा आपके साथ खड़ा रहता है। बीमा परिवारों, आजीविका और सपनों की सुरक्षा का एक जाल बुनता है।",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                height: 1.6,
                fontFamily: 'Times New Roman',
                color: bodyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ===================== WHY INSURANCE MATTERS ===================== */

class WhyInsuranceMattersSection extends StatelessWidget {
  const WhyInsuranceMattersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Times New Roman',
                color: headingColor,
              ),
              children: [
                TextSpan(text: "Why Insurance Matters "),
                TextSpan(text: "/", style: TextStyle(color: appBlue)),
                TextSpan(text: "बीमा क्यों ज़रूरी है"),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40),

        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1800),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
              decoration: BoxDecoration(
                border: Border.all(color: headingColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Wrap(
                spacing: 40,
                runSpacing: 48,
                alignment: WrapAlignment.center,
                children: const [
                  WhyItem(
                    image: "img3.png",
                    english: "Family Protection",
                    hindi: "परिवार की सुरक्षा",
                  ),
                  WhyItem(
                    image: "img4.png",
                    english: "Support in Emergencies",
                    hindi: "आपातकाल में सहारा",
                  ),
                  WhyItem(
                    image: "img5.png",
                    english: "Recovery After Loss",
                    hindi: "नुकसान के बाद पुनर्निर्माण",
                  ),
                  WhyItem(
                    image: "img6.png",
                    english: "Financial Stability",
                    hindi: "आर्थिक स्थिरता",
                  ),
                  WhyItem(
                    image: "img7.png",
                    english: "Safe Future Goals",
                    hindi: "सुरक्षित भविष्य के लक्ष्य",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WhyItem extends StatelessWidget {
  final String image;
  final String english;
  final String hindi;

  const WhyItem({
    super.key,
    required this.image,
    required this.english,
    required this.hindi,
  });

  @override
  Widget build(BuildContext context) {
    const double imageSize = 200;

    return SizedBox(
      width: imageSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$image',
            height: imageSize,
            width: imageSize,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 15,
                color: Colors.black,
              ),
              children: [
                TextSpan(text: english),
                const TextSpan(
                  text: "\n / \n",
                  style: TextStyle(color: appBlue),
                ),
                TextSpan(text: hindi),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TypesOfInsuranceSection extends StatelessWidget {
  const TypesOfInsuranceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Times New Roman',
              color: headingColor,
            ),
            children: [
              TextSpan(text: "Types of Insurance "),
              TextSpan(text: "/ ", style: TextStyle(color: appBlue)),
              TextSpan(text: "बीमा के प्रकार"),
            ],
          ),
        ),
        const SizedBox(height: 48),

        Wrap(
          spacing: 40,
          runSpacing: 40,
          alignment: WrapAlignment.center,
          children: [
            InsuranceTypeCard(
              icon: Icons.favorite,
              english: "Life Insurance",
              hindi: "जीवन बीमा",
              routeName: Routes.lifeInsurance,
            ),
            InsuranceTypeCard(
              icon: Icons.local_hospital,
              english: "Health Insurance",
              hindi: "स्वास्थ्य बीमा",
              routeName: Routes.healthInsurance,
            ),
            InsuranceTypeCard(
              icon: Icons.directions_car,
              english: "Vehicle Insurance",
              hindi: "वाहन बीमा",
              routeName: Routes.vehicleInsurance,
            ),
            InsuranceTypeCard(
              icon: Icons.agriculture,
              english: "Crop Insurance",
              hindi: "फसल बीमा",
              routeName: Routes.cropInsurance,
            ),
            InsuranceTypeCard(
              icon: Icons.home,
              english: "Property Insurance",
              hindi: "संपत्ति बीमा",
              routeName: Routes.propertyInsurance,
            ),
          ],
        ),
      ],
    );
  }
}

class InsuranceTypeCard extends StatelessWidget {
  final IconData icon;
  final String english;
  final String hindi;
  final String routeName;

  const InsuranceTypeCard({
    super.key,
    required this.icon,
    required this.english,
    required this.hindi,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        width: 260,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        decoration: BoxDecoration(
          border: Border.all(color: headingColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, size: 48, color: appBlue),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 18,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: english),
                  const TextSpan(
                    text: "\n / \n",
                    style: TextStyle(color: appBlue),
                  ),
                  TextSpan(text: hindi),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

