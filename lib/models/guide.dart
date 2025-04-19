// models/guide.dart
class Guide {
  final String name;
  final String bio;
  final List<String> languages;
  final List<String> specialties;
  final double rating; // ⭐️ New rating field

  Guide({
    required this.name,
    required this.bio,
    required this.languages,
    required this.specialties,
    required this.rating,
  });
}
