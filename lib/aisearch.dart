import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class AiSearchPage extends StatefulWidget {
  const AiSearchPage({super.key});

  @override
  State<AiSearchPage> createState() => _AiSearchPageState();
}

class _AiSearchPageState extends State<AiSearchPage>
    with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();

  bool isLoading = false;
  String? error;
  List<Map<String, dynamic>> results = [];

 // API link
  final String apiUrl =
      "https://parlour-backend-ruuu.onrender.com/ai-search";

  // Animation for loading
  late AnimationController _iconController;
  late Animation<double> _pulse;

  @override
  void initState() {
    super.initState();

    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulse = Tween<double>(begin: 0.4, end: 0.8).animate(
      CurvedAnimation(parent: _iconController, curve: Curves.easeInOut),
    );
  }

  // API Call with user input location
  Future<void> searchLocation() async {
    final location = _controller.text.trim();
    if (location.isEmpty) return;

    FocusScope.of(context).unfocus();

    setState(() {
      isLoading = true;
      error = null;
      results.clear();
    });

    try {
      final response = await http
          .post(
            Uri.parse(apiUrl),
            headers: const {"Content-Type": "application/json"},
            body: jsonEncode({"location_name": location}),
          )
          .timeout(const Duration(seconds: 45));

      if (!mounted) return;

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List list = decoded["results"] ?? [];

        setState(() {
          results = list.cast<Map<String, dynamic>>();
          _iconController.stop(); // stop animation when results appear
        });
      } else {
        setState(() => error = "Server error (${response.statusCode})");
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => error = "Unable to reach server. Please try again.");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    _iconController.dispose();
    _controller.dispose();
    super.dispose();
  }

  // User interface 
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    const neonHeaderBorder = LinearGradient(
      colors: [
        Color(0xFF00E5FF),
        Color(0xFF7C4DFF),
        Color(0xFFFF4081),
      ],
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              decoration: BoxDecoration(
                gradient: neonHeaderBorder,
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_rounded,
                          color: isDark ? Colors.white : Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    Icon(Icons.auto_awesome,
                        color: isDark ? Colors.white : Colors.black),
                    const SizedBox(width: 8),
                    Text(
                      "AI Search",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _bodyContent()),
          _inputBar(),
        ],
      ),
    );
  }

  // Body widget
  Widget _bodyContent() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return Center(
        child: Text(error!, style: const TextStyle(color: Colors.red)),
      );
    }

    if (results.isEmpty) {
      return _animatedEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: results.length,
      itemBuilder: (_, i) => _resultCard(results[i]),
    );
  }

  // widget style initial (no result)
  Widget _animatedEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _pulse,
            builder: (_, __) {
              return Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00E5FF), Color(0xFF7C4DFF)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00E5FF)
                          .withOpacity(_pulse.value),
                      blurRadius: 30,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.content_cut_rounded,
                  size: 46,
                  color: Colors.white,
                ),
              );
            },
          ),
          const SizedBox(height: 22),
          const Text(
            "Find top salons near you",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Type a location to get started",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }

  // Results from api call (backend)
  Widget _resultCard(Map<String, dynamic> item) {
    final name = item["name"] ?? "Salon";
    final address = item["address"] ?? "Address not available";
    final phone = item["phone"] ?? "";
    final rating = item["rating"] ?? "N/A";
    final mapUrl = item["map_url"];

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF1E1E1E), Color(0xFF121212)],
        ),
      ),
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
                      color: Colors.white),
                ),
              ),
              const Icon(Icons.star, color: Colors.amber, size: 18),
              const SizedBox(width: 4),
              Text(rating, style: const TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on,
                  color: Colors.lightBlueAccent, size: 18),
              const SizedBox(width: 6),
              Expanded(
                child: Text(address,
                    style: const TextStyle(color: Colors.white70)),
              ),
            ],
          ),
          if (phone.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.phone,
                    color: Colors.greenAccent, size: 18),
                const SizedBox(width: 6),
                Text(phone,
                    style: const TextStyle(color: Colors.greenAccent)),
              ],
            ),
          ],
          if (mapUrl != null)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                icon: const Icon(Icons.map),
                label: const Text("Open Map"),
                onPressed: () async {
                  if (await canLaunchUrl(Uri.parse(mapUrl))) {
                    launchUrl(Uri.parse(mapUrl));
                  }
                },
              ),
            ),
        ],
      ),
    );
  }

  // Input bar
  Widget _inputBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.black,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              onSubmitted: (_) => searchLocation(),
              decoration: InputDecoration(
                hintText: "Top salons near <Location>",
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: Colors.grey.shade900,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 18),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.lightBlueAccent),
            onPressed: isLoading ? null : searchLocation,
          ),
        ],
      ),
    );
  }
}
