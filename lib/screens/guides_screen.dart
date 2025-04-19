// screens/guides_screen.dart
import 'package:flutter/material.dart';
import '../widgets/guide_card.dart';
import '../models/guide.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GuidesScreen extends StatelessWidget {
  final List<Guide> guides = [
    Guide(
      rating: 8,
      name: "Mohammad Hojere",
      bio:
          "Experienced guide with deep knowledge of Islamic architecture and Al-Aqsa's rich history.",
      languages: ["English", "Arabic"],
      specialties: [
        "Architecture",
        "Spiritual Significance",
        "Historical Events"
      ],
    ),
    Guide(
      rating: 8,
      name: "Mahdee Zoabi",
      bio:
          "Historian and tour guide passionate about storytelling and sacred Islamic landmarks.",
      languages: ["Arabic", "French"],
      specialties: ["Storytelling", "Landmark Significance", "Islamic Art"],
    ),
    Guide(
      rating: 8,
      name: "Omar Jamal",
      bio:
          "Historian and tour guide passionate about Architecture and sacred Islamic landmarks.",
      languages: ["Arabic", "English"],
      specialties: ["Architecture", "Landmark Significance", "Islamic Art"],
    ),
    Guide(
      rating: 8,
      name: "Yones Ganaiem",
      bio:
          "Historian and tour guide passionate about Architecture and sacred Islamic landmarks.",
      languages: ["Arabic", "Spanish"],
      specialties: ["Architecture", "Landmark Significance", "Islamic Art"],
    ),
    Guide(
      rating: 9.9,
      name: "Othman Shawgan",
      bio:
          "Certified guide with over 10 years of experience in guiding international visitors.",
      languages: ["English", "Hebrew"],
      specialties: [
        "Political History",
        "Cultural Traditions",
        "Spiritual Reflections"
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: guides.length,
      itemBuilder: (context, index) {
        return GuideCard(guide: guides[index]);
      },
    );
  }
}
