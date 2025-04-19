//screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/info_card.dart';

class HomeScreen extends StatelessWidget {
  final hijriDate = HijriCalendar.now().toFormat("dd MMMM yyyy");
  final temperature = '22°C';
  final lastVisit = 'Apr 18, 2025';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Hero(
            tag: 'alaqsa-hero',
            child: Container(
              height: 200,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Al-buraq-logo-card2.png',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
          InfoCard(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(Icons.thermostat, size: 24, color: Color.fromARGB(255, 28, 135, 32)),
                    const SizedBox(height: 6),
                    const Text(
                      'Temp',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      temperature,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    const Icon(Icons.calendar_today, size: 24, color: Color.fromARGB(255, 28, 135, 32)),
                    const SizedBox(height: 6),
                    const Text(
                      'Hijri',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      hijriDate,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.access_time_filled, size: 24, color: Color.fromARGB(255, 28, 135, 32)),
                    const SizedBox(height: 6),
                    const Text(
                      'Last Visit',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lastVisit,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
          ),
          InfoCard(
            title: 'About Al-Aqsa Mosque',
            content: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Al-Aqsa Mosque is Islam’s third holiest site, located in Jerusalem’s Old City. It was the first Qibla for Muslims and the site of the Prophet Muhammad’s (peace be upon him) ascension during Al-Isra wal-Mi\'raj.',
                ),
                SizedBox(height: 10),
                Text(
                  'The mosque holds deep spiritual value, and praying there is considered highly rewarding in Islam.',
                ),
              ],
            ),
          ),
          InfoCard(
            title: 'Plan Your Visit',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _visitInfoItem(context, 'Location', 'Al-Aqsa Mosque Complex\nHaram al-Sharif\nOld City, Jerusalem'),
                const Divider(),
                _visitInfoItem(
                  context,
                  'Parking 1 (9:00 - 17:00)',
                  'Closest to the southern gate.',
                  wazeUrl: 'https://waze.com/ul?ll=31.7767,35.2345&navigate=yes',
                ),
                _visitInfoItem(
                  context,
                  'Parking 2 (7:00 - 20:00)',
                  'Good for early access.',
                  wazeUrl: 'https://waze.com/ul?ll=31.7777,35.2365&navigate=yes',
                ),
                _visitInfoItem(
                  context,
                  'Parking 3 (24hrs)',
                  'Open all day and night.',
                  wazeUrl: 'https://waze.com/ul?ll=31.7788,35.2373&navigate=yes',
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
                _etiquetteItem('Physical Contact', 'Avoid physical contact between men and women who are not related.'),
              ],
            ),
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
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Thank you for your support!"),
                  duration: Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(Icons.favorite),
            label: const Text('Support Al-Buraq'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _visitInfoItem(BuildContext context, String title, String details, {String? wazeUrl}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            if (wazeUrl != null)
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () async {
                    final wazeUrlParsed = Uri.parse(wazeUrl);
                    await launchUrl(wazeUrlParsed, mode: LaunchMode.externalApplication);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/waze_icon.png',
                        height: 24,
                        width: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(details),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _etiquetteItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF2C7D56), size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
          const Icon(Icons.arrow_right, color: Color(0xFF2C7D56), size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF333333)),
                  ),
                  TextSpan(
                    text: description,
                    style: const TextStyle(color: Color(0xFF333333)),
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
