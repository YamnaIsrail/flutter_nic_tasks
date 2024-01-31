import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nic_flutter_assignments/data_Api/model/api_data.dart';

class PrayerTimesService {
    String url_api= 'http://api.aladhan.com/v1/timings/17-07-2007?latitude=51.508515&longitude=-0.1254872&method=2';
    // final Uri url = Uri.parse(url_api);
    // final response = await http.get(url);

    Future<PrayerTime> getPrayerTimeData() async {
      try {
        final response = await http.get(Uri.parse(url_api));
        if (response.statusCode == 200) {
          return PrayerTime.fromMap(json.decode(response.body));
        } else {
          throw Exception("Failed to load data");
        }
      } catch (e) {
        throw Exception("Error: $e");
      }
    }
}
