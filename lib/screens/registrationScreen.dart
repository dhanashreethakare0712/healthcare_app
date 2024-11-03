import 'package:flutter/material.dart';
import 'package:hello_world/screens/loginScreen.dart';
import 'package:hello_world/screens/welcomeScreen.dart';
import 'package:hive/hive.dart';
import '../../global_variable.dart';
import '../model/registration.dart';
import 'homeScreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  String? _selectedTitle;
  String? _selectedGender;
  bool _agreeToTerms = false;
  DateTime? _selectedDateOfBirth;
  bool _isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration', style: TextStyle(color: Colors.white),),
        leading: IconButton(
           icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()),
            );
          }, // Accessing the global icon color
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              DropdownButtonFormField<String>(
                autofocus: true,
                isDense: true,
                value: _selectedTitle,
                isExpanded: true,
                onChanged: (newValue) {
                  setState(() {
                    _selectedTitle = newValue;
                  });
                },
                items: ['Mr', 'Miss', 'Mrs', 'Ms']
                    .map((title) => DropdownMenuItem(
                  value: title,
                  child: Text(title),
                ))
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Select Title',
                 // border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:1, color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: GlobalVariable.appBarColor),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                ),
              ),
              // DropdownButtonFormField<String>(
              //   value: _selectedTitle,
              //   onChanged: (newValue) {
              //     setState(() {
              //       _selectedTitle = newValue;
              //     });
              //   },
              //   items: ['Mr', 'Miss', 'Mrs', 'Ms']
              //       .map((title) => DropdownMenuItem(
              //     value: title,
              //     child: Text(title),
              //   ))
              //       .toList(),
              //   decoration: const InputDecoration(
              //     labelText: 'Title',
              //   ),
              // ),
              const SizedBox(height: 20),
              TextFormField(
                controller: firstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'First Name is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'First Name *',
                 // border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:1, color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: GlobalVariable.appBarColor),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                 // contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: middleNameController,
                decoration: InputDecoration(
                  labelText: 'Middle Name',
                 // border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:1, color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: GlobalVariable.appBarColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: lastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Last Name is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Last Name *',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:1, color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: GlobalVariable.appBarColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text('Gender',style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
               // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _selectedGender = 'Male'; // Set the selected gender to Male
                      });
                    },
                    icon: const Icon(Icons.male),
                    label: const Text('Male'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        return _selectedGender == 'Male' ? GlobalVariable.appBarColor : Colors.transparent; // Highlight the button if selected
                      }),
                      side: MaterialStateProperty.resolveWith<BorderSide>((states) {
                        return BorderSide(color: _selectedGender == 'Male' ? Colors.transparent : GlobalVariable.appBarColor, width: 2); // Show border color if not selected
                      }),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        return _selectedGender == 'Male' ? Colors.white : GlobalVariable.appBarColor; // Set text color to white if selected
                      }),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _selectedGender = 'Female';
                      });
                    },
                    icon: const Icon(Icons.female),
                    label: const Text('Female'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        return _selectedGender == 'Female' ? GlobalVariable.appBarColor : Colors.transparent; // Highlight the button if selected
                      }),
                      side: MaterialStateProperty.resolveWith<BorderSide>((states) {
                        return BorderSide(color: _selectedGender == 'Female' ? Colors.transparent : GlobalVariable.appBarColor, width: 2); // Show border color if not selected
                      }),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        return _selectedGender == 'Female' ? Colors.white : GlobalVariable.appBarColor; // Set text color to white if selected
                      }),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _selectedGender = 'Other'; // Set the selected gender to Other
                      });
                    },
                    icon: const Icon(Icons.more_horiz),
                    label: const Text('Other'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        return _selectedGender == 'Other' ? GlobalVariable.appBarColor : Colors.transparent; // Highlight the button if selected
                      }),
                      side: MaterialStateProperty.resolveWith<BorderSide>((states) {
                        return BorderSide(color: _selectedGender == 'Other' ? Colors.transparent : GlobalVariable.appBarColor, width: 2); // Show border color if not selected
                      }),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        return _selectedGender == 'Other' ? Colors.white : GlobalVariable.appBarColor; // Set text color to white if selected
                      }),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: mobileNumberController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                 // border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:1, color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: GlobalVariable.appBarColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                 // border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:1, color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: GlobalVariable.appBarColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                 // border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:1, color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: GlobalVariable.appBarColor),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: _isObscure,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Password *',
                //  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:1, color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: GlobalVariable.appBarColor),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: _isObscure,
                controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm Password is required';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Confirm Password *',
                 // border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:1, color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: GlobalVariable.appBarColor),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                 // border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:1, color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: GlobalVariable.appBarColor),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDateOfBirth = pickedDate;
                    });
                  }
                },
                readOnly: true,
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreeToTerms = value!;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'I agree to the terms and conditions',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      if (_isSubmitted && !_agreeToTerms)
                        const Text(
                          'Please agree to the terms and conditions.',
                          style: TextStyle(color: Colors.red),
                        ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //  // padding: EdgeInsets.symmetric(horizontal: 32), // Adjust padding as needed
                    //   minimumSize: Size(120, 40),
                    //   backgroundColor: GlobalVariable.appBarColor, // Midnight blue color
                    // ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        return GlobalVariable.appBarColor ; // Highlight the button if selected
                      }),
                      elevation: MaterialStateProperty.all(0),
                      minimumSize: MaterialStateProperty.resolveWith<Size>((states) {
                        return Size(120, 40); // Highlight the button if selected
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _isSubmitted = true; // Set form submission flag to true
                      });
                      if (_formKey.currentState!.validate()) {
                       //  saveRegistrationData();
                         Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                      }
                    },
                    child: const Text('Save', style: TextStyle(
                        fontSize: 18, color: Colors.white)),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                        return GlobalVariable.appBarColor ; // Highlight the button if selected
                      }),
                      elevation: MaterialStateProperty.all(0),
                      minimumSize: MaterialStateProperty.resolveWith<Size>((states) {
                        return const Size(120, 40); // Highlight the button if selected
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                      );
                    },
                    child: const Text('Cancel', style: TextStyle(
                        fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveRegistrationData() async {

    final boxRegistration = await Hive.openBox<Registration>('registrationbox');
    // Create a registration object
    final registration = Registration(
      firstName: firstNameController.text,
      middleName: middleNameController.text,
      lastName: lastNameController.text,
      mobileNumber: int.parse(mobileNumberController.text),
      email: emailController.text,
      address: addressController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      title: _selectedTitle!,
      gender: _selectedGender!,
      dateOfBirth: _selectedDateOfBirth.toString(), // Convert DateTime to String
    );

    // Save the registration object to the box
    await boxRegistration.add(registration);

    // Close the box
    await boxRegistration.close();
  }
}