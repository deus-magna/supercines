import 'package:flutter/material.dart';
import 'package:supercines/framework/framework.dart';

class Calendar {
  final int number;
  final String title;

  Calendar(this.number, this.title);
}

class TimeData {
  final String date;
  final String price;

  TimeData(this.date, this.price);
}
typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);

class HorizontalScrollList extends StatelessWidget {
  final double height;
  final Color backgroundColor;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;


  const HorizontalScrollList({
    Key key,
    this.height = 90.0,
    this.backgroundColor = Colors.transparent,
    @required this.itemCount, @required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: backgroundColor,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}

class CalendarButton extends StatelessWidget {
  final Calendar calendar;
  final Function onPressed;
  final bool selected;

  const CalendarButton({this.calendar, this.onPressed, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: 52,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: selected ? yellow : deepBlue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${calendar.number}',
              textAlign: TextAlign.center,
              style: selected
                  ? TextStyle(fontSize: 25, color: Colors.black)
                  : TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(height: 3),
            Text(
              '${calendar.title}',
              textAlign: TextAlign.center,
              style: selected
              ? TextStyle(fontSize: 15, color: Color(0xFF021333).withOpacity(0.45))
              : TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.45)),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeButton extends StatelessWidget {
  final TimeData timeData;
  final Function onPressed;
  final bool selected;

  const TimeButton({this.timeData, this.onPressed, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          border: Border.all(
            color: selected? yellow : Colors.white.withOpacity(0.25), width: 2.0,
          ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${timeData.date}',
              textAlign: TextAlign.center,
              style: selected
                  ? TextStyle(fontSize: 25, color: yellow)
                  : TextStyle(fontSize: 25, color: Colors.white.withOpacity(0.50)),
            ),
            SizedBox(height: 3),
            Text(
              '${timeData.price}',
              textAlign: TextAlign.center,
              style: selected
              ? TextStyle(fontSize: 15, color: yellow.withOpacity(0.45))
              : TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.45)),
            ),
          ],
        ),
      ),
    );
  }
}
