import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/data_sqflite/Sql_Data.dart';
import 'package:nic_flutter_assignments/data_sqflite/screen_dashboard_sqflite.dart';
import 'package:nic_flutter_assignments/data_sqflite/sql_model.dart';
import 'package:nic_flutter_assignments/widgets/appbar.dart';

class AddUpdateSqflite extends StatefulWidget {
  final SqlModel? sqlModel;

  AddUpdateSqflite({this.sqlModel});

  @override
  State<AddUpdateSqflite> createState() => _AddUpdateSqfliteState();
}

class _AddUpdateSqfliteState extends State<AddUpdateSqflite> {
  var TitleController = TextEditingController();
  var AgeController = TextEditingController();
  var DescriptionController = TextEditingController();
  late Future<List<SqlModel>> sqlModelList;

  @override
  void initState() {
    super.initState();

    TitleController.text = widget.sqlModel?.title ?? '';
    AgeController.text = widget.sqlModel?.age?.toString() ?? '';
    DescriptionController.text = widget.sqlModel?.description ?? '';

    loadData();
  }
  SQLHelper sqlHelper = SQLHelper();
  loadData() async {
    sqlModelList = sqlHelper.getItems(); // Use the SQLHelper instance, not widget.sqlModel

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: myappbar(title: '${widget.sqlModel == null ? "ADD" : "Update"} Record'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              TextFormField(
                key: ValueKey('TitleField'), // Use a Key to maintain the state
                controller: TitleController,
                decoration: InputDecoration(
                  hintText: "${widget.sqlModel == null ? 'Enter Title' : TitleController.text}",
                ),
              ),
              TextFormField(
                controller: AgeController,
                decoration: InputDecoration(
                  hintText: "${widget.sqlModel == null ? 'Enter Grade' : AgeController.text}",
                ),
              ),
              TextFormField(
                controller: DescriptionController,
                decoration: InputDecoration(
                  hintText: "${widget.sqlModel == null ? 'Enter Description' : DescriptionController.text}",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.sqlModel == null
                      ?
                  sqlHelper.insertItems(SqlModel(
                    id: widget.sqlModel?.id,
                    title: TitleController.text,
                    age: int.parse(AgeController.text),
                    description: DescriptionController.text,
                  ))
                      :
                  sqlHelper.update(SqlModel(
                    id: widget.sqlModel?.id,
                    title: TitleController.text,
                    age: int.parse(AgeController.text),
                    description: DescriptionController.text,
                  ));
                  setState(() {
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (builder)=> SqfliteDashboard()));
                    sqlModelList = sqlHelper.getItems();
                  });
                },
                child: Text('${widget.sqlModel == null ? "ADD" : "Update"} Record'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
