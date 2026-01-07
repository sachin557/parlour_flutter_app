import 'package:flutter/material.dart';

class Bonus extends StatelessWidget {
  const Bonus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Referral Bonus")),
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
                            ),
                            child: const Center(
                              child: Text(
                                "Total Bonus points",
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
