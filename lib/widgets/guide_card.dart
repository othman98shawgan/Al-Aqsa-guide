import 'package:flutter/material.dart';
import '../models/guide.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GuideCard extends StatelessWidget {
  final Guide guide;

  const GuideCard({required this.guide, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              guide.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(guide.bio),
            const SizedBox(height: 10),
            Text(
              'Languages:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Wrap(
              spacing: 6,
              children: guide.languages
                  .map((lang) => Chip(label: Text(lang)))
                  .toList(),
            ),
            const SizedBox(height: 10),
            Text(
              'Specialties:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            ...guide.specialties.map((specialty) => Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.star,
                          size: 16,
                          color: Theme.of(context).colorScheme.secondary),
                      SizedBox(width: 5),
                      Expanded(child: Text(specialty)),
                    ],
                  ),
                )),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Rating:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < (guide.rating / 2).round()
                              ? Icons.star
                              : Icons.star_border,
                          color: const Color.fromARGB(255, 209, 158, 8),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Add your contact logic here
                    },
                    icon: FaIcon(FontAwesomeIcons.whatsapp),
                    label: const Text('Contact'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor:
                          Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
