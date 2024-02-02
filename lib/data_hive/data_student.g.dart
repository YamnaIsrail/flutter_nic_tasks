// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_student.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataStudentAdapter extends TypeAdapter<DataStudent> {
  @override
  final int typeId = 0;

  @override
  DataStudent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataStudent()
      ..key = fields[1] as dynamic
      ..Std_name = fields[2] as String
      ..Std_roll = fields[3] as int
      ..Std_grade = fields[4] as int;
  }

  @override
  void write(BinaryWriter writer, DataStudent obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.key)
      ..writeByte(2)
      ..write(obj.Std_name)
      ..writeByte(3)
      ..write(obj.Std_roll)
      ..writeByte(4)
      ..write(obj.Std_grade);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataStudentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataStudentAttendenceAdapter extends TypeAdapter<DataStudentAttendence> {
  @override
  final int typeId = 0;

  @override
  DataStudentAttendence read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataStudentAttendence()
      ..date = fields[1] as Uint8List
      ..time = fields[2] as DateTime;
  }

  @override
  void write(BinaryWriter writer, DataStudentAttendence obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataStudentAttendenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
