import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/data_Api/model/api_data.dart';
import 'package:nic_flutter_assignments/data_Api/model/api_data.dart';
import 'package:nic_flutter_assignments/widgets/appbar.dart';


class PrayerTimesDetailPage extends StatelessWidget {
  final Datum selectedDate;

  PrayerTimesDetailPage(this.selectedDate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(
        title: 'Prayer Times for ${selectedDate.date.readable}',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fajr: ${selectedDate.timings.fajr}'),
            Text('Sunrise: ${selectedDate.timings.sunrise}'),
            Text('Dhuhr: ${selectedDate.timings.dhuhr}'),
            Text('Asr: ${selectedDate.timings.asr}'),
            Text('Sunset: ${selectedDate.timings.sunset}'),
            Text('Maghrib: ${selectedDate.timings.maghrib}'),
            Text('Isha: ${selectedDate.timings.isha}'),
            Text('Imsak: ${selectedDate.timings.imsak}'),
            Text('Midnight: ${selectedDate.timings.midnight}'),
            // Add more prayer times if needed
          ],
        ),
      ),
    );
  }
}
