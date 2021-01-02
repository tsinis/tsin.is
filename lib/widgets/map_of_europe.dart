import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:latlng/latlng.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:map/map.dart';

import '../generated/l10n.dart';

class MapOfEurope extends StatelessWidget {
  const MapOfEurope();

  static final MapController _controller = MapController(location: LatLng(49.18, 16.56), zoom: 5);
  @override
  Widget build(BuildContext context) => ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
        child: Map(
          controller: _controller,
          builder: (context, x, y, z) {
            final String locale = S.of(context).currentLocale;
            final String url =
                'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m2!1e0!2sh!3i420120484!3m1!2s$locale!5e1105!12m1!1e68!2m2!1sset!2sRoadmap!4e0!5m0!1e0!23i8289918';
            return Opacity(opacity: 0.28, child: CachedNetworkImage(imageUrl: url, fit: BoxFit.fill));
          },
        ),
      );
}
