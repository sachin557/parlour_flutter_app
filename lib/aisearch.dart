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
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Search"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // 🔹 Future AI responses can appear here
          Expanded(
            child: Center(
              child: Text(
                "AI search will display the top saloons based on location",
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
          ),

          // 🔹 Bottom typing bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color:Colors.white
                    ),
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Top saloons near <Location>",
                      hintStyle: TextStyle(
                        color:Colors.blueGrey,
                        fontWeight: FontWeight.w100
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  color:Colors.blue,
                  onPressed: () {
                    // Later: connect AI logic here
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
