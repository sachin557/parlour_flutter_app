import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class NameList extends StatefulWidget {
  final String gender;
  final String category;

  const NameList({
    super.key,
    required this.gender,
    required this.category,
  });

  @override
  State<NameList> createState() => _NameListState();
}

class _NameListState extends State<NameList> {
  bool loading = true;
  String? error;
  List<Map<String, dynamic>> parlours = [];

  String sortBy = "high";

  @override
  void initState() {
    super.initState();
    fetchParlours();
  }

  // api call
  Future<void> fetchParlours() async {
    setState(() {
      loading = true;
      error = null;
    });

    try {
      final response = await http.post(
        Uri.parse("https://parlour-backend-ruuu.onrender.com/search-saloons"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "gender": widget.gender,
          "category": widget.category,
          "sort": sortBy,
        }),
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        setState(() {
          parlours =
              List<Map<String, dynamic>>.from(decoded["results"]);
          loading = false;
        });
      } else {
        setState(() {
          error = "Server error (${response.statusCode})";
          loading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = "Unable to reach server";
        loading = false;
      });
    }
  }

  // User input
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    const LinearGradient neonBorder = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00E5FF),
        Color(0xFF7C4DFF),
        Color(0xFFFF4081),
      ],
    );

    return Scaffold(
      // Header style
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Container(
              decoration: BoxDecoration(
                gradient: neonBorder,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(0.5),
                    blurRadius: 18,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(2.5),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Row(
                  children: [
                    // BACK button
                    _headerIcon(
                      icon: Icons.arrow_back_ios_new_rounded,
                      isDark: isDark,
                      onTap: () => Navigator.pop(context),
                    ),

                    //TITLE
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.gender.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 1.4,
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? Colors.white70
                                  : Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.category.toUpperCase(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.3,
                              color:
                                  isDark ? Colors.white : Colors.grey.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // SORT option
                    PopupMenuButton<String>(
                      tooltip: "Sort",
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      icon: Icon(
                        Icons.sort,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      onSelected: (value) {
                        setState(() {
                          sortBy = value;
                        });
                        fetchParlours();
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: "high",
                          child: Text("Rating: High → Low"),
                        ),
                        PopupMenuItem(
                          value: "low",
                          child: Text("Rating: Low → High"),
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

      // Body widget
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text(error!))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: parlours.length,
                  itemBuilder: (_, i) => _parlourCard(parlours[i]),
                ),
    );
  }

  // Header icons
  Widget _headerIcon({
    required IconData icon,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withOpacity(0.08)
              : Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(
          icon,
          size: 20,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  // results from api call
  Widget _parlourCard(Map<String, dynamic> item) {
    final name = item["name"] ?? "";
    final address = item["address"] ?? "";
    final rating = item["rating"] ?? "N/A";
    final openTime = item["opening_hours"] ?? "";
    final phone = item["international_phone"] ?? "";
    final website = item["website"] ?? "";
    final mapLink = item["map_link"] ?? "";

    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text(rating.toString()),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, size: 18, color: Colors.blue),
                const SizedBox(width: 6),
                Expanded(child: Text(address)),
              ],
            ),
            const SizedBox(height: 8),
            if (openTime.isNotEmpty)
              Row(
                children: [
                  const Icon(Icons.access_time,
                      size: 18, color: Colors.green),
                  const SizedBox(width: 6),
                  Text(openTime),
                ],
              ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (phone.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.call, color: Colors.green),
                    onPressed: () => _launch("tel:$phone"),
                  ),
                if (website.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.language,
                        color: Colors.deepPurple),
                    onPressed: () => _launch(website),
                  ),
                if (mapLink.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.map, color: Colors.blue),
                    onPressed: () => _launch(mapLink),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // do the api url call
  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
