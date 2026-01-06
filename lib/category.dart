import 'package:flutter/material.dart';
import "makeuplist.dart";

class CategoryPages extends StatefulWidget {
  const CategoryPages({super.key});

  @override
  State<CategoryPages> createState() => _CategoryPagesState();
}

class _CategoryPagesState extends State<CategoryPages> {
  String selectedSort = "none"; // 👈 store selection

  String getSortLabel() {
    if (selectedSort == "high") return "High → Low";
    if (selectedSort == "low") return "Low → High";
    return "Sort by price";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getSortLabel()), // 👈 show selected value
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: (value) {
              setState(() {
                selectedSort = value; // 👈 save selection
              });

              // 🔹 Later: apply sorting logic
              if (value == "high") {
                print("Sort High → Low");
              } else {
                print("Sort Low → High");
              }
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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 6,
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const NameList()),
                            );
                          },
                          child: _categoryBox("Hair", Colors.pinkAccent),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const NameList()),
                            );
                          },
                          child: _categoryBox("Spa", Colors.orangeAccent),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const NameList()),
                            );
                          },
                          child: _categoryBox("Makeup", Colors.pinkAccent),
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

  Widget _categoryBox(String text, Color color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
