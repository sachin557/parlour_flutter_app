import 'package:flutter/material.dart';
import 'package:parlour_app/gender_type.dart';
import 'makeuplist.dart';

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

  String getSortLabel() {
    if (selectedSort == "high") return "High → Low";
    if (selectedSort == "low") return "Low → High";
    return "Sort by price";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isMen ? "Men Services" : "Women Services"),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 70),

            SizedBox(
              
              width: double.infinity,
              child: Card(
                color:Colors.transparent,
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  height: isWomen ? 260 : 220,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      // 🔹 FIRST ROW
                      Row(
                        children: [
                          if (isMen)
                            Expanded(
                              child: InkWell(
                                onTap: () => _openList(context),
                                child: _categoryBox(
                                  text: "Hair",
                                  iconPath: "assets/Hair_men.png",
                                ),
                              ),
                            ),
                          if (isWomen)
                            Expanded(
                              child: InkWell(
                                onTap: () => _openList(context),
                                child: _categoryBox(
                                  text: "Hair",
                                  iconPath: "assets/Hair_women.png",
                                ),
                              ),
                            ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: InkWell(
                              onTap: () => _openList(context),
                              child: _categoryBox(
                                text: isMen ? "Men Spa" : "Spa",
                                iconPath: "assets/spa.png",
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // 🔹 WOMEN ONLY
                      if (isWomen)
                        SizedBox(
                          width: double.infinity,
                          child: InkWell(
                            onTap: () => _openList(context),
                            child: _categoryBox(
                              text: "Makeup",
                              iconPath: "assets/Makeup_women.png",
                            ),
                          ),
                        ),

                      // 🔹 MEN ONLY
                      if (isMen)
                        SizedBox(
                          width: double.infinity,
                          child: InkWell(
                            onTap: () => _openList(context),
                            child: _categoryBox(
                              text: "Groom Makeup Artist",
                              iconPath: "assets/Makeup_men.png",
                            ),
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

  void _openList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const NameList()),
    );
  }

  // ✅ IMAGE + TEXT BOX (50x50 image, black text)
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
            Image.asset(
              iconPath,
              height: 50,
              width: 50,
              fit: BoxFit.contain,
            ),
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
