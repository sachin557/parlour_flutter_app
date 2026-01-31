import 'package:flutter/material.dart';
import 'package:parlour_app/gender_type.dart';
import 'makeuplist.dart'; // This is NameList page

class CategoryPages extends StatefulWidget {
  final GenderType gender;
  

  const CategoryPages({
    super.key,
    required this.gender,
  });

  @override
  State<CategoryPages> createState() => _CategoryPagesState();
}

class _CategoryPagesState extends State<CategoryPages> {
  String selectedSort = "none";

  bool get isMen => widget.gender == GenderType.men;
  bool get isWomen => widget.gender == GenderType.women;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
      // ================= NEON HEADER =================
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: neonHeaderBorder,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(0.6),
                    blurRadius: 16,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(2.5),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    // BACK
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),

                    // TITLE
                    Expanded(
                      child: Text(
                        isMen ? "Men Services" : "Women Services",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),

                    // FILTER
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PopupMenuButton<String>(
                          icon: Icon(
                            Icons.sort,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          onSelected: (value) {
                            setState(() {
                              selectedSort = value;
                            });
                          },
                          itemBuilder: (context) => const [
                            PopupMenuItem(
                              value: "high",
                              child: Text("Price: High → Low"),
                            ),
                            PopupMenuItem(
                              value: "low",
                              child: Text("Price: Low → High"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Filters",
                          style: TextStyle(
                            fontSize: 11,
                            color: isDark
                                ? Colors.white70
                                : Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
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
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 70),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.transparent,
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  height: isWomen ? 260 : 220,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => _openList(context, "hair"),
                              child: _categoryBox(
                                text: "Hair",
                                iconPath: isMen
                                    ? "assets/Hair_men.png"
                                    : "assets/Hair_women.png",
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: InkWell(
                              onTap: () => _openList(context, "spa"),
                              child: _categoryBox(
                                text: isMen ? "Men Spa" : "Spa",
                                iconPath: "assets/spa.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      if (isWomen)
                        InkWell(
                          onTap: () => _openList(context, "makeup"),
                          child: _categoryBox(
                            text: "Makeup",
                            iconPath: "assets/Makeup_women.png",
                          ),
                        ),
                      if (isMen)
                        InkWell(
                          onTap: () => _openList(context, "makeup"),
                          child: _categoryBox(
                            text: "Groom Makeup Artist",
                            iconPath: "assets/Makeup_men.png",
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= NAVIGATION =================
  void _openList(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => NameList(
          gender: isMen ? "men" : "women",
          category: category,
        ),
      ),
    );
  }

  // ================= CATEGORY BOX =================
  Widget _categoryBox({
    required String text,
    required String iconPath,
  }) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, height: 50, width: 50),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
