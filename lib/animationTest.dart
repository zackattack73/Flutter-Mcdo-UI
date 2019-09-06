import 'package:flutter/material.dart';
import 'dart:math';

class Anim extends StatefulWidget {

  @override
  _AnimState createState() => _AnimState();
}

class _AnimState extends State<Anim> {
  double _width = 200;
  double _height = 200;
  double _width2 = 200;
  double _height2 = 200;
  int _axis = 3;
  int _axis2 = 3;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body : Center(
      child:
      Column(children: <Widget>[      AnimatedContainer(
        // Use the properties stored in the State class.
        width: _width2,
        height: _height2,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: _borderRadius,
        ),
        // Define how long the animation should take.
        duration: Duration(seconds: 1),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastOutSlowIn,
        child: GridView.count(
            crossAxisCount: _axis2,
            scrollDirection: Axis.horizontal,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(10),
            children: List.generate(9, (index) {
              return Center(
                  child: ButtonTheme(
                    //(index==0)?
                      child: RaisedButton(
                          splashColor: Color.fromRGBO(230, 203, 51, 1),
                          color: (index!=0)?Colors.white:Color.fromRGBO(201, 22, 25, 1),
                          child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/in.png',
                                  fit: BoxFit.cover,
                                ),
                                Text("Eat In",
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold))
                              ]),
                          onPressed: () {



                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              new BorderRadius.circular(
                                  20.0)))));
            })),
      ),

        AnimatedContainer(
          // Use the properties stored in the State class.
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          // Define how long the animation should take.
          duration: Duration(seconds: 1),
          // Provide an optional curve to make the animation feel smoother.
          curve: Curves.fastOutSlowIn,
          child: GridView.count(
              crossAxisCount: _axis,
              scrollDirection: Axis.horizontal,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(10),
              children: List.generate(9, (index) {
                return Center(
                    child: ButtonTheme(
                      //(index==0)?
                        child: RaisedButton(
                            splashColor: Color.fromRGBO(230, 203, 51, 1),
                            color: (index!=0)?Colors.white:Color.fromRGBO(201, 22, 25, 1),
                            child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/in.png',
                                    fit: BoxFit.cover,
                                  ),
                                  Text("Eat In",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold))
                                ]),
                            onPressed: () {



                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                new BorderRadius.circular(
                                    20.0)))));
              })),
        ),



      ])

    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        // When the user taps the button
        onPressed: () {
          // Use setState to rebuild the widget with new values.
          setState(() {
            // Create a random number generator.
            final random = Random();

            // Generate a random width and height.
            _height = _height -50;
            _axis = _axis +1;
            _height2 = _height2 +50;
            _axis2 = _axis2 -1;

            // Generate a random color.
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );

            // Generate a random border radius.
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
      ),
    );



  }}