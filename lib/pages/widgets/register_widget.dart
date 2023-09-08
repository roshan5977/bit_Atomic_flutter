import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
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
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 25, 8),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.mail),
                    // Image.asset('assets/icons/envelope-regular.svg'),
                    labelText: 'First Name',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 182, 181, 181))
                    //  hintText: 'Enter your email',
                    ),
                validator: (value) {
                  value!.isEmpty ? "Please enter your name" : null;
                  value.characters.isEmpty ? "Please enter your name" : null;
                  return null;
                  //regex
                },
              ),
            ),
          ),
          const SizedBox(
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
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 25, 8),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.mail),
                    // Image.asset('assets/icons/envelope-regular.svg'),
                    labelText: 'Email Address',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 182, 181, 181))
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
          const SizedBox(
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
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 25, 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 182, 181, 181)),
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
          const SizedBox(
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
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 25, 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.lock),
                  labelText: 'Confirm Password',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 182, 181, 181)),
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
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Signing in..."),
                  ),
                );
              }
            },
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 62, 125, 90),
                border: Border.all(
                  color: const Color.fromARGB(221, 255, 255, 255),
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                  child: Text(
                'Register',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: [
                  TextSpan(
                    text: "By signing up, you agree to our ",
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                  TextSpan(
                    text: "Terms of Service ",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
