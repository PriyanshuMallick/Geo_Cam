import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geo_cam/settings/map_card_settings.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

enum GeoLocationDetailMode {
  less,
  more,
  latlong,
}

class LocationStream extends StatefulWidget {
  final GeoLocationDetailMode mode;
  final TextStyle style;
  const LocationStream({
    super.key,
    required this.mode,
    required this.style,
  });

  @override
  State<LocationStream> createState() => _LocationStreamState();
}

class _LocationStreamState extends State<LocationStream> {
  String? _currentAddressLong;
  String? _currentAddressShort;
  Position? _currentPosition;

  final StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    ),
  ).listen((Position? position) {
    // _updatePosition(position);
  });

  void _updatePosition(Position? position) {
    print(position == null
        ? 'Unknown'
        : 'Position: ${position.latitude.toString()}, ${position.longitude.toString()}\n\n');
    setState(() {
      _currentPosition = position;
    });
  }
// Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

//   @override
//   Widget build(BuildContext context) {
//     if (widget.mode == GeoLocationDetailMode.less) return getLessDetailedLocation(widget.style);

//     if (widget.mode == GeoLocationDetailMode.more) return getMoreDetailedLocation(widget.style);

//     if (widget.mode == GeoLocationDetailMode.latlong) return getLatLong(widget.style);

//     return Container();
//   }

  @override
  Widget build(BuildContext context) {
    _getCurrentPosition();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (MapCardSettings.isAddressShort) getLessDetailedLocation(widget.style),
        if (MapCardSettings.isAddressLong) getMoreDetailedLocation(widget.style),
        if (MapCardSettings.isLongLat)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getLat(widget.style),
              getLong(widget.style),
            ],
          ),
      ],
    );
  }

  Widget getLessDetailedLocation(TextStyle style) {
    return Text(
      _currentAddressShort ?? 'Unknown',
      style: style,
    );
  }

  Widget getMoreDetailedLocation(TextStyle style) {
    return Text(
      _currentAddressLong ?? 'Unknown',
      style: style,
    );
  }

  Widget getLat(TextStyle style) {
    return Text(
      'Lat: ${_currentPosition?.latitude ?? 'Unknown'}',
      style: style,
    );
  }

  Widget getLong(TextStyle style) {
    return Text(
      'Long: ${_currentPosition?.longitude ?? 'Unknown'}',
      style: style,
    );
  }

  Future<void> _getCurrentPosition() async {
    // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final bool hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;

    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await _getCurrentPosition();
    await placemarkFromCoordinates(_currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddressShort = '${place.name}, ${place.country}';
        _currentAddressLong =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  //? ----------------------------------- Handling Location Permission -----------------------------------
  Future<bool> _handleLocationPermission() async {
    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      Fluttertoast.showToast(msg: 'Location services are disabled.\nPlease enable the services');
      return false;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      Fluttertoast.showToast(msg: 'Location permissions are permanently denied,\nEnable it from your phone settings');
      return false;
    }

    return true;
  }
}
