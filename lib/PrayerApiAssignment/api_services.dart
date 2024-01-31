import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/PrayerApiAssignment/api_data.dart';

class PrayerTimesService {
  static Future<PrayerTimes> getPrayerTimes() async {

    final Uri url = Uri.parse(
        'http://api.aladhan.com/v1/calendar/2017/4?latitude=51.508515&longitude=-0.1254872&method=2');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return prayerTimesFromMap(response.body);
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}
