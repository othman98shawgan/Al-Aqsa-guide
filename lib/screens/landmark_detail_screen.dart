import 'package:flutter/material.dart';
import '../models/landmark.dart';
import 'chatbot_screen.dart'; // 👈 make sure this is correct

class LandmarkDetailScreen extends StatelessWidget {
  final Landmark landmark;

  const LandmarkDetailScreen({Key? key, required this.landmark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(landmark.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(landmark.imagePath),
            const SizedBox(height: 10),
            Text(
              landmark.longDescription,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.chat),
        label: Text('Ask About ' '${landmark.name}'),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ChatBotScreen(
                initialQuestion: 'Tell me a little bit about ${landmark.name}',
              ),
            ),
          );
        },
      ),
    );
  }
}
