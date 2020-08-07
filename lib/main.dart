// ignore: unused_import
import 'package:farm_app/description.dart';
import 'package:farm_app/farmer_details.dart';
import 'package:farm_app/filterScreen.dart';
import 'package:farm_app/profile.dart';
import 'package:farm_app/properties_list.dart';
import 'package:farm_app/sign_in.dart';
import 'package:farm_app/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'control.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true,
    );
    return MaterialApp(initialRoute: 'control', routes: {
      'control': (context) => Control(),
      'signup': (context) => SignUp(),
      'signin': (context) => SignIn(),
      'properlist': (context) => Recipe(),
      'Farmerdetails': (context) => Farmer_details(),
      'des': (context) => Description(),
      'pro': (context) => Profile(),
      'filter': (context) => FilterScreen()
    });
  }
}
