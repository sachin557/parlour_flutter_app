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

    const LinearGradient optionGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF7FC8F8),
        Color(0xFFF77EB9),
        Color(0xFFFED7A5),
      ],
    );

    const LinearGradient geminiGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4285F4),
        Color(0xFF9B72CB),
        Color(0xFFD96570),
      ],
    );

    const LinearGradient headerBorder = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00E5FF),
        Color(0xFF7C4DFF),
        Color(0xFFFF4081),
      ],
    );

    return Scaffold(
      // ================= HEADER =================
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
                gradient: headerBorder,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(2.5),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    // ===== BONUS =====
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.monetization_on,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Bonus()),
                            );
                          },
                        ),
                        Text(
                          "Bonus",
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                isDark ? Colors.white70 : Colors.black87,
                          ),
                        ),
                      ],
                    ),

                    // 🔹 NEON SEPARATOR (RESTORED)
                    _neonDivider(),

                    const Spacer(),

                    // ===== LOGO + NAME =====
                    Row(
                      children: [
                        Image.asset('assets/logo.png', width: 36),
                        const SizedBox(width: 10),
                        const _AnimatedHeaderText(),
                      ],
                    ),

                    const Spacer(),

                    // 🔹 NEON SEPARATOR (RESTORED)
                    _neonDivider(),

                    // ===== GUIDE =====
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.menu_book_outlined,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Guid()),
                            );
                          },
                        ),
                        Text(
                          "Guide",
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                isDark ? Colors.white70 : Colors.black87,
                          ),
                        ),
                      ],
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
                MaterialPageRoute(
                    builder: (_) => const MenWomenCtegory()),
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

      // ================= AI SEARCH FAB =================
      floatingActionButton: _AnimatedAiSearchButton(
        gradient: geminiGradient,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AiSearchPage()),
          );
        },
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

  Widget _optionBox({
    required String text,
    required VoidCallback onTap,
    required LinearGradient gradient,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  // ================= NEON DIVIDER (RESTORED) =================
  Widget _neonDivider() {
    return Container(
      height: 32,
      width: 1.6,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF00E5FF),
            Color(0xFF7C4DFF),
            Color(0xFFFF4081),
          ],
        ),
      ),
    );
  }
}

// ================= NOORCALL ANIMATION =================
class _AnimatedHeaderText extends StatefulWidget {
  const _AnimatedHeaderText();

  @override
  State<_AnimatedHeaderText> createState() => _AnimatedHeaderTextState();
}

class _AnimatedHeaderTextState extends State<_AnimatedHeaderText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);

    _opacity = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            Color(0xFF00E5FF),
            Color(0xFF69F0AE),
          ],
        ).createShader(bounds),
        child: const Text(
          "NoorCall",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// ================= AI SEARCH ICON ANIMATION =================
class _AnimatedAiSearchButton extends StatefulWidget {
  final VoidCallback onTap;
  final LinearGradient gradient;

  const _AnimatedAiSearchButton({
    required this.onTap,
    required this.gradient,
  });

  @override
  State<_AnimatedAiSearchButton> createState() =>
      _AnimatedAiSearchButtonState();
}

class _AnimatedAiSearchButtonState extends State<_AnimatedAiSearchButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);

    _opacity = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          gradient: widget.gradient,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeTransition(
              opacity: _opacity,
              child: const Icon(
                Icons.auto_awesome,
                color: Color(0xFFFFD700), // GOLD
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "AI Search",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
