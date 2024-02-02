import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/data_sqflite/Sql_Data.dart';
import 'package:nic_flutter_assignments/data_sqflite/sql_model.dart';
import 'package:nic_flutter_assignments/widgets/appbar.dart';
import 'package:nic_flutter_assignments/data_sqflite/Add_Update.dart';


class SqfliteDashboard extends StatefulWidget {
  const SqfliteDashboard({super.key});

  @override
  State<SqfliteDashboard> createState() => _SqfliteDashboardState();
}

class _SqfliteDashboardState extends State<SqfliteDashboard> {

  SQLHelper? sqlHelper;
  late Future<List<SqlModel>> sqlModelList;

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      super.initState();
      sqlHelper= SQLHelper();
      loadData();
    });
  }

  loadData() async{
    setState(() {
      sqlModelList = sqlHelper!.getItems();
    });
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
              setState(() {
                Navigator.push(context, MaterialPageRoute(
                    builder: (builder)=> AddUpdateSqflite()
                ));
               });
            },
            child: Icon(Icons.add,size: 50, )
        ),
      ),
      appBar: myappbar(title: "SQFlite Dashboard"),

      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: FutureBuilder(
                  future: sqlModelList,
                        builder: (context, AsyncSnapshot<List<SqlModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator()); // or some other loading indicator
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No data available.');
              } else {
                return ListView.builder(
                  //reverse: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return
                      InkWell(
                        onTap: () async{

                         await Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> AddUpdateSqflite(
                                sqlModel: snapshot.data![index], )));

                          setState(() {
                            sqlModelList= sqlHelper!.getItems();

                          });
                        },
                        child: Dismissible(
                          key: ValueKey<int>(snapshot.data![index].id!),
                          background: Container(
                            color: Color(0xffbd1a10),
                            child: Icon(Icons.delete, size: 50,),
                          ),
                          onDismissed: (DismissDirection direction){
                              setState(() {
                                sqlHelper!.delete(snapshot.data![index].id!);
                                sqlModelList= sqlHelper!.getItems();
                                snapshot.data!.remove(snapshot.data![index]);

                              });
                          },

                          child: Card(
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            title: Text(snapshot.data![index].title.toString()),
                            subtitle: Text(snapshot.data![index].age.toString()),
                            trailing: Text(snapshot.data![index].description.toString()),
                          ),
                                              ),
                        ),
                      );
                  },
                );
              }
            }

              ),
            )
          ],
        ),
      )
    );
  }
}
