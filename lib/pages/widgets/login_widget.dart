// ignore_for_file: prefer_const_constructors

import 'package:bit_atomic/pages/intro_homescreen.dart';
import 'package:bit_atomic/pages/widgets/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black87,
                      width: 0.1,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignOutside),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 25, 8),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.mail),
                      // Image.asset('assets/icons/envelope-regular.svg'),
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 182, 181, 181))
                      //  hintText: 'Enter your email',
                      ),
                  validator: (value) {
                    value!.isEmpty ? "Please enter your email" : null;
                    value.characters.isEmpty ? "Please enter your email" : null;
                    return null;
                    //regex
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black87,
                      width: 0.1,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignOutside),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 25, 8),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.lock),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 182, 181, 181)),
                  ),
                  validator: (value) {
                    value!.isEmpty ? "Please enter your password" : null;
                    value.characters.length <= 8
                        ? "Password should be min 8 character"
                        : null;
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 190),
                child: InkWell(
                  onTap: () {
                    showEmailInputDialog(context);
                    // showCupertinoPopup(context);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 78, 176, 120),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Signing in..."),
                    ),
                  );
                }
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => IntroHomeScreen()),
                );
                MySharedPref.setloggedInTrue();
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 62, 125, 90),
                  border: Border.all(
                    color: const Color.fromARGB(221, 255, 255, 255),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                    child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )),
              ),
            )
          ],
        ));
  }

  // void showCupertinoPopup(BuildContext context) {
  //   showCupertinoDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return CupertinoAlertDialog(
  //         title: Text("Cupertino Popup"),
  //         content: Text("This is a Cupertino-style popup dialog."),
  //         actions: <Widget>[
  //           CupertinoDialogAction(
  //             child: Text("OK"),
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Close the dialog
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void showEmailInputDialog(BuildContext context) {
    String email = ''; // Store the email entered by the user

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Adjust the radius as needed
          ),
          title: Text(''),
          content: SizedBox(
            width: 190,
            height: 230,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (value) {
                    email =
                        value; // Update the email variable as the user types
                  },
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: InkWell(
                onTap: () {
                  // Validate the email (you can add more validation logic)
                  //SEND TO BACKEND TO SEND OTP TO EMAIL

                  if (email.isNotEmpty) {
                    Navigator.of(context).pop(); // Close the email dialog
                    showOTPVerificationDialog(context, email);
                  } else {
                    // Show an error or prompt for a valid email
                  }
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 84, 169, 123),
                    border: Border.all(
                      color: const Color.fromARGB(221, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 210, 98, 98),
                    border: Border.all(
                      color: const Color.fromARGB(221, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void showOTPVerificationDialog(BuildContext context, String email) {
    String otp = ''; // Store the OTP entered by the user

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Adjust the radius as needed
          ),
          title: Text(''),
          content: SizedBox(
            width: 190,
            height: 230,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('An OTP has been sent to $email.'),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter OTP'),
                  onChanged: (value) {
                    otp = value; // Update the OTP variable as the user types
                  },
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: InkWell(
                onTap: () {
                  // Verify the OTP (you can add your OTP verification logic)
                  if (otp == '123456') {
                    // Replace '123456' with your actual OTP validation logic
                    Navigator.of(context)
                        .pop(); // Close the OTP verification dialog

                    resetPassword(context);

                    print('OTP verified successfully');
                  } else {
                    // Show an error or prompt for a valid OTP
                  }
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 84, 169, 123),
                    border: Border.all(
                      color: const Color.fromARGB(221, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Text(
                    'Verify',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 210, 98, 98),
                    border: Border.all(
                      color: const Color.fromARGB(221, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void resetPassword(BuildContext context) {
    String newPass = '';
    String confirmPass = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Adjust the radius as needed
          ),
          title: Text(''),
          content: SizedBox(
            width: 190,
            height: 230,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Reset Password'),
                TextFormField(
                    decoration: InputDecoration(labelText: 'New Password'),
                    onChanged: (value) {}),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  onChanged: (value) {
                    //verify two pass are same or not
                  },
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: InkWell(
                onTap: () {
                  //reset
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 84, 169, 123),
                    border: Border.all(
                      color: const Color.fromARGB(221, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Text(
                    'Reset',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 210, 98, 98),
                    border: Border.all(
                      color: const Color.fromARGB(221, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
