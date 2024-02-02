import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/data_Api/PrayerTimePage.dart';
import 'package:nic_flutter_assignments/widgets/appbar.dart';
import 'package:nic_flutter_assignments/data_hive/screen_dashboard_hive.dart';
import 'package:nic_flutter_assignments/data_Api/screen_dashboard_api.dart';
import 'package:nic_flutter_assignments/data_sqflite/screen_dashboard_sqflite.dart';


class ScreenDashboard extends StatefulWidget {

  ScreenDashboard({Key? key}) : super(key: key);

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  @override
  Widget build(BuildContext context) {
    return
      // SafeArea(
      // child:
        Scaffold(
        appBar: myappbar(title: "Assignments"),
      
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
              child: ListTile(
                  title: Text("Prayer Time API "),
                 // trailing: Container(color: Colors.white, child: Text("01")),
                  leading: Icon(Icons.timer_outlined),
                  tileColor: Colors.deepPurpleAccent[100],
      
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PrayerTimesPage()));
                  },),
            ),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
              child: ListTile(
                title: Text("SQFLite Database "),
                leading: Icon(Icons.dataset_linked_sharp),
                tileColor: Colors.deepPurpleAccent[100],
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SqfliteDashboard(),));
                },),
            ),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
              child: ListTile(
                title: Text("Hive Database"),
                leading: Icon(Icons.data_usage_outlined),
                tileColor: Colors.deepPurpleAccent[100],
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => hiveDashboard(),));
                },),
            ),
      
      
      
      
          ],
      
        ),
     // ),
    );
  }
}
