import 'package:e_commerce_app/auth/authenticate.dart';
import 'package:e_commerce_app/pages/homepage.dart';
import 'package:e_commerce_app/pages/signup.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  void login() {
    try {
    Authenticate state = Provider.of<Authenticate>(context, listen: false);
    state.login(_email.text, _password.text);
    } catch (e) {
      throw(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      // ignore: unnecessary_new
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "End User Page",
        home: Material(
            child: Container(
                padding: const EdgeInsets.all(30.0),
                color: Colors.white,
                child: Center(
                    child: Column(children: [
                  const Padding(padding: EdgeInsets.only(top: 140.0)),
                  Text(
                    'Sign in',
                    style:
                        TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 50.0)),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      labelText: "Enter Email",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Name cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Name cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: FloatingActionButton.extended(
                      onPressed: login,
                      label: const Text('Log  in'),
                      backgroundColor: hexToColor("#F2A03D"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Text.rich(TextSpan(children: [
                      const TextSpan(text: "New to Swagga?"),
                      TextSpan(
                          text: " Sign Up!",
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signup()));
                            })
                    ])),
                  )
                ])))));
  }
}
