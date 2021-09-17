import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/screens/auth/login.dart';

class Signup extends StatefulWidget {
  Signup({key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _emailCont = TextEditingController();
  TextEditingController _passCont = TextEditingController();
  TextEditingController _nameCont = TextEditingController();
  TextEditingController _possCont = TextEditingController();
  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();
  FocusNode _posNode = FocusNode();

  final _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailNode.dispose();
    _passwordNode.dispose();
    _posNode.dispose();
    super.dispose();
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
        child: SingleChildScrollView(
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
                    'Sign Up',
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
                                    builder: (context) => Login()));
                          },
                        text: '  Login',
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
                          controller: _nameCont,
                          validator: (value) {
                            if (value.isEmpty || value.length < 3) {
                              return "Please valid name";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Full Name',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passwordNode),
                          focusNode: _emailNode,
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
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () =>
                              FocusScope.of(context).requestFocus(_posNode),
                          focusNode: _passwordNode,
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
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => _submitOnLogin,
                          focusNode: _posNode,
                          controller: _possCont,
                          validator: (value) {
                            if (value.isEmpty || value.length < 3) {
                              return "Please enter a valid position";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Enter Position',
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 55, vertical: 15),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            'Register',
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
      ),
    );
  }
}
