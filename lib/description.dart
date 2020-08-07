import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Description extends StatefulWidget {
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
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
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                color: Color(0xffffffff),
                height: 1400.h,
                child: Planned_mealv2_card(
                  path: 'Assets/tim-mossholder-8FBTtjCZ9oM-unsplash.jpg',
                  name: 'Green House',
                  price: 35,
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
                            Prperties_Card(),
                          ],
                        )),
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

class Planned_mealv2_card extends StatefulWidget {
  final String path;
  final String name;

  final double price;

  Planned_mealv2_card({
    this.path,
    this.name,
    this.price,
  });

  @override
  _Planned_mealv2_cardState createState() => _Planned_mealv2_cardState();
}

class _Planned_mealv2_cardState extends State<Planned_mealv2_card> {
  Future<void> _launched;
  String _phone = '01710427095';
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true,
    );
    return ResponsiveWidgets.builder(
      height: 1920, // Optional
      width: 1080,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                widget.path,
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextResponsive(
                          widget.name,
                          style: TextStyle(
                            fontSize: 120.h,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                child: Container(
                                  height: 60.h,
                                  width: 80.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green),
                                  child: Center(
                                    child: TextResponsive(
                                      'Buy',
                                      style: TextStyle(
                                        fontSize: 80.h,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                child: Container(
                                  height: 60.h,
                                  width: 80.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green),
                                  child: Center(
                                    child: TextResponsive(
                                      'Sell',
                                      style: TextStyle(
                                        fontSize: 80.h,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextResponsive(
                  '\$${widget.price}',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () => setState(() {
                    _launched = _makePhoneCall('tel:$_phone');
                  }),
                  child: Container(
                    height: 120.h,
                    width: 200.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green),
                    child: Center(
                      child: TextResponsive(
                        'Call',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextResponsive(
              'Address',
              style: TextStyle(
                fontSize: 60,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              child: TextResponsive(
                'Grekk usa uk pakistan russia hd  ygsydvyd ys yy y yd sy',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextResponsive(
              'Description',
              style: TextStyle(
                fontSize: 60,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              child: TextResponsive(
                'Grekk usa uk pakistan russia hd  ygsydvyd ys yy y yd sy',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
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
        height: 100,
        width: 1000.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
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
                            'Est Investment    ',
                            style: TextStyle(fontSize: 90.h),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextResponsive(
                            'Rs. 1100 / Acre',
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
                            'MSP                      ',
                            style: TextStyle(fontSize: 90.h),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextResponsive(
                            'Rs. 1100 / C',
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
                            'Crop Companion',
                            style: TextStyle(fontSize: 90.h),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextResponsive(
                            'Aqua Culture',
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
