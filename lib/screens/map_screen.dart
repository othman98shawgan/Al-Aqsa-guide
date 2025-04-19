import 'package:flutter/material.dart';
import 'dart:ui';
import '../models/landmark.dart';
import 'landmark_detail_screen.dart';
import '../widgets/landmark_dialog.dart';
import '../data/landmarks_data.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  final List<Landmark> allLandmarks = landmarkData
      .map((data) => Landmark(
            id: data['id'],
            name: data['name'],
            shortDescription: data['shortDescription'],
            longDescription: data['longDescription'],
            imagePaths: data['imagePaths'],
            top: data['top'].toDouble(),
            left: data['left'].toDouble(),
            type: data['type'],
          ))
      .toList();

  final Map<String, bool> filters = {
    'Mosque': true,
    'Dome': true,
    'Gate': true,
    'Building': true,
  };

  bool showFilterOptions = false;
  late TransformationController _transformationController;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void toggleFilter(String type) {
    setState(() {
      filters[type] = !(filters[type] ?? true);
    });
  }

  List<Landmark> get filteredLandmarks => allLandmarks.where((lm) => filters[lm.type] == true).toList();

  void _openLandmarkDialog(BuildContext context, Landmark landmark) async {
    final result = await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.4),
        pageBuilder: (_, __, ___) => GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: GestureDetector(
              onTap: () {}, // absorb tap
              child: Center(child: LandmarkDialog(landmark: landmark)),
            ),
          ),
        ),
      ),
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

  Future<void> _handleLandmarkTap(BuildContext context, Landmark landmark, double x, double y) async {
    final matrix = Matrix4.identity();
    final zoom = 2.5;
    final size = MediaQuery.of(context).size;
    final dx = -(x * zoom - size.width / 2);
    final dy = -(y * zoom - size.height / 2);

    matrix.translate(dx, dy);
    matrix.scale(zoom);

    await _animateZoom(matrix);
    await Future.delayed(const Duration(milliseconds: 150));

    _openLandmarkDialog(context, landmark);
  }

  Future<void> _animateZoom(Matrix4 targetMatrix) async {
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    final animation = Matrix4Tween(
      begin: _transformationController.value,
      end: targetMatrix,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.addListener(() {
      _transformationController.value = animation.value;
    });

    await controller.forward();
    controller.dispose();
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
    const double mapWidth = 566;
    const double mapHeight = 800;

    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (showFilterOptions)
            ...filters.keys.map((type) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                        ),
                        child: Text(
                          type,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      FloatingActionButton.small(
                        heroTag: 'filter_$type',
                        backgroundColor: filters[type]! ? _getColorByType(type) : Colors.grey,
                        onPressed: () => toggleFilter(type),
                        tooltip: type,
                        child: Icon(
                          filters[type]! ? Icons.check : Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
          FloatingActionButton(
            heroTag: 'main_filter_toggle',
            onPressed: () => setState(() => showFilterOptions = !showFilterOptions),
            child: Icon(showFilterOptions ? Icons.close : Icons.filter_list),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return InteractiveViewer(
            transformationController: _transformationController,
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
                ...filteredLandmarks.map((lm) {
                  double x = (lm.left / mapWidth) * constraints.maxWidth;
                  double y = (lm.top / mapHeight) * constraints.maxHeight;

                  return AnimatedMarker(
                    top: y,
                    left: x,
                    color: _getColorByType(lm.type ?? ''),
                    onTap: () => _handleLandmarkTap(context, lm, x, y),
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
