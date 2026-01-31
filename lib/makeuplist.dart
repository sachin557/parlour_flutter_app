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

  @override
  void initState() {
    super.initState();
    fetchParlours();
  }

  // ================= BACKEND API CALL =================
  Future<void> fetchParlours() async {
    try {
      final response = await http.post(
        Uri.parse("http://127.0.0.1:8000/search-saloons"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "gender": widget.gender,
          "category": widget.category,
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
      debugPrint("FRONTEND ERROR: $e");
      setState(() {
        error = "Unable to reach server";
        loading = false;
      });
    }
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.gender.toUpperCase()} - ${widget.category.toUpperCase()}",
        ),
        centerTitle: true,
      ),
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

  // ================= PARLOUR CARD =================
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
            // NAME + RATING
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

            // ADDRESS
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, size: 18, color: Colors.blue),
                const SizedBox(width: 6),
                Expanded(child: Text(address)),
              ],
            ),

            const SizedBox(height: 8),

            // OPENING HOURS
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

            // ACTION ICONS
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

  // ================= URL LAUNCHER =================
  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
