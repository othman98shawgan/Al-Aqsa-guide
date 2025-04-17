// screens/tours_screen.dart
import 'package:flutter/material.dart';
import '../models/tour.dart';
import '../widgets/tour_card.dart';

class ToursScreen extends StatelessWidget {
  final List<Tour> tours = [
    Tour(
      title: 'Essential Al-Aqsa Tour',
      duration: '90 minutes',
      description:
          'This introductory tour covers the main areas of the Al-Aqsa complex, providing essential information about its historical and religious significance.',
      stops: [
        'Qibli Mosque (Main Prayer Hall)',
        'Dome of the Rock (exterior view)',
        'Ancient Al-Aqsa',
        'Marwani Prayer Hall',
        'View of Mount of Olives'
      ],
      price: '\$25 per person',
    ),
    Tour(
      title: 'Historical Deep Dive',
      duration: '3 hours',
      description:
          'A comprehensive exploration of the complex\'s rich history spanning multiple civilizations and religious traditions.',
      stops: [
        'All sites in Essential Tour',
        'Archaeological areas',
        'Historic inscriptions',
        'Solomon\'s Stables',
        'Ancient water cisterns',
        'Islamic Museum'
      ],
      price: '\$40 per person',
    ),
    Tour(
      title: 'Architectural Wonders Tour',
      duration: '2 hours',
      description:
          'Focus on the stunning Islamic architecture throughout the complex, with detailed explanations of construction techniques, decorative elements, and architectural significance.',
      stops: [
        'Dome of the Rock (detailed exterior analysis)',
        'Qibli Mosque architecture',
        'Historic fountains and ablution areas',
        'Minarets and arches',
        'Geometric patterns and calligraphy'
      ],
      price: '\$35 per person',
    ),
    Tour(
      title: 'Sunset Spiritual Experience',
      duration: '2 hours',
      description:
          'Experience the tranquility of Al-Aqsa during the golden hour with emphasis on the spiritual significance and peaceful contemplation.',
      stops: [
        'Quiet corners for reflection',
        'Prayer areas',
        'Spiritual history',
        'Panoramic views at sunset',
        'Stories of prophets and saints'
      ],
      price: '\$30 per person',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  'Guided Tours',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Explore Al-Aqsa Mosque with our knowledgeable guides who will provide historical context, cultural insights, and spiritual significance of this sacred site.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: tours.length,
            itemBuilder: (context, index) {
              return TourCard(tour: tours[index]);
            },
          ),
        ],
      ),
    );
  }
}
