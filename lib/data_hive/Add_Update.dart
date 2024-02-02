import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/data_hive/Data_Box.dart';
import 'package:nic_flutter_assignments/data_hive/data_student.dart';
import 'package:nic_flutter_assignments/widgets/appbar.dart';

class AddUpdate extends StatefulWidget {
  DataStudent? dataStudent= DataStudent();
  // final DataStudent? dataStudent;
   AddUpdate({this.dataStudent});

  @override
  State<AddUpdate> createState() => _AddUpdateState();
}

class _AddUpdateState extends State<AddUpdate> {

    var nameController = TextEditingController();
    var RollnumController = TextEditingController();
    var GradeController = TextEditingController();

    @override
    void initState(){
      super.initState();

      if(widget.dataStudent != null){
        setState(() {
          nameController.text = widget.dataStudent!.Std_name;
          RollnumController.text = widget.dataStudent!.Std_roll.toString();
          GradeController.text = widget.dataStudent!.Std_grade.toString();
          //
          // RollnumController.text = int.parse(widget.dataStudent!.Std_roll.toString()) as String;
          // GradeController.text = int.parse(widget.dataStudent!.Std_grade.toString()) as String;

        });

      }

    }

    String name= "";

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: myappbar(title: '${widget.dataStudent== null ?  "ADD" : "Update"} Record'),

        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "${widget.dataStudent== null ? 'Enter name' : nameController.text}"
                ),
              ),

              TextFormField(
                controller: RollnumController,
                decoration: InputDecoration(
                    hintText: "Enter Roll"
                ),
              ),

              TextFormField(
                controller: GradeController,
                decoration: InputDecoration(
                    hintText: "Enter grade"
                ),
              ),


              ElevatedButton(onPressed:() {
                try {
                    DataStudent dataStudent = DataStudent()

                ..key = widget.dataStudent != null? widget.dataStudent!.key :DataBox.GetNewKey()
                      ..Std_name = nameController.text.toString()
                      ..Std_roll = int.parse(RollnumController.text)
                      ..Std_grade = int.parse(GradeController.text);
                    widget.dataStudent == null? DataBox.AddRecord(dataStudent): DataBox.UpdateRecord(dataStudent);
                   // DataBox.GetDataStudentList();

                  Navigator.pop(context);
                  } catch(ex){
                  print("Error ${ex.toString()}");
                }
                },
                  child: Text("${widget.dataStudent != null ? 'Update' : 'Add'} Record"))
            ],
          ),
        ),

      );
    }
  }
