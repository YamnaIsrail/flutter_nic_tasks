// import 'package:flutter/material.dart';
// import 'PrayerTimePage.dart';
// import 'package:nic_flutter_assignments/data_PrayerApi/model/api_data.dart';
//
// class DateSelectionPage extends StatefulWidget {
//
//   DateSelectionPage({Key? key}) : super(key: key);
//
//   @override
//   _DateSelectionPageState createState() => _DateSelectionPageState();
// }
//
// class _DateSelectionPageState extends State<DateSelectionPage> {
//   List<Date> dates = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   void fetchData() async {
//
//     List<Date> fetchedDates = await getMockDates();
//    setState(() {
//       dates = fetchedDates;
//     });
//   }
//
//
//   List<Date> getMockDates() {
//     return [
//       Date(
//         readable: '2024-02-01',
//         timestamp: 'timestamp',
//         gregorian: Gregorian(
//           date: 'date',
//           format: 'format',
//           day: 'day',
//           weekday: GregorianWeekday(en: 'en'),
//           month: GregorianMonth(number: 1, en: 'en'),
//           year: 'year',
//           designation: Designation(abbreviated: 'abbreviated', expanded: 'expanded'),
//         ),
//         hijri: Hijri(
//           date: 'date',
//           format: 'format',
//           day: 'day',
//           weekday: HijriWeekday(en: 'en', ar: 'ar'),
//           month: HijriMonth(number: 1, en: 'en', ar: 'ar'),
//           year: 'year',
//           designation: Designation(abbreviated: 'abbreviated', expanded: 'expanded'),
//           holidays: ['holiday1', 'holiday2'],
//         ),
//       ),
//
//
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Date Selection', style: TextStyle(color: Colors.white),),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ListView.builder(
//           itemCount: dates.length,
//           itemBuilder: (context, index) => ListTile(
//             title: Text(dates[index].readable),
//
//             onTap: () {
//
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
