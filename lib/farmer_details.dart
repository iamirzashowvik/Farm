import 'package:android_intent/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:access_settings_menu/access_settings_menu.dart';

// ignore: camel_case_types
class Farmer_details extends StatefulWidget {
  @override
  _Farmer_detailsState createState() => _Farmer_detailsState();
}

// ignore: camel_case_types
class _Farmer_detailsState extends State<Farmer_details>
    with SingleTickerProviderStateMixin {
  String _address = "";
  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    print('ggg   g  $position');
    // create this variable

    List<Placemark> newPlace = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String country = placeMark.country;
    String address =
        "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";

    print(address);

    setState(() {
      _address = address; // update _address
    });
  }

  openSettingsMenu(settingsName) async {
    var resultSettingsOpening = false;

    try {
      resultSettingsOpening =
          await AccessSettingsMenu.openSettings(settingsType: settingsName);
    } catch (e) {
      resultSettingsOpening = false;
    }
  }

  int photoc = 0;
  List imageArray = [];
  _opGallery() async {
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    imageArray.add(image);

    setState(() {
      imageArray;
    });
  }

  _opCamera() async {
    PickedFile image = await _picker.getImage(source: ImageSource.camera);
    imageArray.add(image);
    photoc++;

    setState(() {
      imageArray;
    });
  }

  showAlertDialog1(BuildContext context) {
    // set up the list options

    Widget optionOne = SimpleDialogOption(
      child: const Text('Camera'),
      onPressed: () {
        _getImageC();
      },
    );
    Widget optionTwo = SimpleDialogOption(
      child: const Text('Gallery'),
      onPressed: () {
        _getImageG();
      },
    );

    // set up the SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      title: const Text('Take or Choose Photo'),
      children: <Widget>[
        optionOne,
        optionTwo,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  showAlertDialog2(BuildContext context) {
    // set up the list options

    Widget optionOne = SimpleDialogOption(
      child: const Text('Camera'),
      onPressed: () {
        if (imageArray.length <= 9) {
          _opCamera();
        }
      },
    );
    Widget optionTwo = SimpleDialogOption(
      child: const Text('Gallery'),
      onPressed: () {
        if (imageArray.length <= 9) {
          _opGallery();
        }
      },
    );

    // set up the SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      title: const Text('Take or Choose Photo'),
      children: <Widget>[
        optionOne,
        optionTwo,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  int _selectedIndex = 1;
  bool selected1 = false;
  bool selected2 = false;
  TabController _tabController;
  bool toggle = false;
  Color selectedColor1 = Colors.green;
  Color selectedColor2 = Colors.black;
  Color cc = Color(0xffff718b);
  Map<String, double> dataMap = Map();
  bool swvalue = false;
  File _imageG;

  final _picker = ImagePicker();
  Future _getImageG() async {
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    if (image == null)
      Navigator.pop(context);
    else {
      File file = File(image.path);
      setState(() {
        _imageG = file;
      });
    }
  }

  Future _getImageC() async {
    PickedFile image = await _picker.getImage(source: ImageSource.camera);
    if (image == null)
      Navigator.pop(context);
    else {
      File file = File(image.path);
      setState(() {
        _imageG = file;
      });
    }
  }

  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Can't get gurrent location"),
              content:
                  const Text('Please make sure you enable GPS and try again'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    final AndroidIntent intent = AndroidIntent(
                        action: 'android.settings.LOCATION_SOURCE_SETTINGS');

                    intent.launch();
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checkGps();
    // openSettingsMenu("ACTION_LOCATION_SOURCE_SETTINGS");
    _getCurrentLocation();
    _tabController = new TabController(length: 2, vsync: this);
  }

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
        backgroundColor: Color(0xffF7ECEC),
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: Icon(
            Icons.chevron_left,
          ),
          title: TextResponsive(
            'Farmer Details',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            // shrinkWrap: true,
            children: <Widget>[
              DefaultTabController(
                initialIndex: 1,
                // The number of tabs / content sections to display.
                length: 2,
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: selectedColor2,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Container(
                        width: 502.5.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: TextResponsive(
                            'Location',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 502.5.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: TextResponsive(
                            'Manual',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ), // Complete this code in the next step.
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 10000.h,
                      child: TabBarView(
                        children: [
                          Text("data1"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Flexible(child: TFcard(name: 'No of Acres')),
                                  Flexible(
                                    child: TFcard(
                                      name: 'Per year Rate',
                                    ),
                                  ),
                                ],
                              ),
                              TFcard(name: 'Mobile Number'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextResponsive(
                                      'Land Photo',
                                      style: TextStyle(
                                        fontSize: 120.h,
                                      ),
                                    ),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      showAlertDialog1(context);
                                    },
                                    child: TextResponsive(
                                      'Add photo',
                                      style: TextStyle(
                                        fontSize: 100.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: _imageG == null
                                      ? Container()
                                      : Image.file(
                                          _imageG,
                                          height: 200,
                                          width: 200,
                                        ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selected1 = !selected1;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          CircleAvatar(
                                            backgroundColor: selected1
                                                ? Colors.green
                                                : Colors.white,
                                            radius: 10,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          TextResponsive(
                                            'Tube Well',
                                            style: TextStyle(
                                              fontSize: 120.h,
                                              color: Color(0xb3130f10),
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selected2 = !selected2;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          CircleAvatar(
                                            backgroundColor: selected2
                                                ? Colors.green
                                                : Colors.white,
                                            radius: 10,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          TextResponsive(
                                            'Cannels',
                                            style: TextStyle(
                                              fontSize: 120.h,
                                              color: Color(0xb3130f10),
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextResponsive(
                                  'Location',
                                  style: TextStyle(
                                    fontSize: 120.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Center(
                                    child: TextResponsive(
                                      _address,
                                      style: TextStyle(
                                        fontSize: 120.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextResponsive(
                                      'Gallery',
                                      style: TextStyle(
                                        fontSize: 120.h,
                                      ),
                                    ),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      if (imageArray.length <= 9) {
                                        showAlertDialog2(context);
                                      }
                                    },
                                    child: TextResponsive(
                                      'Add photo',
                                      style: TextStyle(
                                        fontSize: 100.h,
                                      ),
                                    ),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      photoc--;
                                      setState(() {
                                        imageArray.removeLast();
                                      });
                                    },
                                    child: TextResponsive(
                                      'Remove',
                                      style: TextStyle(
                                        fontSize: 100.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: imageArray.isEmpty
                                      ? Center(
                                          child: Icon(Icons.add),
                                        )
                                      : GridView.count(
                                          crossAxisCount: 3,
                                          children: List.generate(
                                              imageArray.length, (index) {
                                            if (imageArray[index] == null) {
                                              photoc--;
                                              imageArray.length--;

                                              return Container();
                                            } else {
                                              PickedFile img =
                                                  imageArray[index];
                                              File fls = File(img.path);

                                              return Container(
                                                child: Image.file(fls),
                                              );
                                            }
                                          }),
                                        ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green),
                                    child: Center(
                                      child: TextResponsive(
                                        'Submit',
                                        style: TextStyle(
                                          fontSize: 120.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                        controller: _tabController,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TFcard extends StatelessWidget {
  TFcard({this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextResponsive(
              name,
              style: TextStyle(
                fontSize: 120.h,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: TextField(
                onChanged: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
