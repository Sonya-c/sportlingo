import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loggy/loggy.dart';
import 'package:sportlingo/data/model/user_location.dart';

class SummaryMap extends StatefulWidget {
  final markers;
  final UserLocation userLocation;

  const SummaryMap(
      {Key? key, required this.markers, required this.userLocation})
      : super(key: key);

  @override
  _SummaryMapState createState() => _SummaryMapState();
}

class _SummaryMapState extends State<SummaryMap> {
  late GoogleMapController googleMapController;

  LatLngBounds _bounds(Set<Marker> markers) {
    return _createBounds(markers.map((m) => m.position).toList());
  }

  LatLngBounds _createBounds(List<LatLng> positions) {
    final southwestLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value < element ? value : element); // smallest
    final southwestLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value < element ? value : element);
    final northeastLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value > element ? value : element); // biggest
    final northeastLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value > element ? value : element);
    return LatLngBounds(
        southwest: LatLng(southwestLat, southwestLon),
        northeast: LatLng(northeastLat, northeastLon));
  }

  Set<Polyline> _createPolylines(Set<Marker> markers) {
    // Create a Polyline connecting the markers
    List<LatLng> polylineCoordinates =
        markers.map((marker) => marker.position).toList();

    return <Polyline>{
      Polyline(
        polylineId: const PolylineId('route'),
        color: Colors.blue,
        width: 3,
        points: polylineCoordinates,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    logInfo("MARKERS", widget.markers.toString());

    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        googleMapController = controller;
        if (widget.markers.isNotEmpty) {
          googleMapController.animateCamera(CameraUpdate.newLatLngBounds(
              _bounds(Set<Marker>.of(widget.markers as Iterable<Marker>)), 50));
        } else {
          if (widget.userLocation.latitude != 0) {
            googleMapController.moveCamera(CameraUpdate.newLatLng(LatLng(
                widget.userLocation.latitude, widget.userLocation.longitude)));
          }
        }
      },
      mapType: MapType.normal,
      // markers: Set<Marker>.of(widget.markers as Iterable<Marker>),
      polylines:
          _createPolylines(Set<Marker>.of(widget.markers as Iterable<Marker>)),
      myLocationEnabled: false,
      initialCameraPosition: const CameraPosition(
        target: LatLng(11.0227767, -74.81611),
        zoom: 17.0,
      ),
    );
  }
}
