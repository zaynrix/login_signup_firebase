import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserMAngement {
  stroenewUser(user,context) {
    Firestore.instance.collection('/users').add({
      'email' : user.email,
      'uid' : user.uid,
    }).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');

    }).catchError((e) {
          print(e);
        });
  }
}
