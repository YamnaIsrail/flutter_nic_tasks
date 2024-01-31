import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/widgets/appbar.dart';
import 'package:nic_flutter_assignments/data_Api/model/api_data.dart';
import 'package:nic_flutter_assignments/data_Api/service/api_services.dart';

class ApiDashboard extends StatefulWidget {
  @override
  _ApiDashboardState createState() => _ApiDashboardState();
}

class _ApiDashboardState extends State<ApiDashboard> {
  final PrayerTimesService _prayerTimeService = PrayerTimesService();
  late Future<PrayerTime> _prayerTimeData;

  @override
  void initState() {
    super.initState();
    _prayerTimeData = _prayerTimeService.getPrayerTimeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(
        title: 'Prayer Times',
      ),
      body: FutureBuilder<PrayerTime>(
        future: _prayerTimeData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Extract date and time information
            String date = snapshot.data!.data.date.readable;
            String fajrTime = snapshot.data!.data.timings.fajr;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Date: $date'),
                  Text('Fajr Time: $fajrTime'),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // By default, show a loading spinner
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
