import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _currentRangeValues = const RangeValues(0, 100);
  RangeValues _currentRangeValues1 = const RangeValues(0, 100);
  RangeValues _currentRangeValues2 = const RangeValues(0, 100);
  @override
  Widget build(BuildContext context) {
    Color dc = Colors.white;
    return Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextResponsive(
                  'Acres',
                  style: TextStyle(fontSize: 100.h),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: RangeSlider(
                  max: 100,
                  min: 0,
                  values: _currentRangeValues,
                  divisions: 100,
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextResponsive(
                  'Cites',
                  style: TextStyle(fontSize: 100.h),
                ),
              ),
              Container(
                height: 150.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Diet_card(name: 'Istanbul', color: dc),
                    Diet_card(name: 'London', color: dc),
                    Diet_card(name: 'Dubai', color: dc),
                    Diet_card(name: 'Berlin', color: dc),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextResponsive(
                  'Radius',
                  style: TextStyle(fontSize: 100.h),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: RangeSlider(
                  max: 100,
                  min: 0,
                  values: _currentRangeValues1,
                  divisions: 100,
                  labels: RangeLabels(
                    _currentRangeValues1.start.round().toString(),
                    _currentRangeValues1.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues1 = values;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextResponsive(
                  'Price',
                  style: TextStyle(fontSize: 100.h),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: RangeSlider(
                  max: 100,
                  min: 0,
                  values: _currentRangeValues2,
                  divisions: 100,
                  labels: RangeLabels(
                    _currentRangeValues2.start.round().toString(),
                    _currentRangeValues2.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues2 = values;
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class Diet_card extends StatefulWidget {
  Diet_card({
    @required this.name,
    @required this.color,
  });
  final String name;
  final Color color;

  @override
  _Diet_cardState createState() => _Diet_cardState();
}

class _Diet_cardState extends State<Diet_card> {
  bool isSelect = false;
  Color _color = Colors.green;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelect = !isSelect;
        });
        print(isSelect);
      },
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          width: 300.0.w,
          height: 120.0.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: (isSelect) ? _color : Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0x0d130f10),
                offset: Offset(4, 6.928203105926514),
                blurRadius: 18,
              ),
            ],
          ),
          child: Center(
            child: TextResponsive(
              widget.name,
              style: TextStyle(
                fontFamily: 'SofiaPro',
                fontSize: 40,
                color: (isSelect) ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class Countbutton extends StatefulWidget {
  Countbutton({this.count, this.dc});
  final int count;
  final Color dc;
  int v;
  @override
  _CountbuttonState createState() => _CountbuttonState();
}

class _CountbuttonState extends State<Countbutton> {
  bool isSelect = false;

  Color _color = Color(0xFFFE718B);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (widget.count == widget.count) {
            isSelect = !isSelect;
          } else {
            isSelect = false;
          }
        });
        print(isSelect);
      },
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: (isSelect) ? _color : Color(0xffffffff),
          child: Center(
            child: TextResponsive(
              '${widget.count}',
              style: TextStyle(
                fontFamily: 'SofiaPro',
                fontSize: 53,
                color: Color(0xff282828),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
