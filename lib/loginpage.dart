import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  final _formkey =GlobalKey<FormState>();


validateandsave(){
final form = _formkey.currentState;
if(form.validate()){
 form.save();
 return true;

}else{
return false;

}
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Hello',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('There',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',

                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        validator: (val) =>
                        !val.contains('@') ? 'Invalid Email' : null,
                        onSaved: (val) => _email = val,

                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                        autofocus: false,
                        maxLines: 1,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        validator: (val) =>
                        val.length < 6 ? 'Password too short' : null,
                        onSaved: (val) => _password = val,),



                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('/forgetpassword');
                          },
                        ),
                      ),
                      SizedBox(height: 40.0),


                      ProgressButton(

                        defaultWidget: const Text('Login'),
                        progressWidget: const CircularProgressIndicator(
                          backgroundColor: Colors.red,

                        ),


                        height: 40,
                        color:Colors.green,
                        width: 200,


                        onPressed: () async {
                          validateandsave();
                          int score = await Future.delayed(
                              const Duration(milliseconds: 4000), () => 50);
                          // After [onPressed], it will trigger animation running backwards, from end to beginning
                          return () {


                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                email: _email, password: _password)
                                .then((user) {
                              Navigator.of(context).pushReplacementNamed('/homepage');
                            })
                                .catchError((e) {
                              print(e);
                            });
                            // Optional returns is returning a function that can be called
                            // after the animation is stopped at the beginning.
                            // A best practice would be to do time-consuming task in [onPressed],
                            // and do page navigation in the returned function.
                            // So that user won't missed out the reverse animation.
                          };
                        },
                      ),




//                    Container(
//                      height: 40.0,
//                      child: RaisedButton(
//                        child: Material(
//                          borderRadius: BorderRadius.circular(20.0),
//                          shadowColor: Colors.greenAccent,
//                          color: Colors.green,
//                          elevation: 7.0,
//                          child: GestureDetector(
//                            child: Center(
//                              child: Text(
//                                'Login',
//                                style: TextStyle(
//                                    color: Colors.white,
//                                    fontWeight: FontWeight.bold,
//                                    fontFamily: 'Montserrat'),
//                              ),
//                            ),
//                          ),
//                        ),
//                     onPressed: (){},
//
//
//                      ),
//
//
//
//
//                    ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(width: 10.0),
                              Center(
                                child: Text('Log in with Gmail',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New to Spotify ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
//      Scaffold(
//      resizeToAvoidBottomPadding: false,
//      body: Center(
//        child: Container(
//          padding: EdgeInsets.all(25.0),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//          TextField(
//          decoration: InputDecoration(
//              labelText: 'EMAIL',
//              labelStyle: TextStyle(
//                  fontFamily: 'Montserrat',
//                  fontWeight: FontWeight.bold,
//                  color: Colors.grey),
//              focusedBorder: UnderlineInputBorder(
//                  borderSide: BorderSide(color: Colors.green))),
//          onChanged: (value) {
//            setState(() {
//              _email = value;
//            });
//          },
//          ),
//              TextField(
//                decoration: InputDecoration(hintText: "Password"),
//                onChanged: (value) {
//                  setState(() {
//                    _password = value;
//                  });
//                },
//                obscureText: true,
//              ),
//              SizedBox(height: 20.0),
//              RaisedButton(
//                child: Text("Log In"),
//                color: Colors.red,
//                textColor: Colors.white,
//                elevation: 7.0,
//                onPressed: () {
//                  FirebaseAuth.instance
//                      .signInWithEmailAndPassword(
//                          email: _email, password: _password)
//                      .then((user) {
//                        Navigator.of(context).pushReplacementNamed('/homepage');
//                  })
//                      .catchError((e) {
//                    print(e);
//                  });
//                },
//              ),
//              SizedBox(height: 20.0),
//              Text("Don\'t have an account?",style: TextStyle(color:Colors.red)),
//              SizedBox(height: 10.0),
//              RaisedButton(
//                child: Text("Sign Up"),
//                color: Colors.blue.shade500,
//                textColor: Colors.white,
//                elevation: 7.0,
//                onPressed: () {
//                  Navigator.of(context).pushNamed('/signup');
//                },
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
