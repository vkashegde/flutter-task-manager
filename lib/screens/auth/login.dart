import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/screens/auth/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailCont = TextEditingController();
  TextEditingController _passCont = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void _submitOnLogin() {
    final isvalid = _loginFormKey.currentState.validate();
    if (isvalid) {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.06,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Dont have an account ?',
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
                        },
                      text: '  Register',
                      style: TextStyle(
                        color: Colors.blue,
                      ))
                ])),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailCont,
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return "Please enter a valid email address";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Enter Email',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _passCont,
                        validator: (value) {
                          if (value.isEmpty || value.length < 6) {
                            return "Please enter a valid email address";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.remove_red_eye_sharp),
                            isDense: true,
                            hintText: 'Enter password',
                            border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: MaterialButton(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      onPressed: _submitOnLogin),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
