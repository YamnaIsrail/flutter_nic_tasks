// prayer_times_page.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/data_Api/PrayerTimeDetailsPage.dart';
import 'package:nic_flutter_assignments/data_Api/model/api_data.dart';
import 'package:nic_flutter_assignments/data_Api/service/api_services.dart';
import 'package:nic_flutter_assignments/widgets/appbar.dart';

class PrayerTimesPage extends StatefulWidget {
  @override
  _PrayerTimesPageState createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  List<Datum> prayerData = [];
  final PrayerTimesService _prayerTimesService = PrayerTimesService();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final PrayerTime prayerTime = await _prayerTimesService.getPrayerTimeData();

      setState(() {
        prayerData = prayerTime.data;
        print('Number of prayer data items: ${prayerData.length}');
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void onDateClick(Datum selectedDate) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrayerTimesDetailPage(selectedDate),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(
        title: 'Prayer Times Calendar',
      ),
      body: FutureBuilder(
        future: _prayerTimesService.getPrayerTimeData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is being fetched, show a loading indicator
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there's an error in fetching data, show an error message
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Data has been successfully fetched, display the ListView
            return ListView.builder(
              itemCount: prayerData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(prayerData[index].date.readable),
                  onTap: () => onDateClick(prayerData[index]),
                );
              },
            );
          }
        },
      ),
    );
  }}