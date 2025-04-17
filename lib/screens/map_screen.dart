import 'package:flutter/material.dart';
import '../models/landmark.dart';
import 'landmark_detail_screen.dart';
import '../widgets/landmark_dialog.dart';
import '../data/landmarks_data.dart';

class MapScreen extends StatelessWidget {
  final List<Landmark> landmarks = landmarkData
      .map((data) => Landmark(
            id: data['id'],
            name: data['name'],
            shortDescription: data['shortDescription'],
            longDescription: data['longDescription'],
            imagePath: data['imagePath'],
            top: data['top'].toDouble(),
            left: data['left'].toDouble(),
            type: data['type'],
          ))
      .toList();

  void _openLandmarkDialog(BuildContext context, Landmark landmark) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => LandmarkDialog(landmark: landmark),
    );

    if (result == true) {
      final reopen = await Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (_) => LandmarkDetailScreen(landmark: landmark),
        ),
      );

      if (reopen == true) {
        _openLandmarkDialog(context, landmark);
      }
    }
  }

  Color _getColorByType(String type) {
    switch (type) {
      case 'Mosque':
        return Colors.green;
      case 'Dome':
        return Colors.blue;
      case 'Gate':
        return Colors.orange;
      case 'Building':
        return Colors.purple;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double mapWidth = 566;
          double mapHeight = 800;

          return InteractiveViewer(
            minScale: 1,
            maxScale: 4,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/Map.jpg',
                  fit: BoxFit.contain,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                ),
                ...landmarks.map((lm) {
                  double x = (lm.left / mapWidth) * constraints.maxWidth;
                  double y = (lm.top / mapHeight) * constraints.maxHeight;

                  return Positioned(
                    top: y,
                    left: x,
                    child: GestureDetector(
                      onTap: () => _openLandmarkDialog(context, lm),
                      child: Icon(
                        Icons.location_on,
                        color: _getColorByType(lm.type ?? ''),
                        size: 32,
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
