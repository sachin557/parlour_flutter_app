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

    // 🌈 Gradient for option boxes
    const LinearGradient optionGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF7FC8F8),
        Color(0xFFF77EB9),
        Color(0xFFFED7A5),
      ],
    );

    // 🌈 Gemini-style gradient for AI Search
    const LinearGradient geminiGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4285F4),
        Color(0xFF9B72CB),
        Color(0xFFD96570),
      ],
    );

    return Scaffold(
      // ================= HEADER =================
      appBar: AppBar(
        toolbarHeight: 90,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,

        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            child: Container(
              // 🔹 OUTER = GRADIENT BORDER
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF7FC8F8),
                    Color(0xFFF77EB9),
                    Color(0xFFFED7A5),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              padding: const EdgeInsets.all(2), // border thickness

              child: Container(
                // 🔹 INNER = HEADER BODY
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    // LEFT ICON
                    IconButton(
                      tooltip: "Referral Bonus",
                      icon: const Icon(Icons.monetization_on),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Bonus()),
                        );
                      },
                    ),

                    const Spacer(),

                    // CENTER LOGO + TEXT
                    Row(
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          width: 34,
                          height: 34,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "NoorCall",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // RIGHT ICON
                    IconButton(
                      tooltip: "Guide",
                      icon: const Icon(Icons.menu_book_outlined),
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

      // ================= BODY =================
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

      // ================= GEMINI AI SEARCH =================
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

  // ================= OPTION ROW =================
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

  // ================= OPTION BOX =================
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
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
}
