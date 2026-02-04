import 'package:flutter/material.dart';

const Color appBlue = Color(0xFF5479F7);
const Color headingColor = Color.fromRGBO(0, 0, 0, 0.85);
const Color bodyColor = Color.fromRGBO(0, 0, 0, 0.7);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const NavBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  HeroSection(),
                  SizedBox(height: 40),
                  LanguagesSection(),
                  SizedBox(height: 60),
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
                  _NavItem("Home", "/"),
                  SizedBox(width: 24),
                  _NavItem("Insurance Guide", "/insurance-guide"),
                  SizedBox(width: 24),
                  _NavItem("AI Assistant", "/ai-detail"),
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
  final String route;

  const _NavItem(this.text, this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (ModalRoute.of(context)?.settings.name != route) {
          Navigator.pushNamed(context, route);
        }
      },
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

/* ===================== HERO SECTION ===================== */

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth > 800
            ? const DesktopHero()
            : const MobileHero();
      },
    );
  }
}

class DesktopHero extends StatelessWidget {
  const DesktopHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Row(
        children: const [
          Expanded(child: HeroText()),
          SizedBox(width: 40),
          Expanded(child: HeroImage()),
        ],
      ),
    );
  }
}

class MobileHero extends StatelessWidget {
  const MobileHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: const [
          HeroImage(),
          SizedBox(height: 40),
          HeroText(center: true),
        ],
      ),
    );
  }
}

/* ---------- HERO IMAGE ---------- */

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isDesktop ? 420 : 360,
          maxHeight: isDesktop ? 420 : 360,
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            'assets/images/img1.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

/* ---------- HERO TEXT ---------- */

class HeroText extends StatelessWidget {
  final bool center;
  const HeroText({super.key, this.center = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const Text(
          "Empowering rural India with clear, easy-to-understand insurance guidance. Learn, compare, and choose the best protection for your family — all in your own language.",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "/ / / / / /",
          style: TextStyle(
            fontSize: 18,
            color: appBlue,
            fontFamily: 'Times New Roman',
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "ग्रामीण भारत को आसान और समझने योग्य बीमा जानकारी के साथ सशक्त बनाना। अपनी भाषा में जानें, तुलना करें और अपने परिवार के लिए सबसे बेहतर सुरक्षा चुनें।",
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Times New Roman',
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/insurance-guide');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: appBlue,
            foregroundColor: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          ),
          child: const Text(
            "Start Learning",
            style: TextStyle(fontFamily: 'Times New Roman'),
          ),
        ),
      ],
    );
  }
}

/* ===================== LANGUAGES SECTION ===================== */

class LanguagesSection extends StatelessWidget {
  const LanguagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Languages we work with",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times New Roman',
                ),
              ),
              Wrap(
                spacing: 12,
                children: const [
                  LanguageButton("Hindi"),
                  LanguageButton("Tamil"),
                  LanguageButton("Marathi"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String text;
  const LanguageButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: appBlue,
          fontFamily: 'Times New Roman',
        ),
      ),
    );
  }
}
