// screens/highlights_screen.dart
import 'package:flutter/material.dart';
import '../models/highlight.dart';
import '../widgets/highlight_card.dart';

class HighlightsScreen extends StatelessWidget {
  final List<Highlight> highlights = [
    Highlight(
      title: 'Dome of the Rock',
      description:
          'Built between 685-691 CE, this iconic golden-domed structure is one of the oldest works of Islamic architecture. Its octagonal design and stunning mosaics make it instantly recognizable. It enshrines the rock from which Prophet Muhammad is believed to have ascended to heaven.',
      imagePlaceholder: 'Dome of the Rock',
    ),
    Highlight(
      title: 'Al-Aqsa Mosque (Qibli Mosque)',
      description:
          'The main congregational mosque of the complex featuring a silver dome. It can accommodate thousands of worshippers. Its interior showcases magnificent carpets, stained glass windows, and ornate mihrab (prayer niche).',
      imagePlaceholder: 'Al-Aqsa Mosque (Qibli Mosque)',
    ),
    Highlight(
      title: 'Marwani Prayer Hall',
      description:
          'Also known as Solomon\'s Stables, this vast underground space features massive columns and arches. Originally used as stables during the Crusader period, it was later restored as a prayer space that can hold thousands of worshippers.',
      imagePlaceholder: 'Marwani Prayer Hall',
    ),
    Highlight(
      title: 'Islamic Museum',
      description:
          'Housing artifacts from various Islamic periods, the museum showcases ancient manuscripts, pottery, weapons, and ornate wooden minbars (pulpits). The collection provides insight into the complex\'s rich history.',
      imagePlaceholder: 'Islamic Museum',
    ),
    Highlight(
      title: 'Buraq Wall',
      description:
          'The western wall of the complex where Muslims believe Prophet Muhammad tethered Buraq, the heavenly steed that carried him during the Night Journey. It holds significant spiritual importance.',
      imagePlaceholder: 'Buraq Wall',
    ),
    Highlight(
      title: 'Ancient Olive Trees',
      description:
          'The complex contains some olive trees that are centuries old, providing peaceful shade and representing peace and resilience in Islamic tradition.',
      imagePlaceholder: 'Ancient Olive Trees',
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
                  'Highlights of Al-Aqsa',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Discover the must-see landmarks and special features of this sacred complex.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: highlights.length,
            itemBuilder: (context, index) {
              return HighlightCard(highlight: highlights[index]);
            },
          ),
        ],
      ),
    );
  }
}
