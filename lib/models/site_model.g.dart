// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SiteModelAdapter extends TypeAdapter<SiteModel> {
  @override
  final int typeId = 1;

  @override
  SiteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SiteModel(
      name: fields[0] as String,
      link: fields[1] as String,
      image: fields[2] as String,
      language: fields[3] as Language,
      description: fields[4] as String,
      bgColor: fields[5] as Color,
      fgColor: fields[6] as Color,
    );
  }

  @override
  void write(BinaryWriter writer, SiteModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.link)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.language)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.bgColor)
      ..writeByte(6)
      ..write(obj.fgColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SiteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
