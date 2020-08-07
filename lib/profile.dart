import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'package:flutter/foundation.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  int _selectedIndex = 4;
  bool selected = false;
  TabController _tabController;
  bool toggle = false;
  Color selectedColor1 = Colors.green;
  Color selectedColor2 = Colors.black;
  Color cc = Color(0xffff718b);
  Map<String, double> dataMap = Map();
  bool swvalue = false;

  static const TextStyle optionStyle = TextStyle(
    fontFamily: 'SofiaPro-Medium',
    fontSize: 35,
    //  color: const Color(0x4d130f10),
  );
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
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
        backgroundColor: Colors.white70,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: TextResponsive(
            'Farm Zeal',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          actions: <Widget>[
            Icon(
              Icons.search,
            ),
            Icon(
              Icons.notifications_none,
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            // shrinkWrap: true,
            children: <Widget>[
              DefaultTabController(
                initialIndex: 0,
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
                            'My Profile',
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
                            'Settings',
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
                      height: 3000.h,
                      child: TabBarView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 300.h,
                                      width: 300.h,
                                      child: Image.asset(
                                        'Assets/download (1).jpg',
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: TextResponsive(
                                          'Farmer Name',
                                          style: TextStyle(fontSize: 90.h),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Container(
                                          height: 30,
                                          width: 600.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: TextField(),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: TextResponsive(
                                          'Phone Number',
                                          style: TextStyle(fontSize: 90.h),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Container(
                                          height: 30,
                                          width: 600.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: TextField(),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: TextResponsive(
                                          'Change Location',
                                          style: TextStyle(fontSize: 90.h),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Container(
                                          height: 30,
                                          width: 600.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: TextField(),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: TextResponsive(
                                  'My Farm Details',
                                  style: TextStyle(fontSize: 90.h),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  children: [
                                    SizedBox(
                                        height: 3000.h,
                                        child: Column(
                                          children: <Widget>[
                                            Prperties_Card(),
                                            Prperties_Card(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.green),
                                                child: Center(
                                                    child: TextResponsive(
                                                  'Locate New Farm',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 120.h),
                                                )),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.green),
                                                child: Center(
                                                    child: TextResponsive(
                                                  'Log Out',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 120.h),
                                                )),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text("data2"),
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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: Colors.green),
          selectedItemColor: Colors.green,
          unselectedItemColor: Color(0xff707070),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: TextResponsive(
                'Home',
                style: optionStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_border,
              ),
              title: TextResponsive(
                'Book Mark',
                style: optionStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              title: TextResponsive(
                'Shop',
                style: optionStyle,
                textAlign: TextAlign.left,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_outline,
              ),
              title: TextResponsive(
                'Support',
                style: optionStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.more_vert,
              ),
              title: TextResponsive(
                'More',
                style: optionStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Prperties_Card extends StatelessWidget {
  const Prperties_Card({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 330.h,
        width: 1000.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                    height: 300.h,
                    width: 300.w,
                    child: Image.asset(
                      'Assets/download (1).jpg',
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextResponsive(
                            'Farm Name :',
                            style: TextStyle(fontSize: 90.h),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextResponsive(
                            'New Farm',
                            style: TextStyle(fontSize: 90.h),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextResponsive(
                            'Area :',
                            style: TextStyle(fontSize: 90.h),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextResponsive(
                            '1.35 acres',
                            style: TextStyle(fontSize: 90.h),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
