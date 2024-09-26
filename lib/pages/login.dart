import 'package:e_commerce_app/widget/support_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
          child: Column(
            children: [
              Image.asset("images/login.png"),
              Text(
                "Sign in",
                style: AppWidget.semiboldTextFieldStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Please enter the details beloew to\n                     continue",
                style: AppWidget.lightTextFieldStyle(),
              ),
              SizedBox(height: 40,),
              Text(
                "Email",
                style: AppWidget.semiboldTextFieldStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Color(0xfff4f5f9),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Email"),
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                "Password",
                style: AppWidget.semiboldTextFieldStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Color(0xfff4f5f9),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Password"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold))),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Don't have an account? ",style: AppWidget.lightTextFieldStyle(),),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
              ],),
            ],
          ),
        ),
      ),
    );
  }
}
