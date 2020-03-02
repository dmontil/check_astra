import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final LatLng position;
  MapPage({Key key, @required this.position}) : super (key:key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController _mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Moto : XXXXXXX"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(41.390205,2.154007),
          zoom: 10
        ),
        markers: _createMarkets(),
        onMapCreated: _onMapCreated,

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.zoom_out_map),
        onPressed: _centerView,
      ),
    );
  }

  Set<Marker> _createMarkets() {
    var tmp = Set<Marker>();

    tmp.add(Marker(
      position: widget.position,
      markerId: MarkerId("one"),
      infoWindow: InfoWindow(title: "Moto")
    ));
    return tmp;
  }

  void _centerView()  async {
   await _mapController.getVisibleRegion();
   var cameraUpdate = CameraUpdate.newLatLngZoom(widget.position, 15);

   _mapController.animateCamera(cameraUpdate);
  }

  void _onMapCreated(GoogleMapController controller) {
     _mapController = controller;
    // _centerView();
  }
}
