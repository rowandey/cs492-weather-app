import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:path_provider/path_provider.dart';


class ThemeProvider extends ChangeNotifier {
  bool darkMode = false;

  void loadDarkModePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool("darkMode") != null) {
      setDarkMode(prefs.getBool("darkMode")!);
    }
  }

  void setDarkMode(bool mode) async {
    darkMode = mode;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("darkMode", mode);

  }
}
