import 'package:flutter/material.dart';
import 'PrayerTimePage.dart';
import 'package:nic_flutter_assignments/PrayerApiAssignment/api_data.dart';

class DateSelectionPage extends StatefulWidget {
  @override
  _DateSelectionPageState createState() => _DateSelectionPageState();
}

class _DateSelectionPageState extends State<DateSelectionPage> {
  List<Date> dates = []; // Populate this list with your dates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Selection'),
      ),
      body: ListView.builder(
        itemCount: dates.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(dates[index].readable),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PrayerTimesPage(date: dates[index],),
              ),
            );
          },
        ),
      ),
    );
  }
}
