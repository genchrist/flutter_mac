import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:jarvis/clock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String brightness;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    (DateTime.now().hour > 15 || DateTime.now().hour < 7)
        ? setState(() {
            brightness = "night";
          })
        : setState(() {
            brightness = "day";
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              brightness == "day" ? Colors.pink[200] : Colors.black,
              brightness == "day" ? Colors.pink[100] : Colors.blueGrey[900],
              brightness == "day" ? Colors.purple[200] : Colors.black
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                brightness == "day"
                    ? FlareActor("assets/simple_day_night.flr",
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        isPaused: false,
                        animation: "day_idle")
                    : FlareActor("assets/simple_day_night.flr",
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        isPaused: false,
                        animation: "night_idle"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Hello Anoop',
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                    Clock(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 50,
                      width: 200,
                      child: GestureDetector(
                        onTap: () {
                          (brightness == "day")
                              ? setState(() {
                                  brightness = "night";
                                })
                              : setState(() {
                                  brightness = "day";
                                });
                          print(brightness);
                        },
                        child: (brightness == "day")
                            ? FlareActor("assets/day_night_switch.flr",
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                isPaused: false,
                                animation: "day_idle")
                            : FlareActor("assets/day_night_switch.flr",
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                isPaused: false,
                                animation: "night_idle"),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
