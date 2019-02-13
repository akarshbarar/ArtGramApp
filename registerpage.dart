import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:others/User.dart';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool isdisabled=false;
  TextEditingController name=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();
  TextEditingController mobile=new TextEditingController();
  FirebaseAuth mauth=FirebaseAuth.instance;
  final ref=FirebaseDatabase.instance.reference().child('users');

  void signup(){
    isdisabled=true;
    String namedata=name.text;
    String emaildata=email.text;
    String passworddata=password.text;
    String mobiledata=mobile.text;
    mauth.createUserWithEmailAndPassword(
        email: emaildata,
        password: passworddata,
    ).then((FirebaseUser user){
      ref.child("users2").child(user.uid).set(
          {
            'key':ref.key,
            'name':namedata,
            'email':emaildata,
            'password':passworddata,
            'mobile':mobiledata
          }
      );
      ref.push().set({
        'key':ref.key,
        'name':namedata,
        'email':emaildata,
        'password':passworddata,
        'mobile':mobiledata
      });

      Navigator.pushNamed(context,'/homePage' );
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: name,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: "Name",
              hintText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              labelText: "Email",
              hintText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          TextField(
            controller: mobile,
            decoration: InputDecoration(
              icon: Icon(Icons.phone_android),
              labelText: "Mobile Number",
              hintText: "Mobile Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          RaisedButton(
            child: Text(!isdisabled?"Register":"Loading Please Wait.."),
            onPressed: !isdisabled?signup:null,
          ),
        ],
      ),
    );
  }
}
