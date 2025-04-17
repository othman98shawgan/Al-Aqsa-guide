import 'package:flutter/material.dart';
import '../models/landmark.dart';

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
            SizedBox(height: 10),
            Text(
              landmark.longDescription,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
