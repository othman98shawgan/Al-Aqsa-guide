// screens/tours_screen.dart
import 'package:flutter/material.dart';
import '../models/tour.dart';
import '../widgets/tour_card.dart';

class ToursScreen extends StatelessWidget {
  final List<Tour> tours = [
    Tour(
      title: 'Virtual Aqsa Tour - Zoom',
      duration: '60 minutes',
      description:
          'The Virtual Aqsa Tour offers an immersive online experience to explore the historical and spiritual wonders of Al-Aqsa Mosque.',
      stops: [
        'Qibli Mosque (Main Prayer Hall)',
        'Dome of the Rock (exterior view)',
        'Ancient Al-Aqsa',
        'Marwani Prayer Hall',
        'View of Mount of Olives'
      ],
      price: '\$10 per person',
    ),
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
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TourCard(
            tour: tours[0],
            virtual: true,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: tours.length - 1,
            itemBuilder: (context, index) {
              return TourCard(tour: tours[index + 1], virtual: false);
            },
          ),
        ],
      ),
    );
  }
}
