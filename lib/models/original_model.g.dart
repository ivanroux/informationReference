// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'original_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OriginalAdapter extends TypeAdapter<Original> {
  @override
  final typeId = 1;

  @override
  Original read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Original(
      guidlineID: fields[0] as int,
      guidlineName: fields[1] as String,
      guidelinePicture: fields[2] as String,
      guidelineText: fields[3] as String,
      guidelineCompliance: fields[4] as String,
      pictureID1: fields[5] as String,
      pictureURL1: fields[6] as String,
      pictureName1: fields[7] as String,
      pictureCompliance1: fields[8] as String,
      pictureComment1: fields[9] as String,
      pictureGuideline1: fields[10] as String,
      pictureAlignemnt1: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Original obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.guidlineID)
      ..writeByte(1)
      ..write(obj.guidlineName)
      ..writeByte(2)
      ..write(obj.guidelinePicture)
      ..writeByte(3)
      ..write(obj.guidelineText)
      ..writeByte(4)
      ..write(obj.guidelineCompliance)
      ..writeByte(5)
      ..write(obj.pictureID1)
      ..writeByte(6)
      ..write(obj.pictureURL1)
      ..writeByte(7)
      ..write(obj.pictureName1)
      ..writeByte(8)
      ..write(obj.pictureCompliance1)
      ..writeByte(9)
      ..write(obj.pictureComment1)
      ..writeByte(10)
      ..write(obj.pictureGuideline1)
      ..writeByte(11)
      ..write(obj.pictureAlignemnt1);
  }
}
