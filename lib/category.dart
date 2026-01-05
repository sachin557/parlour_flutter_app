import 'package:flutter/material.dart';

class CategoryPages extends StatelessWidget {
  const CategoryPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sort by price")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              
              width: double.infinity,
              child: Card(
                color:Colors.transparent,
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      // LEFT
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // TODO: Navigator.push(...)
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey),
                              color:Colors.pinkAccent
                            ),
                            child: const Center(
                              child: Text(
                                "Hair",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // RIGHT
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // TODO: Navigator.push(...)
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey),
                              color:Colors.orangeAccent
                            ),
                            child: const Center(
                              child: Text(
                                "spa",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width:12),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // TODO: Navigator.push(...)
                          },
                          child: Container(
                            
                            decoration: BoxDecoration(
                              
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey),
                              color:Colors.pinkAccent
                            ),
                            child: const Center(
                              child: Text(
                                "makeup",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
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
}
