import 'package:flutter/material.dart';
import '../models/landmark.dart';

class LandmarkDialog extends StatelessWidget {
  final Landmark landmark;

  const LandmarkDialog({Key? key, required this.landmark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      title: Text(
        landmark.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(landmark.imagePath, height: 120, fit: BoxFit.cover),
          ),
          SizedBox(height: 12),
          Text(
            landmark.shortDescription,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close, color: Colors.grey),
          tooltip: 'Close',
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: Text('More Info'),
        ),
      ],
    );
  }
}
