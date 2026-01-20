import 'package:flutter/material.dart';
import '../models/location.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({
    super.key,
    required Location? location,
    required this.setLocation,
    required this.setLocationGps,
  }) : _location = location;

  final Location? _location;
  final TextEditingController _locationController = TextEditingController();
  final void Function(String) setLocation;
  final void Function() setLocationGps;

  void _setLocation() {
    setLocation(_locationController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: "Enter Location")),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16.0,
          children: [
            ElevatedButton(onPressed: _setLocation, child: Text("Set Location")),
            ElevatedButton(onPressed: setLocationGps, child: Text("Use GPS Location"))
          ],
        ),
        Text(_location != null
            ? "${_location.city}, ${_location.state} ${_location.zip}"
            : "No Location..."),
      ],
    );
  }
}
