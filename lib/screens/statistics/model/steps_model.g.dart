// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steps_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StepsModelAdapter extends TypeAdapter<StepsModel> {
  @override
  final int typeId = 0;

  @override
  StepsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StepsModel(
      step: fields[0] as int,
      date: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StepsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.step)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
