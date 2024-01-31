import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/PrayerApiAssignment/api_data.dart';

class PrayerTimesPage extends StatelessWidget {
  final Date date;
  final Datum? datum;

  const PrayerTimesPage({Key? key, required this.date,  this.datum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract prayer times from the selected date
    Timings timings = datum!.timings;

    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times - ${date.readable}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Fajr: ${timings.fajr}'),
          Text('Sunrise: ${timings.sunrise}'),
          Text('Dhuhr: ${timings.dhuhr}'),
          Text('Asr: ${timings.asr}'),
          Text('Maghrib: ${timings.maghrib}'),
          Text('Isha: ${timings.isha}'),
          // Add more prayer times as needed
        ],
      ),
    );
  }
}
