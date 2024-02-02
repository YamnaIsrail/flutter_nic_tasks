import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

part 'data_student.g.dart';

@HiveType(typeId: 0)
class DataStudent extends HiveObject{


  @HiveField(1)
  dynamic key;

  @HiveField(2)
  late String Std_name= "Yum";

  @HiveField(3)
  late int Std_roll= 2;


  @HiveField(4)
  late int Std_grade= 5;


  //@HiveField(5)
  //late List<DataStudentAttendence> dataAttendence; //Attendence list


}


@HiveType(typeId: 0)
class DataStudentAttendence extends HiveObject{

  @HiveField(1)
  late Uint8List date;

  @HiveField(2)
  DateTime time= DateTime.now();

}
