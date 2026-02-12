import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

import 'package:weatherapp/models/location.dart';


class LocationProvider extends ChangeNotifier {
  Location? location;

  Map<String, Location> savedLocations = {};

  void loadSavedLocations() async {
    final directory = await getApplicationDocumentsDirectory();

    final path = File('${directory.path}/savedLocations.json');

    if (await path.exists()) {
      final jsonString = await path.readAsString();
      final jsonData = jsonDecode(jsonString);

      for (int i = 0; i < jsonData["savedLocations"].length; i++) {
        Map<String, dynamic> location = jsonData["savedLocations"][i];
        savedLocations[location["zip"]] = Location.fromJson(location);
      }
    }

    // if (location == null && savedLocations.values.isNotEmpty){
    //   location = savedLocations.values.first;
    // }

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (location == null && savedLocations.values.isNotEmpty && prefs.getString("zip") != null) {
      String? zip = prefs.getString("zip");
      if (zip != null) {
        location = savedLocations[zip];
      }
    }

    notifyListeners();
  }

  void deleteLocation(String zip){
    savedLocations.remove(zip);
    storeSavedLocations();
    notifyListeners();
  }

  void storeSavedLocations() async {
    final directory = await getApplicationDocumentsDirectory();

    final path = File('${directory.path}/savedLocations.json');

    Map<String, dynamic> outputJson = {};

    outputJson["savedLocations"] = savedLocations.values
        .toList()
        .map((location) => location.toJson())
        .toList();

    String outputString = jsonEncode(outputJson);

    await path.writeAsString(outputString);

    saveZipToPrefs();    
  }

  void setLocationFromGps() async {
    location = await getLocationFromGps();

    if (location != null && !savedLocations.containsKey(location!.zip)) {
      savedLocations[location!.zip] = location!;
    }
    storeSavedLocations();
    notifyListeners();
  }

  void setLocationFromString(String? locationString) async {
    if (locationString != null && locationString.trim().isNotEmpty) {
      location = await getLocationFromString(locationString);
    } else {
      location = null;
    }

    if (location != null && !savedLocations.containsKey(location!.zip)) {
      savedLocations[location!.zip] = location!;
    }
    storeSavedLocations();
    notifyListeners();
  }

  void setLocation(Location loc){
    location = loc;
    saveZipToPrefs();
    notifyListeners();
  }

  void saveZipToPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (location != null) {
      prefs.setString("zip", location!.zip);
    }
    else {
      prefs.remove(location!.zip);
    }
  }
}
