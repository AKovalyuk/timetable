import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class MapModal extends StatefulWidget {
  MapModal({super.key});
  final Map<String, LatLng> map = {
    "Корпус 1":  LatLng(56.0042486, 92.7730307),
    "Корпус 2":  LatLng(56.0043575, 92.7734304),
    "Корпус 3":  LatLng(56.0046920, 92.7722720),
    "Корпус 4":  LatLng(56.0043192, 92.7703950),
    "Корпус 6":  LatLng(56.0182359, 92.8386021),
    "Корпус 8":  LatLng(55.9847979, 92.7548232),
    "Корпус 10": LatLng(56.0040918, 92.7701955),
    "Корпус 11": LatLng(56.0136972, 92.8716305),
    "Корпус 12": LatLng(55.9962327, 92.7948911),
    "Корпус 13": LatLng(55.9942450, 92.7935823),
    "Корпус 14": LatLng(55.9954167, 92.7981124),
    "Корпус 15": LatLng(55.9968339, 92.7970247),
    "Корпус 17": LatLng(55.9945039, 92.7975620),
    "Корпус 18": LatLng(55.9934405, 92.7926805),
    "Корпус 19": LatLng(56.0022447, 92.9350474),
    "Корпус 20": LatLng(56.0020688, 92.9324046),
    "Корпус 23": LatLng(56.0053865, 92.7661597),
    "Корпус 24": LatLng(56.0040186, 92.7656394),
    "Корпус 25": LatLng(56.0044777, 92.7642636),
  };

  @override
  State<MapModal> createState() => _MapModalState();
}

class _MapModalState extends State<MapModal> {
  @override
  Widget build(BuildContext buildContext) {
    List<Marker> markers = List.from(
        this.widget.map.entries.map((e) => Marker(
          point: e.value,
          width: 90,
          height: 30,
          builder: (context) => Container(
            child: Center(
              child: Text(
                e.key,
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.blue,
                    width: 3
                )
            ),
          ),
        )
      )
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        toolbarOpacity: 1,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(55.9955, 92.79360),
              zoom: 15,
            ),
            nonRotatedChildren: [
              AttributionWidget.defaultWidget(
                source: 'OpenStreetMap contributors',
                onSourceTapped: null,
              ),
            ],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
             ),
              MarkerLayer(
                markers: markers
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(buildContext);
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.grey)
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}