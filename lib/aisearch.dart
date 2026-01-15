import 'package:flutter/material.dart';

class AiSearchPage extends StatefulWidget {
  const AiSearchPage({super.key});

  @override
  State<AiSearchPage> createState() => _AiSearchPageState();
}

class _AiSearchPageState extends State<AiSearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // 🌈 Multi-color header border
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
      // ================= HEADER =================
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
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "AI Search",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color:
                                  isDark ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
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

      // ================= BODY =================
      body: Column(
        children: [
          // 🔹 AI INTRO / HINT
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ================= ICON ROW =================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.face, size: 34, color: Colors.blueGrey),
                      SizedBox(width: 10),
                      Icon(Icons.content_cut,
                          size: 34, color: Colors.pinkAccent),
                      SizedBox(width: 10),
                      Icon(Icons.face_retouching_natural,
                          size: 34, color: Colors.deepPurple),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ================= TEXT =================
                  Text(
                    "Ask AI to find the best saloons\nfor men & women near you",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ================= INPUT BAR =================
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Top saloons near <Location>",
                      hintStyle: TextStyle(
                        color: Colors.blueGrey.shade300,
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.2,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade900,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.lightBlueAccent, // ✨ Gold
                  ),
                  onPressed: () {
                    print(_controller.text);
                    _controller.clear();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
