import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/data_hive/Data_Box.dart';
import 'package:nic_flutter_assignments/data_hive/data_student.dart';
import 'package:nic_flutter_assignments/widgets/appbar.dart';

class DeleteRecord extends StatefulWidget {
  final DataStudent? dataStudent;

  DeleteRecord({this.dataStudent});

  @override
  State<DeleteRecord> createState() => _DeleteRecordState();
}

class _DeleteRecordState extends State<DeleteRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(title: widget.dataStudent == null ? "Empty" : "Delete Record"),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            if (widget.dataStudent != null) {

              await DataBox.deleteRecord(widget.dataStudent!.key);
              Navigator.pop(context); // Navigate back after deletion
            }
          },
          child: Text("Delete Record"),
        ),
      ),
    );
  }
}
