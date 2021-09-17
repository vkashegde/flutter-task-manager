import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _emailCont = TextEditingController();

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
                  'Forget Password',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 5,
                  child: Text('Enter your email address'),
                ),
                Form(
                  key: _loginFormKey,
                  child: TextFormField(
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
                          'Reset Password',
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
