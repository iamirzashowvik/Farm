import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Control extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.all(10),
                color: Colors.amber,
                onPressed: () {
                  Navigator.pushNamed(context, 'signup');
                },
                child: Text('signup'),
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                color: Colors.amber,
                onPressed: () {
                  Navigator.pushNamed(context, 'signin');
                },
                child: Text('signIn'),
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                color: Colors.amber,
                onPressed: () {
                  Navigator.pushNamed(context, 'properlist');
                },
                child: Text('properties_list'),
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                color: Colors.amber,
                onPressed: () {
                  Navigator.pushNamed(context, 'Farmerdetails');
                },
                child: Text('Farmerdetails'),
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                color: Colors.amber,
                onPressed: () {
                  Navigator.pushNamed(context, 'des');
                },
                child: Text('description'),
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                color: Colors.amber,
                onPressed: () {
                  Navigator.pushNamed(context, 'pro');
                },
                child: Text('Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
