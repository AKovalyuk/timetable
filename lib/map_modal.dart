import 'package:flutter/material.dart';

class MapModal extends StatefulWidget {
  const MapModal({super.key});

  @override
  State<MapModal> createState() => _MapModalState();
}

class _MapModalState extends State<MapModal> {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        toolbarOpacity: 1,
      ),
      body: Stack(
        children: [
          SizedBox.expand(
              child: Image.asset('assets/images/map.png', fit: BoxFit.fitHeight),
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