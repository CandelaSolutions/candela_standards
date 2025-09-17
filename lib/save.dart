import 'package:shared_preferences/shared_preferences.dart';

void saveData(theme) async {
  // Load and obtain the shared preferences for this app.
  final prefs = await SharedPreferences.getInstance();

  // Save the counter value to persistent storage under the 'counter' key.
  await prefs.setInt('theme', theme);
}

Future<int> loadData() async {
  // Load and obtain the shared preferences for this app.
  final prefs = await SharedPreferences.getInstance();

  // Retrieve the counter value from persistent storage under the 'counter' key.
  int? theme = prefs.getInt('theme');
  return theme ?? 0; // Return the loaded theme or default to 0 if not found.
}
