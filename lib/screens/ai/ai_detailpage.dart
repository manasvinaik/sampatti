import 'package:flutter/material.dart';

const Color appBlue = Color(0xFF5479F7);
const Color headingColor = Color.fromRGBO(0, 0, 0, 0.85);
const Color bodyColor = Color.fromRGBO(0, 0, 0, 0.7);

class AIDetailPage extends StatelessWidget {
  const AIDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const NavBar(),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Why use our AI",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman',
                      color: headingColor,
                    ),
                  ),
                  const SizedBox(height: 60),

                  /// ===== AI REASONS GRID =====
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isDesktop = constraints.maxWidth > 900;

                      return Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 900),
                          child: Wrap(
                            spacing: 32,
                            runSpacing: 32,
                            alignment: WrapAlignment.center,
                            children: [
                              AIReasonCard(
                                width: isDesktop ? 420 : double.infinity,
                                icon: Icons.school,
                                text:
                                    "Is a teacher and a friend at the same time",
                              ),
                              AIReasonCard(
                                width: isDesktop ? 420 : double.infinity,
                                icon: Icons.menu_book,
                                text:
                                    "Extensive knowledge of insurance policies",
                              ),
                              AIReasonCard(
                                width: isDesktop ? 420 : double.infinity,
                                icon: Icons.language,
                                text: "Responds in your language",
                              ),
                              AIReasonCard(
                                width: isDesktop ? 420 : double.infinity,
                                icon: Icons.track_changes,
                                text:
                                    "Supports your goals & ambitions",
                              ),
                              AIReasonCard(
                                width: isDesktop ? 420 : double.infinity,
                                icon: Icons.recommend,
                                text:
                                    "Recommends the best services",
                              ),
                              AIChatCTA(
                                width: isDesktop ? 420 : double.infinity,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 80),

                  /// ===== HEADING =====
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman',
                          color: headingColor,
                        ),
                        children: [
                          TextSpan(text: "Key features that will help you "),
                          TextSpan(
                            text: "choose and decide",
                            style: TextStyle(
                              color: appBlue,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(text: " :"),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: const Text(
                        "Whether you’re a local agent, investor looking for a service, or policy, "
                        "We will help you in every way possible",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.6,
                          fontFamily: 'Times New Roman',
                          color: bodyColor,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  /// ===== FEATURE BOXES =====
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1100),
                      child: Column(
                        children: [
                          Wrap(
                            spacing: 24,
                            runSpacing: 24,
                            alignment: WrapAlignment.center,
                            children: const [
                              FeatureBox(
                                bgColor: appBlue,
                                textColor: Colors.white,
                                title: "Voice-First Guidance in Local Dialects",
                                body:
                                    "The AI agent speaks and listens in the user’s own language and dialect, making insurance feel familiar and human. It can explain concepts through stories, examples, and simple everyday language so even first-time users understand everything clearly.",
                              ),
                              FeatureBox(
                                bgColor: Color(0xFFE2EAFF),
                                textColor: Colors.black,
                                title: "Smart Needs Discovery Through Conversational Questions",
                                body:
                                    "Instead of long forms, the AI asks a short, friendly voice conversation about family size, work type, and risks. It then understands the user’s situation and maps it to the right insurance categories automatically.",
                              ),
                              FeatureBox(
                                bgColor: Color(0xFFCADDFF),
                                textColor: Colors.black,
                                title: "Explainable Recommendations",
                                body:
                                    "The agent doesn’t just give an insurance plan—it also explains why it fits the user. For example: “This protects your farm income and covers hospital costs. Good for your work and family.” This builds trust and transparency.",
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Wrap(
                            spacing: 24,
                            alignment: WrapAlignment.center,
                            children: const [
                              FeatureBox(
                                bgColor: Color(0xFFCADDFF),
                                textColor: Colors.black,
                                title: "Assisted Purchase With Voice-Led Step-By-Step Help",
                                body:
                                    "The AI walks users through ID verification, payment options, and policy confirmation using simple voice instructions. It automatically fills forms from speech, reducing errors and making the process friendly even for low-literacy users..",
                              ),
                              FeatureBox(
                                bgColor: appBlue,
                                textColor: Colors.white,
                                title: "Easy Claims Support With Photo/Voice Intake",
                                body:
                                    "During emergencies, the agent helps users file claims just by sending a voice note or a photo. It guides them on what to submit and allows a “village witness” option, making claims faster & less confusing in times of need",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black)),
      ),
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
                  _NavItem("AI Assistant"),
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
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "SAMPATTI",
            style: TextStyle(
              fontSize: 22,
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

/* ===================== FEATURE BOX ===================== */

class FeatureBox extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String title;
  final String body;

  const FeatureBox({
    super.key,
    required this.bgColor,
    required this.textColor,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360, // 👈 wider
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 👈 key line
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Times New Roman',
              color: textColor,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            height: 1,
            color: textColor.withOpacity(0.6),
          ),

          const SizedBox(height: 14),

          Text(
            body,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              height: 1.6, // 👈 improved readability
              fontFamily: 'Times New Roman',
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}


/* ===================== EXISTING CARDS ===================== */

class AIReasonCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final double width;

  const AIReasonCard({
    super.key,
    required this.icon,
    required this.text,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      decoration: BoxDecoration(
        border: Border.all(color: appBlue, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
              color: appBlue,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Times New Roman',
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AIChatCTA extends StatelessWidget {
  final double width;
  const AIChatCTA({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/chat'),
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 28),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            "Talk to our AI Assistant",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
