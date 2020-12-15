import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

class MapOfEurope extends StatefulWidget {
  final MapProvider provider;
  final MapController controller;
  final void Function() onTap, onLongPress;

  const MapOfEurope({
    @required this.controller,
    this.provider,
    this.onTap,
    this.onLongPress,
  });

  @override
  State<StatefulWidget> createState() => _MapState();
}

class _MapState extends State<MapOfEurope> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: _build);

  Widget _build(BuildContext context, BoxConstraints constraints) {
    final controller = widget.controller;
    final tileSize = controller.tileSize;
    final size = constraints.biggest;
    final projection = controller._projection;

    final screenWidth = size.width;
    final screenHeight = size.height;

    final centerX = screenWidth / 2;
    final centerY = screenHeight / 2;

    final scale = pow(2, controller._zoom);

    final norm = projection.fromLngLatToTileIndex(controller._location);
    final ttl = TileIndex(norm.x * tileSize * scale, norm.y * tileSize * scale);

    final fixedZoom = (controller._zoom + 0.0000001).toInt();
    final fixedPowZoom = pow(2, fixedZoom);

    final centerTileIndexX = (norm.x * fixedPowZoom).floor();
    final centerTileIndexY = (norm.y * fixedPowZoom).floor();

    final scaleValue = pow(2, controller._zoom % 1);
    final tileSizeScaled = tileSize * scaleValue;
    final numGrids = pow(2, controller._zoom).floor();

    final numTilesX = (screenWidth / tileSize / 2).ceil();
    final numTilesY = (screenHeight / tileSize / 2).ceil();

    final children = <Widget>[];

    for (int i = centerTileIndexX - numTilesX; i <= centerTileIndexX + numTilesX; i++) {
      for (int j = centerTileIndexY - numTilesY; j <= centerTileIndexY + numTilesY; j++) {
        if (i < 0 || i >= numGrids || j < 0 || j >= numGrids) {
          continue;
        }

        final ox = (i * tileSizeScaled) + centerX - ttl.x;
        final oy = (j * tileSizeScaled) + centerY - ttl.y;

        final tile = widget.provider.getTile(i, j, (controller._zoom + 0.0000001).floor());

        final child = Positioned(
          width: tileSizeScaled.ceilToDouble(),
          height: tileSizeScaled.ceilToDouble(),
          left: ox.floorToDouble(),
          top: oy.floorToDouble(),
          child: Container(
            color: Colors.grey,
            child: Image(
              image: tile,
              fit: BoxFit.fill,
            ),
          ),
        );

        children.add(child);
      }
    }

    final stack = Stack(children: children);

    final gesture = GestureDetector(
      onDoubleTap: _onDoubleTap,
      onTap: _onDoubleTap,
      onLongPress: _onLongPress,
      child: stack,
    );

    return gesture;
  }

  void _onLongPress() => widget.controller.zoom -= 0.5;
  void _onDoubleTap() => widget.controller.zoom += 0.5;
}

class MapController extends ChangeNotifier {
  LatLng _location;
  double _zoom;
  double tileSize;

  final _projection = const EPSG4326();

  MapController({
    @required LatLng location,
    double zoom = 5,
    this.tileSize = 256,
  }) {
    _location = location;
    _zoom = zoom;
  }

  LatLng get location => _location;

  set location(LatLng location) {
    _location = location;
    notifyListeners();
  }

  double get zoom => _zoom;

  set zoom(double zoom) {
    _zoom = zoom.clamp(3.5, 10.5).toDouble();
    notifyListeners();
  }
}

class MapProvider extends GoogleMapProvider {
  const MapProvider(this._locale);
  final String _locale;
  static MapController get controller => MapController(location: LatLng(49.18, 16.56));
  // Sorry, but no -- it's not my exact location, folks...
  @override
  ImageProvider getTile(int x, int y, int z) => NetworkImage(
      'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m2!1e0!2sh!3i420120484!3m1!2s$_locale!5e1105!12m1!1e68!2m2!1sset!2sRoadmap!4e0!5m0!1e0!23i8289918');
}
