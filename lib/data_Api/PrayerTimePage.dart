// import 'package:flutter/material.dart';
// class PrayerTimesPage extends StatelessWidget {
//   final Datum datum;
//
//   const PrayerTimesPage({Key? key, required this.datum}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Extract prayer times from the selected date
//     Timings timings = datum.timings; // Assuming date has timings property
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Prayer Times - ${datum.date.readable}'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text('Fajr: ${timings.fajr}'),
//           Text('Sunrise: ${timings.sunrise}'),
//           Text('Dhuhr: ${timings.dhuhr}'),
//           Text('Asr: ${timings.asr}'),
//           Text('Maghrib: ${timings.maghrib}'),
//           Text('Isha: ${timings.isha}'),
//           // Add more prayer times as needed
//         ],
//       ),
//     );
//   }
// }
