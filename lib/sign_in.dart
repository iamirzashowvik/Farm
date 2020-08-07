import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obs = true;
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );
    return ResponsiveWidgets.builder(
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 300,
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //       image: ExactAssetImage(
                    //           'Assets/photo6154419738822945223.jpg'),
                    //       fit: BoxFit.cover),
                    // ),
                  ),
                  Positioned(
                    top: 15,
                    right: 0,
                    child: Container(
                        height: 90.h,
                        width: 90.h,
                        color: Colors.white,
                        child: Center(
                          child: TextResponsive(
                            'Skip',
                            style: TextStyle(fontSize: 35),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextResponsive(
                'Welcome Back',
                style: TextStyle(
                    fontSize: 75,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextResponsive(
                'Sign in your Channab account',
                style: TextStyle(fontSize: 60, color: Colors.green),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.phone_android),
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType:
                            TextInputType.numberWithOptions(signed: true),
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            hintText: 'Phone Number',
                            prefixText: '+92  ',
                            prefixStyle: TextStyle()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.lock_outline),
                    ),
                    Flexible(
                      child: TextField(
                        obscureText: obs,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: Icon(Icons.remove_red_eye)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                child: Center(
                    child: TextResponsive(
                  'Sign In',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 150.h),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextResponsive(
                    'Don\'t I have an account?',
                    style: TextStyle(
                      fontSize: 45,
                    ),
                  ),
                  GestureDetector(
                    child: TextResponsive(
                      '  Sign Up',
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
