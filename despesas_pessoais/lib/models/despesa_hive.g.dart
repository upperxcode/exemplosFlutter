// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despesa_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DespesaAdapter extends TypeAdapter<Despesa> {
  @override
  final int typeId = 0;

  @override
  Despesa read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Despesa(
      fields[0] as int,
      fields[1] as String,
      fields[2] as double,
      fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Despesa obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.value)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DespesaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
