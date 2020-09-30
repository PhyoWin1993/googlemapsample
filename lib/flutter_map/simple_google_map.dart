import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowSimpleMap extends StatefulWidget {
  @override
  _ShowSimpleMapState createState() => _ShowSimpleMapState();
}

class _ShowSimpleMapState extends State<ShowSimpleMap> {
  GoogleMapController mapController;
  static LatLng _center = const LatLng(45.521563, -122.677433);
  static LatLng _nextPos = const LatLng(44.3333, -121.67753);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Map"),
        ),
        body: GoogleMap(
          markers: {polanMarker, nextMarker},
          mapType: MapType.satellite,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
        )
        //
        floatingActionButton: FloatingActionButton.extended(onPressed: _goToIntal,
         label: Text("Intal Corp"),
         icon: Icon(Icons.place)
         ,),
        
        
        );
  }

  static final CameraPosition intalPos = CameraPosition(target: LatLng(45.521563, -122.677433),
  zoom: 14.5,
  bearing: 134.45,tilt: 23.55);
  Future<void> _goToIntal () async {
    final GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(intalPos));
  }

  Marker polanMarker = Marker(
      markerId: MarkerId("Poland"),
      position: _center,
      infoWindow:
          InfoWindow(title: "Plaonad", snippet: "This is The grade pagoda."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta));

  Marker nextMarker = Marker(
      markerId: MarkerId("Poland"),
      position: _nextPos,
      infoWindow:
          InfoWindow(title: "Ploonad", snippet: "This is The grade swe."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta));
}
