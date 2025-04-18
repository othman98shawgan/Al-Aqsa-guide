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

                  return AnimatedMarker(
                    top: y,
                    left: x,
                    color: _getColorByType(lm.type ?? ''),
                    onTap: () => _openLandmarkDialog(context, lm),
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

class AnimatedMarker extends StatefulWidget {
  final double top;
  final double left;
  final Color color;
  final VoidCallback onTap;

  const AnimatedMarker({
    Key? key,
    required this.top,
    required this.left,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AnimatedMarker> createState() => _AnimatedMarkerState();
}

class _AnimatedMarkerState extends State<AnimatedMarker> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
      lowerBound: 0.8,
      upperBound: 1.0,
    );
    _scale = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.value = 1.0;
  }

  void _handleTap() async {
    await _controller.reverse();
    await _controller.forward();
    widget.onTap();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      child: GestureDetector(
        onTap: _handleTap,
        child: ScaleTransition(
          scale: _scale,
          child: Icon(
            Icons.location_on,
            color: widget.color,
            size: 32,
          ),
        ),
      ),
    );
  }
}
