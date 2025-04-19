// widgets/tour_card.dart
import 'package:flutter/material.dart';
import '../models/tour.dart';
import 'package:booking_calendar/booking_calendar.dart';
import '../models/booking_calendar.dart';

class TourCard extends StatelessWidget {
  final Tour tour;
  final bool virtual;

  TourCard({required this.tour, required this.virtual});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    tour.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: virtual
                          ? const Color.fromARGB(255, 131, 189, 216)
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: virtual
                        ? const Color.fromARGB(255, 131, 189, 216)
                        : Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tour.duration,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tour.description),
                SizedBox(height: 10),
                Text(
                  'Tour Stops:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                ...tour.stops
                    .map((stop) => Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.place,
                                  size: 16,
                                  color: virtual
                                      ? const Color.fromARGB(255, 131, 189, 216)
                                      : Theme.of(context)
                                          .colorScheme
                                          .secondary),
                              SizedBox(width: 5),
                              Expanded(child: Text(stop)),
                            ],
                          ),
                        ))
                    .toList(),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tour.price,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: virtual
                            ? const Color.fromARGB(255, 131, 189, 216)
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BookingCalendarDemoApp(virtual: virtual)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: virtual
                            ? const Color.fromARGB(255, 131, 189, 216)
                            : Theme.of(context).colorScheme.secondary,
                        foregroundColor:
                            Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      child: virtual
                          ? Row(
                              children: [
                                Icon(Icons.video_camera_back),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Book Now'),
                              ],
                            )
                          : Text('Book Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
