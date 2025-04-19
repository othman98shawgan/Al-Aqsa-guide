class Landmark {
  final String id;
  final String name;
  final String shortDescription;
  final String longDescription;
  final List<String> imagePaths;
  final double top;
  final double left;
  final String? type;

  Landmark({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.longDescription,
    required this.imagePaths,
    required this.top,
    required this.left,
    this.type,
  });
}
