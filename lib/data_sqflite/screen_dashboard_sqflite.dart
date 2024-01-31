import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/widgets/appbar.dart';
import 'package:nic_flutter_assignments/data_sqflite/Add_Update().dart';
class SqfliteDashboard extends StatefulWidget {
  const SqfliteDashboard({super.key});

  @override
  State<SqfliteDashboard> createState() => _SqfliteDashboardState();
}

class _SqfliteDashboardState extends State<SqfliteDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> AddUpdate())
              );
            },
            child: Icon(Icons.add,size: 50, )
        ),
      ),
      appBar: myappbar(title: "SQFlite Dashboard"),

      body: Container(
        child: ListView(
          children: [
            ListTile(title: Text("Name"),),

          ],
        ),
        //color: Colors.deepPurpleAccent[100],
      )
    );
  }
}
