import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/data_hive/Delete.dart';
import 'package:nic_flutter_assignments/data_hive/data_student.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


class DataBox{

  static const String DataStd= "std";

  static Future<Box<DataStudent>> getHiveFunction() async{
    await Hive.initFlutter();

   if(!Hive.isAdapterRegistered(0)){
     Hive.registerAdapter(DataStudentAdapter());
   }

   if(!Hive.isBoxOpen(DataStd)){
     return await Hive.openBox<DataStudent>(DataStd);
   } else{
     return Hive.box<DataStudent>(DataStd);
   }
  }


  // =============================Getting Hive Data Box=====================
 static Future<Box<DataStudent>> DataBoxStudent() async{
    return Hive.box(DataStd);
  }

// =============================Getting Data Box for CRUD Operations =====================


  static Future<List<DataStudent>> GetDataStudentList() async{
    List<DataStudent> list= [];
    Box box_student = await DataBoxStudent();
    list = box_student.values.toList().cast<DataStudent>();
    print("Data retrieved: $list");

    return list;
  }

  static AddRecord(DataStudent dataStudent) async{
   try {
      Box box_std = await DataBoxStudent();

      List<DataStudent> list_records =
          box_std.values.toList().cast<DataStudent>();
      List<dynamic> list_keys = box_std.keys.toList().cast<dynamic>();

      box_std
          .add(dataStudent); // auto key generate kr k value assign kr leta ha
    } catch(e){
     print("Error in addition: ${e.toString()}");
   }
  }

  static UpdateRecord(DataStudent dataStudent) async{
    try {
      Box box_std = await DataBoxStudent();

      List<DataStudent> list_records = box_std.values.toList().cast<DataStudent>();
      //List<dynamic> list_keys = box_std.keys.toList().cast<dynamic>();

      box_std.put(dataStudent.key,dataStudent);
      GetDataStudentList();

    } catch(e){
      print("Error in addition: ${e.toString()}");
    }
  }

  static Future<void> deleteRecord(dynamic key) async {
    try {
      Box<DataStudent> box_std = await DataBoxStudent();
      if (box_std != null) {
        await box_std.delete(key);
        print("Record deleted successfully");
      } else {
        print("Box is null, unable to delete record");
      }
    } catch (e) {
      print("Error in deletion: ${e.toString()}");
    }
  }



  static DateTime GetNewKey() {
    return DateTime.now();
  }

}