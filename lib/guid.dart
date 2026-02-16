import 'package:flutter/material.dart';

class Guid extends StatelessWidget {
  const Guid({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // header
    const LinearGradient neonHeaderBorder = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00E5FF),
        Color(0xFF7C4DFF),
        Color(0xFFFF4081),
      ],
    );

    // widget styling and option
    const LinearGradient guideGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF7FC8F8),
        Color(0xFFF77EB9),
        Color(0xFFFED7A5),
      ],
    );

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.grey.shade100,

      // Header style
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
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        "App Guide",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      // body widget
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 20),

            // Info
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: guideGradient,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: const [
                  Icon(Icons.spa, size: 48, color: Colors.black),
                  SizedBox(height: 14),
                  Text(
                    "Welcome to NoorCall Parlour",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "This guide helps you understand all features available in the parlour app.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            // Guid details
            _guideTile(
              icon: Icons.location_on,
              title: "Parlour Near Me",
              description:
                  "Find nearby parlours based on your current location with directions.",
            ),

            _guideTile(
              icon: Icons.calendar_month,
              title: "Book an Appointment",
              description:
                  "Select services, choose a time slot, and book your appointment easily.",
            ),

            _guideTile(
              icon: Icons.category,
              title: "Category",
              description:
                  "Browse services by category such as haircut, spa, facial, grooming, etc.",
            ),

            _guideTile(
              icon: Icons.support_agent,
              title: "Contact Support",
              description:
                  "Reach out for help regarding bookings, payments, or app issues.",
            ),

            _guideTile(
              icon: Icons.auto_awesome,
              title: "AI Search",
              description:
                  "Use AI-powered search to quickly find services, offers, or parlours.",
            ),

            _guideTile(
              icon: Icons.monetization_on,
              title: "Bonus",
              description:
                  "Check available bonuses, offers, and rewards for your bookings.",
            ),
          ],
        ),
      ),
    );
  }

  // Guide title
  Widget _guideTile({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: Colors.black),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
