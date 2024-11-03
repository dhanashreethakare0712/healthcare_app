import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/registration.dart';

Future<Registration> userRegistrationApiPost (String firstName,String middleName,String lastName,String mobileNumber,String email,String address,String password, String confirmPassword, String title,String gender,String dateOfBirth) async {

  final response = await http.post(
    Uri.parse(''),
    headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
    body: jsonEncode(<String, String>{
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'mobileNumber': mobileNumber,// int.parse(mobileNumber),
      'email': email,
      'address': address,
      'password': password,
      'confirmPassword': confirmPassword,
      'title': title,//_selectedTitle!,
      'gender':gender,// _selectedGender!,
      'dateOfBirth': dateOfBirth //_selectedDateOfBirth!.toIso8601String(),
},),
  );

  var responseBody = response.body.toString();
  print('responseBody = '+responseBody);

  if (response.statusCode == 200) {
    return Registration.fromJson(jsonDecode(responseBody));
  } else {
    print('Failed to login');
    throw Exception('Failed to Register');
  }
}







