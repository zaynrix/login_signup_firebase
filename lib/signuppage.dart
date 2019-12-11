import 'package:auth_two/servise/usermangement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  String _email;
  String _password;


  final _formkey = GlobalKey<FormState>();


  validateandsave() {
    final form = _formkey.currentState;
    if (form.validate()) {
      print("form is valid");
    } else {
      print("Form is invalid");
    }
  }


  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:
                    TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
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

                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),

                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },


                      validator: (val) =>
                      !val.contains('@') ? 'Email is a lready exists' : null,
                      onSaved: (val) => _email = val,


                    ),


                    SizedBox(height: 10.0),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },

                        validator: (val) =>
                        val.length < 6 ? 'Password too short' : null,
                        onSaved: (val) => _password = val


                    ),
                    SizedBox(height: 10.0),
//                  TextField(
//                    decoration: InputDecoration(
//                        labelText: 'NICK NAME ',
//                        labelStyle: TextStyle(
//                            fontFamily: 'Montserrat',
//                            fontWeight: FontWeight.bold,
//                            color: Colors.grey),
//                        focusedBorder: UnderlineInputBorder(
//                            borderSide: BorderSide(color: Colors.green))),
//                  ),

                    //----------------------------------------------------------

                    //    FirebaseAuth.instance
                    //        .createUserWithEmailAndPassword(
                    //    email: _email, password: _password)
                    //        .then((SignedInUser) {
                    //    UserMAngement().stroenewUser(SignedInUser,context);
                    //
                    //    });
                    //

//--------------------------------------------------------------------------
                    SizedBox(height: 50.0),
                    ProgressButton(

                      defaultWidget: const Text('Signup'),
                      progressWidget: const CircularProgressIndicator(
                        backgroundColor: Colors.red,

                      ),


                      height: 40,
                      color: Colors.green,
                      width: 200,


                      onPressed: () async {
                        int score = await Future.delayed(
                            const Duration(milliseconds: 4000), () => 50);
                        // After [onPressed], it will trigger animation running backwards, from end to beginning
                        return () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: _email, password: _password)
                              .then((SignedInUser) {
                            UserMAngement().stroenewUser(SignedInUser, context);
                          });

                          // Optional returns is returning a function that can be called
                          // after the animation is stopped at the beginning.
                          // A best practice would be to do time-consuming task in [onPressed],
                          // and do page navigation in the returned function.
                          // So that user won't missed out the reverse animation.
                        };
                      },
                    ),


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
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child:

                          Center(
                            child: Text('Go Back',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                          ),


                        ),
                      ),
                    ),
                  ],
                ),
              )
          )
        ]));
  }
}