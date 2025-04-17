// screens/info_screen.dart
import 'package:flutter/material.dart';
import '../widgets/info_card.dart';

class InfoScreen extends StatelessWidget {
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
                  'Visitor Information',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Everything you need to know to make your visit respectful, comfortable, and meaningful.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          InfoCard(
            title: 'Etiquette & Dress Code',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _etiquetteItem('Modest Dress',
                    'All visitors must dress modestly. For men, long pants and shirts with sleeves are required. For women, long skirts or pants, long-sleeved shirts, and head coverings are necessary.'),
                _etiquetteItem('Footwear',
                    'Shoes must be removed before entering prayer areas. Bring socks if you prefer not to walk barefoot.'),
                _etiquetteItem('Behavior',
                    'Maintain a quiet, respectful demeanor. Photography is restricted in certain areas. Follow guidance from staff.'),
                _etiquetteItem('Prayer Times',
                    'Non-Muslim visitors should be aware that access is restricted during prayer times.'),
                _etiquetteItem('Physical Contact', 'Avoid physical contact between men and women who are not related.'),
              ],
            ),
          ),
          InfoCard(
            title: 'Best Times to Visit',
            content: Text(
                'Early mornings (8:00-10:00 AM) on weekdays typically have fewer visitors. Avoid Fridays entirely, as this is the main congregational prayer day. Islamic holidays and the month of Ramadan see increased visitor numbers and potentially modified hours.'),
          ),
          InfoCard(
            title: 'Access & Security',
            content: Text(
                'All visitors must pass through security checkpoints. Bring a valid ID or passport. Entry policies may change according to the political situation, so check current requirements before your visit. Some gates are only accessible to Muslims, while non-Muslims typically enter through the Moroccan Gate.'),
          ),
          InfoCard(
            title: 'Facilities',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _facilityItem('Ablution Areas', 'Available for ritual washing before prayers'),
                _facilityItem('Restrooms', 'Located near entrance gates'),
                _facilityItem('Water Fountains', 'Available throughout the complex'),
                _facilityItem('Limited Seating', 'Primarily in shaded areas'),
                _facilityItem('No Food Services', 'Eating is not permitted in most areas'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _etiquetteItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Color(0xFF2C7D56), size: 20),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _facilityItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.arrow_right, color: Color(0xFF2C7D56), size: 20),
          SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF333333)),
                  ),
                  TextSpan(
                    text: description,
                    style: TextStyle(color: Color(0xFF333333)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
