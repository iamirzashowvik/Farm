import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'filterScreen.dart';
import 'package:flutter/foundation.dart';

class Recipe extends StatefulWidget {
  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> with SingleTickerProviderStateMixin {
  int _selectedIndex = 2;
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
    _tabController = new TabController(length: 3, vsync: this);
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
          leading: Icon(
            Icons.chevron_left,
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
                length: 3,
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
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: TextResponsive(
                            'Buy',
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
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: TextResponsive(
                            'Sell',
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
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: TextResponsive(
                            'Lease',
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
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextResponsive(
                      'Show on map ',
                      style: TextStyle(fontSize: 30),
                    ),
                    Switch(
                        value: swvalue,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            swvalue = value;
                          });
                        }),
                    GestureDetector(
                      child: Icon(Icons.tune),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => SingleChildScrollView(
                                    child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: FilterScreen(),
                                )));
                      },
                    ),
                  ],
                ),
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
                            children: <Widget>[
                              Prperties_Card(),
                              Prperties_Card(),
                              Prperties_Card()
                            ],
                          ),
                          Text("data2"),
                          Text("data3")
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

class AddTaskScreen {}

// ignore: camel_case_types
class Prperties_Card extends StatelessWidget {
  const Prperties_Card({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 1000.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextResponsive(
                    'Rs. 1.5 Lac Agricultural Farm / Land',
                    style: TextStyle(fontSize: 100.h),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.call),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextResponsive(
                            ' 251451815',
                            style: TextStyle(fontSize: 90.h),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.check_box_outline_blank),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextResponsive(
                            ' .25 acres',
                            style: TextStyle(fontSize: 90.h),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextResponsive(
                            ' Location',
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
