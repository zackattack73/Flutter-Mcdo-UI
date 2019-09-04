import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 236, 222,1),
        body: Stack(children: [
      Positioned(
          top: 60.0,
          child: Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            width: MediaQuery.of(context).size.width,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/US.png',
                  height: 29,
                  fit: BoxFit.cover,
                ),
              )
            ]),
          )),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              height: 90.0,
              fit: BoxFit.cover,
            ),
            Text("Where will you be eating today ?",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Row(children: <Widget>[
              Spacer(flex: 5),
              ButtonTheme(
                  minWidth: 100.0,
                  height: 125.0,
                  child: RaisedButton(
                      color: Colors.white,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/in.png',
                              height: 80.0,
                              width: 80.0,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10.0),
                            Text("Eat In",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ]),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0)))),
              Spacer(),
              ButtonTheme(
                  minWidth: 100.0,
                  height: 125.0,
                  child: RaisedButton(
                      color: Colors.white,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/out.png',
                              height: 80.0,
                              width: 80.0,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10.0),
                            Text("Take Out",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ]),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0)))),
              Spacer(flex: 5),
            ]),
          ],
        ),
      ),
    ]));
  }
}
