// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityEntityAdapter extends TypeAdapter<CityEntity> {
  @override
  final int typeId = 2;

  @override
  CityEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityEntity(
      country: fields[1] as String,
      countryCode: fields[2] as String,
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CityEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.countryCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
