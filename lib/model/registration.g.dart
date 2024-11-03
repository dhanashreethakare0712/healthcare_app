// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegistrationAdapter extends TypeAdapter<Registration> {
  @override
  final int typeId = 0;

  @override
  Registration read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Registration(
      firstName: fields[0] as String,
      middleName: fields[1] as String,
      lastName: fields[2] as String,
      mobileNumber: fields[3] as int,
      email: fields[4] as String,
      address: fields[5] as String,
      password: fields[6] as String,
      confirmPassword: fields[7] as String,
      title: fields[8] as String,
      gender: fields[9] as String,
      dateOfBirth: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Registration obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.middleName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.mobileNumber)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.password)
      ..writeByte(7)
      ..write(obj.confirmPassword)
      ..writeByte(8)
      ..write(obj.title)
      ..writeByte(9)
      ..write(obj.gender)
      ..writeByte(10)
      ..write(obj.dateOfBirth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
