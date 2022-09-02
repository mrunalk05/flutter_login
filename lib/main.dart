import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Login()));

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  _LoginState createState() => _LoginState();
}

TextEditingController emailcontroler = TextEditingController();
TextEditingController passwordcontroler = TextEditingController();

void login(String email, String password) async {
  try {
    http.Response response = await http.post(
        Uri.parse("https://reqres.in/api/register"),
        body: {"email": email, "password": password});

    if (response.statusCode == 200) {
      print("Logged in Sucefully");
    } else {
      print('Failed To login');
    }
  } catch (e) {
    //print(e.tostring());
  }
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Login Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(50.0),
          ),
          TextFormField(
            controller: emailcontroler,
            decoration: InputDecoration(hintText: "Email"),
          ),
          SizedBox(height: 40),
          TextFormField(
            controller: passwordcontroler,
            decoration: InputDecoration(hintText: "Password"),
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              login(emailcontroler.text.toString(),
                  passwordcontroler.text.toString());
            },
            child: Container(
              // height: 50,
              // decoration: BoxDecoration(
              //     color: Colors.greenAccent,
              //     borderRadius: BorderRadius.circular(10.0)),
              // child: Text('Login'),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Sign In'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
