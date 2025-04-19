import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../models/landmark.dart';
import 'chatbot_screen.dart';

class LandmarkDetailScreen extends StatefulWidget {
  final Landmark landmark;

  const LandmarkDetailScreen({Key? key, required this.landmark}) : super(key: key);

  @override
  State<LandmarkDetailScreen> createState() => _LandmarkDetailScreenState();
}

class _LandmarkDetailScreenState extends State<LandmarkDetailScreen> {
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void dispose() {
    _flutterTts.stop(); // Stop speech when screen is disposed
    super.dispose();
  }

  Future<void> _speak() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(widget.landmark.longDescription);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.landmark.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: widget.landmark.imagePaths.length,
                controller: PageController(viewportFraction: 0.9),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.landmark.imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.volume_up),
                  tooltip: 'Play Audio Description',
                  onPressed: _speak,
                ),
                Expanded(
                  child: Text(
                    widget.landmark.longDescription,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.chat),
        label: Text('Ask About ${widget.landmark.name}'),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ChatBotScreen(
                initialQuestion: 'Tell me a little bit about ${widget.landmark.name}',
              ),
            ),
          );
        },
      ),
    );
  }
}
