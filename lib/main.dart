import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

List<Marker> _markers = <Marker>[];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovilSV',
      
      //home: MapSample(),
     home: Scaffold(
          appBar: AppBar(
            title: Text('Movil SV'),
             backgroundColor: Colors.amber,
            
          ),
          body: Center(
            child: MapSample(),
          ),
     )
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  
  @override
  Widget build(BuildContext context) {

    _markers.add(
      Marker(
      markerId: MarkerId('CalleArce'),
      position: LatLng(13.699966733131118, -89.19822007525062),
      infoWindow: InfoWindow(
      title: 'Calle Arce',
      snippet: 'Sucursal Calle Arce'
      )
     )
   );
    _markers.add(
      Marker(
      markerId: MarkerId('Salvador del mundo'),
      position: LatLng(13.701342225677037, -89.22352731558998),
      infoWindow: InfoWindow(
      title: 'Salvador del Mundo',
      snippet: 'Sucursal Centro Soyapango',
      )
     )
   );
     _markers.add(
      Marker(
      markerId: MarkerId('Centro Soyapango'),
      position: LatLng(13.690986543952157, -89.13842936441797),
      infoWindow: InfoWindow(
      title: 'Centro Soyapango',
      snippet: 'Sucursal Centro Soyapango',
      )
     )
   );
     _markers.add(
      Marker(
      markerId: MarkerId('San Jacinto'),
      position: LatLng(13.685977648287178, -89.18899351123237),
      infoWindow: InfoWindow(
      title: 'San Jacinto',
      snippet: 'Sucursal San Jacinto',
      )
     )
   );

    return new Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
        target: LatLng(13.693066214224148, -89.18859630891788),
        zoom: 11.5,
      ),
      mapType: MapType.normal,
      markers: Set<Marker>.of(_markers),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      ),
    );
  }


}