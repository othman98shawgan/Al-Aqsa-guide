//screens/home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/info_card.dart';

class HomeScreen extends StatelessWidget {
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Al-Aqsa Mosque',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Explore one of Islam\'s most sacred sites located in the heart of Jerusalem\'s Old City',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InfoCard(
            title: 'About Al-Aqsa Mosque',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Al-Aqsa Mosque, also known as Masjid al-Aqsa or "the Farthest Mosque," is located in the Old City of Jerusalem. It is the third holiest site in Islam after Masjid al-Haram in Mecca and Masjid an-Nabawi in Medina. The entire complex is referred to as Al-Haram ash-Sharif (The Noble Sanctuary) and includes the Dome of the Rock, prayer spaces, and other important Islamic structures.',
                ),
                SizedBox(height: 10),
                Text(
                  'The mosque stands on the Temple Mount, a site of tremendous religious significance to Muslims, Jews, and Christians alike. For Muslims, it is the place from which Prophet Muhammad (peace be upon him) is believed to have ascended to heaven during the Night Journey (Isra and Mi\'raj).',
                ),
              ],
            ),
          ),
          InfoCard(
            title: 'Plan Your Visit',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _visitInfoItem(context, 'Opening Hours',
                    'Sunday - Thursday: 7:30 AM - 11:30 AM, 1:30 PM - 2:30 PM\nFriday: Open for Muslim prayer only\nSaturday: Closed\nNote: Hours may vary during Islamic holidays and Ramadan'),
                Divider(),
                _visitInfoItem(
                    context, 'Location', 'Al-Aqsa Mosque Complex\nTemple Mount/Haram al-Sharif\nOld City, Jerusalem'),
                Divider(),
                _visitInfoItem(context, 'Entrance',
                    'Non-Muslims: Enter through the Moroccan Gate (Mughrabi Gate)\nMuslims: Can enter through multiple gates\nVisitors should check current entry requirements before visiting'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _visitInfoItem(BuildContext context, String title, String details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 5),
        Text(details),
      ],
    );
  }
}
