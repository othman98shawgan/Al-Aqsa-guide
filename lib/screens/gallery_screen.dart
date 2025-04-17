// screens/gallery_screen.dart
import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  final List<String> galleryItems = [
    'Dome of the Rock Exterior',
    'Al-Aqsa Mosque Interior',
    'Panoramic View of Complex',
    'Historic Minbar',
    'Intricate Mosaics',
    'Ancient Archways',
    'Calligraphy Details',
    'Prayer Hall During Service',
    'Courtyard Fountains',
    'Sunset over Jerusalem',
    'Islamic Museum Artifacts',
    'Ancient Olive Trees',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          color: Theme.of(context).primaryColor,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'Photo Gallery',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Visual exploration of Al-Aqsa Mosque\'s beauty and significance.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: galleryItems.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      galleryItems[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
