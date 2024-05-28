import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapScreen extends StatefulWidget
{
  static const String idScreen = "MapScreen";
 final marker = Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(9.669111, 80.014007),
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );
    Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  _MapScreenState createState() => _MapScreenState();
}

  class _MapScreenState extends State<MapScreen> {
    Completer<GoogleMapController> _controllerGoogleMap = Completer();
    GoogleMapController newGoogleMapController;

    static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text ("Map Screen"),
        ),
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller)
              {
                  _controllerGoogleMap.complete(controller);
                  newGoogleMapController = controller;
              }
            )
          ],
        )
      );
    }
  }