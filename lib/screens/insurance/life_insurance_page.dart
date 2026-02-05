import 'package:flutter/material.dart';
import '../../routes.dart';

const Color appBlue = Color(0xFF5479F7);
const Color headingColor = Color.fromRGBO(0, 0, 0, 0.85);
const Color bodyColor = Color.fromRGBO(0, 0, 0, 0.7);

class LifeInsurancePage extends StatelessWidget {
  const LifeInsurancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const NavBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    TopSection(),
                    SizedBox(height: 40),
                    FullWidthDivider(),
                    SizedBox(height: 40),
                    LearningSection(),
                    SizedBox(height: 40),
                    FullWidthDivider(),
                    SizedBox(height: 40),
                    ModulesSection(),
                    SizedBox(height: 80),
                    PlansSection(),
                    SizedBox(height: 100),
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

/* ===================== NAVBAR (SAME AS HOMEPAGE) ===================== */

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
                  _NavItem("Home", Routes.home),
                  SizedBox(width: 24),
                  _NavItem("Insurance Guide", Routes.insuranceGuide),
                  SizedBox(width: 24),
                  _NavItem("AI Assistant", Routes.aiDetail),
                ],
              ),
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
    return Builder(
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "SAMPATTI",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Times New Roman',
                color: headingColor,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}

/* ===================== DRAWER ===================== */

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _navigate(BuildContext context, String route) {
    Navigator.pop(context);
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                "SAMPATTI",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times New Roman',
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text("Home"),
            onTap: () => _navigate(context, Routes.home),
          ),
          ListTile(
            title: const Text("Insurance Guide"),
            onTap: () => _navigate(context, Routes.insuranceGuide),
          ),
          ListTile(
            title: const Text("AI Assistant"),
            onTap: () => _navigate(context, Routes.aiDetail),
          ),
        ],
      ),
    );
  }
}

/* ===================== TOP SECTION ===================== */

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Life Insurance / जीवन बीमा",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
            color: headingColor,
          ),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: const Text(
            "Life insurance is a financial protection plan that supports your family in case something unexpected happens to you. It ensures long-term security, helps meet future goals, and provides peace of mind.\n\n"
            "जीवन बीमा एक वित्तीय सुरक्षा योजना है जो किसी भी अनहोनी की स्थिति में आपके परिवार का सहारा बनती है। यह भविष्य की ज़रूरतों को सुरक्षित करती है और मानसिक शांति देती है।",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              height: 1.6,
              fontFamily: 'Times New Roman',
              color: bodyColor,
            ),
          ),
        ),
      ],
    );
  }
}


/* ===================== DIVIDER ===================== */

class FullWidthDivider extends StatelessWidget {
  const FullWidthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.black,
    );
  }
}

/* ===================== LEARNING SECTION ===================== */

class LearningSection extends StatelessWidget {
  const LearningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Start Learning",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
            color: headingColor,
          ),
        ),
        SizedBox(height: 12),
        Text(
          "There are 4 modules to watch",
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Times New Roman',
            color: bodyColor,
          ),
        ),
      ],
    );
  }
}

/* ===================== MODULES ===================== */

class ModulesSection extends StatelessWidget {
  const ModulesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 40,
      runSpacing: 40,
      alignment: WrapAlignment.center,
      children: const [
        ModuleCard(image: "img8.png", title: "Why Life Insurance Matters"),
        ModuleCard(image: "img9.png", title: "Types of Life Insurance"),
        ModuleCard(image: "img10.png", title: "Choosing the Right Plan"),
        ModuleCard(image: "img11.png", title: "Common Myths Explained"),
      ],
    );
  }
}

class ModuleCard extends StatelessWidget {
  final String image;
  final String title;

  const ModuleCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        border: Border.all(color: appBlue),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/$image',
            height: 160,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
/* ===================== PLANS SECTION ===================== */

class PlansSection extends StatelessWidget {
  const PlansSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Best Plans For You",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
            color: headingColor,
          ),
        ),
        const SizedBox(height: 32),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(
              appBlue.withOpacity(0.1),
            ),
            columns: const [
              DataColumn(
                label: Text(
                  "Sr No",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Product Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Product ID",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Action",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                  ),
                ),
              ),
            ],
            rows: [
              _planRow(1, "Sampatti Suraksha Plan", "LIF-1021", context),
              _planRow(2, "Jeevan Raksha Plus", "LIF-2045", context),
              _planRow(3, "Future Secure Life", "LIF-3390", context),
            ],
          ),
        ),
        const SizedBox(height: 32),

Container(
  width: double.infinity,
  height: 1,
  color: Colors.black,
),

const SizedBox(height: 24),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Text(
      "Find the best plan for you",
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'Times New Roman',
        color: bodyColor,
      ),
    ),
    const SizedBox(width: 24),
    ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.quizIntro);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: appBlue,
        foregroundColor: Colors.white,
        padding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
      child: const Text(
        "Take our survey",
        style: TextStyle(fontFamily: 'Times New Roman'),
      ),
    ),
  ],
),

      ],
    );
  }

  DataRow _planRow(
    int srNo,
    String name,
    String id,
    BuildContext context,
  ) {
    return DataRow(
      cells: [
        DataCell(Text(srNo.toString())),
        DataCell(Text(name)),
        DataCell(Text(id)),
        DataCell(
          ElevatedButton(
            onPressed: () {
              // later: navigate to product detail page
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: appBlue,
              foregroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            child: const Text(
              "View",
              style: TextStyle(fontFamily: 'Times New Roman'),
            ),
          ),
        ),
      ],
    );
  }
}
