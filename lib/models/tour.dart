// models/tour.dart
class Tour {
  final String title;
  final String duration;
  final String description;
  final List<String> stops;
  final String price;

  Tour({
    required this.title,
    required this.duration,
    required this.description,
    required this.stops,
    required this.price,
  });
}
