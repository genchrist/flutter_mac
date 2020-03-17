import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer _everysecond;
  DateTime _now;
  int _second;
  double _minute;
  double _hour;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _now = DateTime.now();
    _everysecond = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _now = DateTime.now();
        _second = _now.second;
        _minute = _now.minute + (_second / 60);
        _hour = _now.hour + (_minute / 60);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150)),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(150)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: <Widget>[
                        Align(
                            alignment: Alignment(0, -1),
                            child: Text(
                              '12',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            )),
                        Align(
                            alignment: Alignment(0, 1),
                            child: Text(
                              '6',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            )),
                        Align(
                            alignment: Alignment(1, 0),
                            child: Text(
                              '3',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            )),
                        Align(
                            alignment: Alignment(-1, 0),
                            child: Text(
                              '9',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            )),
                        Transform.rotate(
                          angle: pi + (5 - 15) * (pi / 30),
                          alignment: FractionalOffset.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 2.5,
                                width: 5,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 2.5,
                                width: 5,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        Transform.rotate(
                          angle: pi + (10 - 15) * (pi / 30),
                          alignment: FractionalOffset.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 2.5,
                                width: 5,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 2.5,
                                width: 5,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        Transform.rotate(
                          angle: pi + (20 - 15) * (pi / 30),
                          alignment: FractionalOffset.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 2.5,
                                width: 5,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 2.5,
                                width: 5,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        Transform.rotate(
                          angle: pi + (25 - 15) * (pi / 30),
                          alignment: FractionalOffset.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 2.5,
                                width: 5,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 2.5,
                                width: 5,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        Transform.rotate(
                          angle: pi + (_second - 15) * (pi / 30),
                          alignment: FractionalOffset.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.5)),
                                  child: Container(
                                    height: 2.5,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(2.5)),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 2.5,
                                  color: Colors.transparent,
                                ),
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red),
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: pi + (_minute - 15) * (pi / 30),
                          alignment: FractionalOffset.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 5,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(37.5)),
                            child: Container(
                              height: 37.5,
                              width: 75 / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(75 / 2),
                                  color: Colors.blue),
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: pi +
                              ((_hour > 11.59)
                                  ? (_hour - 12 - 3) * (pi / 6)
                                  : (_hour - 3) * (pi / 6)),
                          alignment: FractionalOffset.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 10 / 2,
                                  color: Colors.transparent,
                                  width: 20 / 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        height: 10 / 2,
                                        width: 90 / 2,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(10 / 2)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 10 / 2,
                                  color: Colors.transparent,
                                ),
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Card(
                            elevation: 5,
                            color: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50 / 2)),
                            child: Container(
                              height: 50 / 2,
                              width: 50 / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50 / 2),
                                  color: Colors.amber),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      (_now.weekday == 1)
                          ? 'Monday, ${_now.day.toString()}'
                          : (_now.weekday == 2)
                              ? 'Tuesday, ${_now.day.toString()}'
                              : (_now.weekday == 3)
                                  ? 'Wednesday, ${_now.day.toString()}'
                                  : (_now.weekday == 4)
                                      ? 'Thursday, ${_now.day.toString()}'
                                      : (_now.weekday == 5)
                                          ? 'Friday, ${_now.day.toString()}'
                                          : (_now.weekday == 6)
                                              ? 'Saturday, ${_now.day.toString()}'
                                              : 'Sunday, ${_now.day.toString()}',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      (_now.month == 1)
                          ? 'January, ${_now.year.toString()}'
                          : (_now.month == 2)
                              ? 'February, ${_now.year.toString()}'
                              : (_now.month == 3)
                                  ? 'March, ${_now.year.toString()}'
                                  : (_now.month == 4)
                                      ? 'April, ${_now.year.toString()}'
                                      : (_now.month == 5)
                                          ? 'May, ${_now.year.toString()}'
                                          : (_now.month == 6)
                                              ? 'June, ${_now.year.toString()}'
                                              : (_now.month == 7)
                                                  ? 'July, ${_now.year.toString()}'
                                                  : (_now.month == 8)
                                                      ? 'August, ${_now.year.toString()}'
                                                      : (_now.month == 9)
                                                          ? 'September, ${_now.year.toString()}'
                                                          : (_now.month == 10)
                                                              ? 'October, ${_now.year.toString()}'
                                                              : (_now.month ==
                                                                      11)
                                                                  ? 'November, ${_now.year.toString()}'
                                                                  : 'December, ${_now.year.toString()}',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
