import 'package:hive/hive.dart';
part 'registration.g.dart'; // Generated file containing HiveType and HiveField annotations

@HiveType(typeId: 0) // Specify a unique typeId for this class
class Registration extends HiveObject {
  @HiveField(0)
  final String firstName;

  @HiveField(1)
  final String middleName;

  @HiveField(2)
  final String lastName;

  @HiveField(3)
  final int mobileNumber;

  @HiveField(4)
  final String email;

  @HiveField(5)
  final String address;

  @HiveField(6)
  final String password;

  @HiveField(7)
  final String confirmPassword;

  @HiveField(8)
  final String title;

  @HiveField(9)
  final String gender;

  @HiveField(10)
  final String dateOfBirth;

  Registration({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.mobileNumber,
    required this.email,
    required this.address,
    required this.password,
    required this.confirmPassword,
    required this.title,
    required this.gender,
    required this.dateOfBirth,
  });

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
    firstName: json["firstName"] ?? '',
    middleName: json["middleName"] ?? '',
    lastName: json["lastName"] ?? '',
    mobileNumber: json["mobileNumber"] ?? 0,
    email: json["email"] ?? '',
    address: json["address"] ?? '',
    password: json["password"] ?? '',
    confirmPassword: json["confirmPassword"] ?? '',
    title: json["title"] ?? '',
    gender: json["gender"] ?? '',
    dateOfBirth: json["dateOfBirth"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "mobileNumber": mobileNumber,
    "email": email,
    "address": address,
    "password": password,
    "confirmPassword": confirmPassword,
    "title": title,
    "gender": gender,
    "dateOfBirth": dateOfBirth,
  };
}
