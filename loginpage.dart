import 'package:flutter/material.dart';
import 'package:others/registerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String text="Login";
  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();

  FirebaseAuth mauth=FirebaseAuth.instance;
  signin() async{
    String Email=email.text;
    String Password=password.text;
    await mauth.signInWithEmailAndPassword(
        email: Email,
        password: Password,
    ).then((FirebaseUser user){
      setState(() {
        text="Please Wait..";
      });
      Navigator.pushNamed(context, '/homePage');
    })
    .catchError((e)=>print(e));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1,0.5,0.7,0.9],
            colors: [
              Colors.blue,
              Colors.indigo[700],
              Colors.indigo[500],
              Colors.red,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text("ArtGram",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 30.0),),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25.0),
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25.0),
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25.0),
            ),
            RaisedButton(
              color: Colors.white,
              child: new Text("Login",style: TextStyle(color: Colors.black),),
              onPressed: signin,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25.0),
            ),
            FlatButton(
              child: Text("Create a Account"),
              onPressed: (){
                Navigator.pushNamed(context,'/registerPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
