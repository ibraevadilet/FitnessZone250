// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caloriy_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CaloryModelAdapter extends TypeAdapter<CaloryModel> {
  @override
  final int typeId = 1;

  @override
  CaloryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CaloryModel(
      calory: fields[0] as int,
      date: fields[1] as String,
      count: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CaloryModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.calory)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CaloryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
