import 'package:e_commerce_app/home.dart';
import 'package:e_commerce_app/auth/authenticate.dart';
import 'package:e_commerce_app/pages/homepage.dart';
import 'package:e_commerce_app/pages/login.dart';
import 'package:e_commerce_app/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => Authenticate(),
      lazy: false,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer <Authenticate>(
          builder: (context, state, child) {
            return state.isLoggedin ? const Mainhomepage() : const Login();
          },
        ),
      ));
}
