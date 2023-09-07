import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeTourHelper {
  static Future<bool> getTourCompleted() async {
    SharedPreferences isCompleted = await SharedPreferences.getInstance();
    return isCompleted.getBool('tour_completed') ?? false;
  }

  static Future<void> setTourCompleted() async {
    SharedPreferences isCompleted = await SharedPreferences.getInstance();
    await isCompleted.setBool('tour_completed', true);
  }
}
