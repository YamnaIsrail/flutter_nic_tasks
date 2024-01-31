import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/PrayerApiAssignment/api_screen_date_selection.dart';


class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,),

      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
              title: Text("Prayer Time API "),
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DateSelectionPage()));
              },),
          ListTile(title: Text("SQFLite Database"),),
          ListTile(title: Text("Hive Database"),),
          ListTile(title: Text(""),),

        ],

      ),
    );
  }
}
