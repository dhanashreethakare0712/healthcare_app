import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screens/welcomeScreen.dart';
import 'package:hive/hive.dart';
import '../../global_variable.dart';
import '../model/registration.dart';
import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool pressed = false;
  bool _isObscure = true;
  bool _rememberMe = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white),),
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
          child:
          Center(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Container(
                      height: 200,
                      child: Image.asset('assets/splash.jpeg'),
                      // child: new Image.asset(GlobalVariable.adsERPLogo,fit: BoxFit.fill),
                    ),
                  ),

                  Container(
                      alignment: Alignment.center,
                     // padding: const EdgeInsets.all(10),
                      child: Text('Patient Login', textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25,
                            color: GlobalVariable.appBarColor,
                            fontWeight: FontWeight.bold),
                      )
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: TextFormField(
                      controller: usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'User Name is required *';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        labelStyle: TextStyle(color: Colors.grey),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: GlobalVariable.appBarColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.red),
                          // borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      obscureText: _isObscure,
                      controller: passwordController,
                      validator: (value) {
                        if (value!.length == 0) {
                          return "Password is required *";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure ? Icons.visibility : Icons
                              .visibility_off, color: Colors.grey.shade700,),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: GlobalVariable.appBarColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.red),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                       // SizedBox(width: 10),
                        Center(
                          child: Container(
                            child: Column(
                              children: [
                                Checkbox(
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text('Remember Me'),
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // Forgot password logic
                                print('Forgot Password');
                              },
                              child: Text('Forgot Password?'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                 // SizedBox(height: 10.0),
                 //  TextButton(
                 //    onPressed: () {
                 //      // Forgot password logic
                 //      print('Forgot Password');
                 //    },
                 //    child: Text('Forgot Password?'),
                 //  ),
                 // SizedBox(height: 20.0),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                          print('Login button Click');
                          String UserName = usernameController.text;
                          String Password = passwordController.text;
                          if (_formKey.currentState!.validate()) {
                            if (UserName != '' || Password != '') {
                              //loginSubmit();
                              //checkHiveData();
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (
                                  context) => HomeScreen()));
                            } else {

                            }
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              GlobalVariable.btnColor),
                          foregroundColor: MaterialStateProperty.all(
                              Colors.white),
                          padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 14)),
                        ),
                        child: const Text('Login', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),),
                      )
                  ),
                ],
              )
          )
      ),

      bottomNavigationBar: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Column(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      GlobalVariable.version, textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10),
                    )
                ),
              ],
            ),
          ]
      ),
    );
  }
  // Future<void> checkHiveData() async {
  //   // Open the Hive box
  //   final box = await Hive.openBox<Registration>('registrationBox');
  //
  //   // Retrieve all registrations from the box
  //   final registrations = box.values.cast<Registration>().toList();
  //
  //   // Close the box
  //   await box.close();
  //
  //   // Print the registrations
  //   registrations.forEach((registration) {
  //     print('First Name: ${registration.firstName}');
  //     print('Middle Name: ${registration.middleName}');
  //     print('Last Name: ${registration.lastName}');
  //     print('Mobile Number: ${registration.mobileNumber}');
  //     print('Email: ${registration.email}');
  //     print('Address: ${registration.address}');
  //     print('Password: ${registration.password}');
  //     print('Confirm Password: ${registration.confirmPassword}');
  //     print('Title: ${registration.title}');
  //     print('Gender: ${registration.gender}');
  //     print('Date of Birth: ${registration.dateOfBirth}');
  //     print('------------------------');
  //   });
  // }
}



