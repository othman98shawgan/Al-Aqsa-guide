import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class BookingCalendarDemoApp extends StatefulWidget {
  final bool virtual;
  const BookingCalendarDemoApp({Key? key, required this.virtual})
      : super(key: key);

  @override
  State<BookingCalendarDemoApp> createState() => _BookingCalendarDemoAppState();
}

class _BookingCalendarDemoAppState extends State<BookingCalendarDemoApp> {
  final now = DateTime.now();
  late BookingService mockBookingService;
  int maxVisitors = 50;
  int remainingVisitors = 50;

  @override
  void initState() {
    super.initState();
    // DateTime.now().startOfDay
    // DateTime.now().endOfDay
    mockBookingService = BookingService(
        serviceName: 'Mock Service',
        serviceDuration: 30,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }
/*
  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    print('${newBooking.toJson()} has been uploaded');
  }

  Future<dynamic> uploadBookingMockVirtual(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));

    converted.add(DateTimeRange(
      start: newBooking.bookingStart,
      end: newBooking.bookingEnd,
    ));

    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Booking Confirmed'),
          content: Text(
            'Your tour has been successfully booked!\n\n'
            '📅 Date: ${newBooking.bookingStart.toLocal().toString().substring(0, 16)}\n'
            '🕒 Duration: ${newBooking.serviceDuration} minutes',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }*/

  Future<dynamic> uploadBookingMockVirtual({
    required BookingService newBooking,
  }) async {
    final TextEditingController emailController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Your Email'),
          content: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Enter your email'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final String email = emailController.text.trim();
                if (email.isNotEmpty && email.contains('@')) {
                  converted.add(DateTimeRange(
                    start: newBooking.bookingStart,
                    end: newBooking.bookingEnd,
                  ));
                  print(
                      '${newBooking.toJson()} has been uploaded with email: $email');

                  Navigator.of(context).pop();

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Booking Confirmed'),
                        content: Text(
                          'Your virtual tour has been booked!\n\n'
                          '📧 Email: $email\n'
                          '📅 Date: ${newBooking.bookingStart.toLocal().toString().substring(0, 16)}\n'
                          '🕒 Duration: ${newBooking.serviceDuration} minutes',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> uploadBookingMock({
    required BookingService newBooking,
  }) async {
    final TextEditingController peopleController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Number of People'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Remaining spots: $remainingVisitors',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: peopleController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: 'Enter number of people'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final int? people = int.tryParse(peopleController.text);
                if (people != null &&
                    people > 0 &&
                    people <= remainingVisitors) {
                  setState(() {
                    remainingVisitors -= people;
                    converted.add(DateTimeRange(
                      start: newBooking.bookingStart,
                      end: newBooking.bookingEnd,
                    ));
                  });
                  Navigator.of(context).pop();

                  // Show confirmation dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Booking Confirmed'),
                        content: Text(
                          'Your tour has been successfully booked!\n\n'
                          '👥 People: $people\n'
                          '📅 Date: ${newBooking.bookingStart.toLocal().toString().substring(0, 16)}\n'
                          '🕒 Duration: ${newBooking.serviceDuration} minutes\n'
                          '✅ Spots remaining: $remainingVisitors',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        people == null || people <= 0
                            ? 'Please enter a valid number'
                            : 'Only $remainingVisitors spot(s) left!',
                      ),
                    ),
                  );
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    ///take care this is only mock, so if you add today as disabledDays it will still be visible on the first load
    ///disabledDays will properly work with real data
    DateTime first = now;
    DateTime tomorrow = now.add(const Duration(days: 1));
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    converted.add(
        DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
    converted.add(DateTimeRange(
        start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(DateTimeRange(
        start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(DateTimeRange(
        start: fourth, end: fourth.add(const Duration(minutes: 50))));

    //book whole day example
    converted.add(DateTimeRange(
        start: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 5, 0),
        end: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 0)));
    return converted;
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 30),
          end: DateTime(now.year, now.month, now.day, 13, 0)),
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 16, 0),
          end: DateTime(now.year, now.month, now.day, 16, 30))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book a Tour'),
      ),
      body: Center(
        child: BookingCalendar(
          availableSlotColor: Color.fromARGB(255, 89, 200, 146),
          bookingService: mockBookingService,
          convertStreamResultToDateTimeRanges: convertStreamResultMock,
          getBookingStream: getBookingStreamMock,
          uploadBooking:
              widget.virtual ? uploadBookingMockVirtual : uploadBookingMock,
          pauseSlots: generatePauseSlots(),
          pauseSlotText: 'Pray',
          hideBreakTime: false,
          loadingWidget: const Text('Fetching data...'),
          uploadingWidget: const CircularProgressIndicator(),
          locale: 'en_EN',
          startingDayOfWeek: StartingDayOfWeek.tuesday,
          wholeDayIsBookedWidget:
              const Text('Sorry, for this day everything is booked'),
          //disabledDates: [DateTime(2023, 1, 20)],
          //disabledDays: [6, 7],
        ),
      ),
    );
  }
}
