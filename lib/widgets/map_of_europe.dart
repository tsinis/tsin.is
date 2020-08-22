import 'package:flutter/rendering.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';

class MapOfEurope extends GoogleMapProvider {
  const MapOfEurope(this._locale);
  final String _locale;

  static MapController get controller => MapController(location: LatLng(49.18, 16.56), zoom: 5);
  @override
  ImageProvider getTile(int x, int y, int z) => NetworkImage(
      'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m2!1e0!2sh!3i420120484!3m1!2s$_locale!5e1105!12m1!1e68!2m2!1sset!2sRoadmap!4e0!5m0!1e0!23i8289918');
}
