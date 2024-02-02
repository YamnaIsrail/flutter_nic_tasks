  import 'package:flutter/material.dart';
  import 'package:hive_flutter/adapters.dart';
  import 'package:nic_flutter_assignments/data_hive/Add_Update.dart';
  import 'package:nic_flutter_assignments/data_hive/Data_Box.dart';
  import 'package:nic_flutter_assignments/data_hive/Delete.dart';
import 'package:nic_flutter_assignments/data_hive/Delete.dart';
  import 'package:nic_flutter_assignments/data_hive/data_student.dart';
  import 'package:nic_flutter_assignments/widgets/appbar.dart';
  import 'package:hive/hive.dart';

  class hiveDashboard extends StatefulWidget {
    const hiveDashboard({Key? key});

    @override
    State<hiveDashboard> createState() => _hiveDashboardState();
  }

  class _hiveDashboardState extends State<hiveDashboard> {
    Box<DataStudent>? boxStudent; // nullable Box<DataStudent>

    @override
    void initState() {
      super.initState();
      getDataBox();
    }

    Future<void> getDataBox() async {
      boxStudent = await DataBox.getHiveFunction();
      //setState(() {});
    }

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
                MaterialPageRoute(builder: (context) => AddUpdate()),
              );
            },
            child: Icon(Icons.add, size: 50),
          ),
        ),
        appBar: myappbar(title: "Hive Dashboard"),
        body: boxStudent == null
            ? Center(child: CircularProgressIndicator())
            : Container(
          child: ValueListenableBuilder<Box<DataStudent>>(
            valueListenable: boxStudent!.listenable(),
            builder: (context, box_student, _) {
              List<DataStudent> std_list = box_student?.values.toList()?.cast<DataStudent>() ?? [];

              return ListView.builder(
                itemCount: std_list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:  IconButton( onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => AddUpdate(dataStudent: std_list[index]),
                        ),
                      );
                    }, icon: Icon(Icons.edit, size: 30,),),

                    trailing: IconButton( onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => DeleteRecord(dataStudent: std_list[index]),
                          ),
                        );
                      });
                    }, icon: Icon(Icons.delete, size: 30,),),

                    title: Text("Name: ${std_list[index].Std_name}, "),

                    subtitle: Text(" Roll: ${std_list[index].Std_roll},\t  Grade: ${std_list[index].Std_grade}"),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => AddUpdate(dataStudent: std_list[index]),
                        ),
                      );
                    },
                  );
                },
              );

            },
          ),
        ),
      );
    }
  }
