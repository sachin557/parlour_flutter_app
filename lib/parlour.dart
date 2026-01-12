import 'package:flutter/material.dart';
import "Navigation.dart";
import "NearMe.dart";
import "aisearch.dart";
import "guid.dart";
import "Bonus.dart";
import "support.dart";
import "Men_women_category.dart";

class Parlour extends StatelessWidget {
  const Parlour({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // 
    const LinearGradient optionGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF7FC8F8),
        Color(0xFFF77EB9),
        Color(0xFFFED7A5),
      ],
    );

    // 
    const LinearGradient geminiGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4285F4),
        Color(0xFF9B72CB),
        Color(0xFFD96570),
      ],
    );

    //
    const LinearGradient neonHeaderBorder = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00E5FF),
        Color(0xFF7C4DFF),
        Color(0xFFFF4081),
      ],
    );

    return Scaffold(
      // 
      appBar: AppBar(
        toolbarHeight: 96,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: neonHeaderBorder,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(0.6),
                    blurRadius: 18,
                    spreadRadius: 1,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(2.5),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    // BONUS
                    IconButton(
                      tooltip: "Referral Bonus",
                      icon: Icon(Icons.monetization_on,
                          color: isDark ? Colors.white : Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Bonus()),
                        );
                      },
                    ),

                    _neonDivider(),

                    const Spacer(),

                    // LOGO + TITLE
                    Row(
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          width: 36,
                          height: 36,
                        ),
                        const SizedBox(width: 10),
                        _StylishHeaderText(isDark: isDark),
                      ],
                    ),

                    const Spacer(),

                    _neonDivider(),

                    // GUIDE
                    IconButton(
                      tooltip: "Guide",
                      icon: Icon(Icons.menu_book_outlined,
                          color: isDark ? Colors.white : Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Guid()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      // body
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 60),

            _optionRow(
              context,
              optionGradient,
              leftText: "Parlour Near Me",
              leftTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NearMe()),
              ),
              rightText: "Book An Appointment",
              rightTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NavigationCategoryPages(),
                ),
              ),
            ),

            const SizedBox(height: 12),

            _optionRow(
              context,
              optionGradient,
              leftText: "Category",
              leftTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MenWomenCtegory()),
              ),
              rightText: "Contact Support",
              rightTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Support()),
              ),
            ),
          ],
        ),
      ),

      // ai search
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AiSearchPage()),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            gradient: geminiGradient,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.35),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.auto_awesome, color: Colors.white),
              SizedBox(width: 8),
              Text(
                "AI Search",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // option box
  Widget _optionRow(
    BuildContext context,
    LinearGradient gradient, {
    required String leftText,
    required VoidCallback leftTap,
    required String rightText,
    required VoidCallback rightTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 10,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _optionBox(
                  text: leftText,
                  onTap: leftTap,
                  gradient: gradient,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _optionBox(
                  text: rightText,
                  onTap: rightTap,
                  gradient: gradient,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 
  Widget _optionBox({
    required String text,
    required VoidCallback onTap,
    required LinearGradient gradient,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: [
                Shadow(
                  offset: Offset(2, 2),
                  blurRadius: 6,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // neon
  Widget _neonDivider() {
    return Container(
      height: 28,
      width: 1.6,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF00E5FF),
            Color(0xFF7C4DFF),
            Color(0xFFFF4081),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.9),
            blurRadius: 10,
          ),
        ],
      ),
    );
  }
}

// header style
class _StylishHeaderText extends StatelessWidget {
  final bool isDark;
  const _StylishHeaderText({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Color(0xFF00E5FF),
          Color(0xFF69F0AE),
        ],
      ).createShader(bounds),
      child: Text(
        "NoorCall",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,
          color: Colors.white,
          shadows: [
            Shadow(
              color: Colors.cyanAccent.withOpacity(0.9),
              blurRadius: 14,
            ),
          ],
        ),
      ),
    );
  }
}
