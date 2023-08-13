import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/local_notification_service.dart';
import '../../viewmodels/auth_viewmodel.dart';
import '../../viewmodels/global_ui_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _obscureTextPassword = true;

  final _formKey = GlobalKey<FormState>();

  void login() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    _ui.loadState(true);
    try {
      await _authViewModel.login(_emailController.text, _passwordController.text).then((value) {

        NotificationService.display(
          title: "Welcome back",
          body: "Hello ${_authViewModel.loggedInUser?.name},\n Hope you are having a wonderful day.",
        );
        Navigator.of(context).pushReplacementNamed('/dashboard');
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
      });
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
    }
    _ui.loadState(false);
  }

  late GlobalUIViewModel _ui;
  late AuthViewModel _authViewModel;
  @override
  void initState() {
    _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
    _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Stack(
                  children: [
                Positioned(
                child: Container(
                width: double.maxFinite,
                  height: 1000,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/123.jpeg'),
                        fit: BoxFit.cover
                      )
                  ),
                )),
                    Positioned(
                        child:
                        Column(
                        children: [
                          SizedBox(height: 320,),
                          Text("Welcome Back",
                            style: const TextStyle(fontFamily: 'Lato', fontSize: 30.0, color: Colors.brown, fontWeight: FontWeight.bold),

                          ),
                          SizedBox(height: 10,),
                          Text("Login To Your Account",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Lato',
                            color: Colors.brown,
                            fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 50,),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: ValidateLogin.emailValidate,
                          style: const TextStyle(fontFamily: 'Lato', fontSize: 16.0, color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                              size: 22.0,),
                            hintText: 'Email Address',
                            hintStyle: TextStyle(fontFamily: 'Lato', fontSize: 17.0),),
                        ),
                          SizedBox(height: 20,),
                          TextFormField(
                              controller: _passwordController,
                              obscureText: _obscureTextPassword,
                              validator: ValidateLogin.password,
                              style: const TextStyle(fontFamily: 'Lato', fontSize: 16.0, color: Colors.black),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  size: 22.0,
                                  color: Colors.black,
                                ),
                                hintText: 'Password',
                                hintStyle: const TextStyle(fontFamily: 'Lato', fontSize: 17.0),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureTextPassword = !_obscureTextPassword;
                                    });
                                  },
                                  child: Icon(
                                    _obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                                    size: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed("/forget-password");
                                  },
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(color: Colors.black,
                                    fontSize: 15),
                                  ),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Change the button color here
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: Colors.white38),
                                  ),
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(vertical: 20),
                                ),
                              ),
                              onPressed: () {
                                login();
                              },
                              child: Text(
                                "Log In",
                                style: TextStyle(fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),

                          SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: TextStyle(color: Colors.black,
                                  fontSize: 17),
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed("/register");
                                    },
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(color: Colors.brown,
                                      fontSize: 17),
                                    ))
                              ],
                            ),
                      ]

                    ))
            ]
              ),





              //   //   SizedBox(
              //   //     height: 10,
              //   //   ),
                //

            )))));

  }
}

class ValidateLogin {
  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    return null;
  }
}
