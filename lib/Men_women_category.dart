import 'package:flutter/material.dart';
import 'package:parlour_app/gender_type.dart';
import 'category.dart';

class MenWomenCtegory extends StatelessWidget {
  const MenWomenCtegory({super.key});

  @override
  Widget build(BuildContext context) {
    const LinearGradient optionGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF7FC8F8), // blue
        Color(0xFFF77EB9), // pink
        Color(0xFFFED7A5), // peach
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            color: Colors.transparent,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              height: 120,
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CategoryPages(
                              gender: GenderType.men,
                            ),
                          ),
                        );
                      },
                      child: _optionBox(
                        text: "Men",
                        img: "assets/men.png",
                        gradient: optionGradient,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CategoryPages(
                              gender: GenderType.women,
                            ),
                          ),
                        );
                      },
                      child: _optionBox(
                        text: "Women",
                        img: "assets/women.png",
                        gradient: optionGradient,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= OPTION BOX =================
  Widget _optionBox({
    required String text,
    required String img,
    required LinearGradient gradient,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.6),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ WHITE BACKGROUND BLENDS, FACE STAYS
            SizedBox(
              height: 50,
              width: 50,
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.transparent,
                  BlendMode.multiply, // ⭐ THIS IS THE KEY
                ),
                child: Image.asset(
                  img,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(width: 12),

            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(1, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
