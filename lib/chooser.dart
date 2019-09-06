import 'package:flutter/material.dart';
import 'item.dart';
class Chooser extends StatefulWidget {
  final type; // Eat in or Take out

  Chooser({this.type});

  @override
  _MyChooserState createState() => _MyChooserState();
}

class _MyChooserState extends State<Chooser> {
  List<Item> itemMenu = [];
  void initState() {
    super.initState();
    Item i1 = new Item("Combo Meal","assets/combo.png");
    Item i2 = new Item("Burgers","assets/burgers.png");
    Item i3 = new Item("Happy Meal","assets/meal.png");
    Item i4 = new Item("Dummy","assets/in.png");
    itemMenu.add(i1);
    itemMenu.add(i2);
    itemMenu.add(i3);
    itemMenu.add(i4);
    itemMenu.add(i4);
    itemMenu.add(i4);
    itemMenu.add(i4);
  }


  double total = 0.00;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 100),
                  Container(
                    // Top text
                    margin: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Hey,",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                        Text("what's up ?", style: TextStyle(fontSize: 25)),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Expanded(
                          child: GridView.count(
                              crossAxisCount: 3,
                              scrollDirection: Axis.horizontal,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              padding: const EdgeInsets.all(10),
                              children: List.generate(itemMenu.length, (index) {
                                return Center(
                                    child: ButtonTheme(
                                        child: RaisedButton(
                                            splashColor:
                                                Color.fromRGBO(230, 203, 51, 1),
                                            color: (index != 0)
                                                ? Colors.white
                                                : Color.fromRGBO(
                                                    201, 22, 25, 1),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Spacer(),
                                                  Image.asset(
                                                    itemMenu[index].img,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  Spacer(),
                                                  FittedBox(fit:BoxFit.fitWidth,
                                                      child: Text(itemMenu[index].name,
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold)))
                                                  ,Spacer(),

                                                ]),
                                            onPressed: () {},
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        20.0)))));
                              })),flex: 2),
                  Container(
                    // Bottom Text
                    margin: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text("Popular",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Expanded(
                      child: GridView.count(
                          crossAxisCount: 2,
                          scrollDirection: Axis.horizontal,
                          children: List.generate(9, (index) {
                            return Center(
                                child: ButtonTheme(
                                    child: FlatButton(
                                        color: Colors.white,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Image.asset(
                                                'assets/logo.png',
                                                fit: BoxFit.cover,
                                              ),
                                              Text("Name")
                                            ]),
                                        onPressed: () {},
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    20.0)))));
                          })),flex: 1,)
                ],
              ),
            ),
            flex: 3,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.green),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.blue),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 100,
                              ),
                              Text("My",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19)),
                              Text("Order",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19)),
                              SizedBox(height: 7),
                              Text(widget.type, style: TextStyle(fontSize: 14))
                            ]),
                      ),
                      flex: 3,
                    ),
                    Expanded(
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(246, 246, 246, 1)),
                          child: Center(
                              child: Column(children: <Widget>[
                            SizedBox(height: 5),
                            Text("Total", style: TextStyle(fontSize: 14)),
                            SizedBox(height: 5),
                            Text("\$" + total.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30)),
                            Spacer(),
                            ButtonTheme(
                                minWidth: 100.0,
                                height: 100.0,
                                child: RaisedButton(
                                    color: Color.fromRGBO(230, 203, 51, 1),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          FittedBox(fit:BoxFit.fitWidth,
                                              child: Text("Done",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,fontSize: 20)))
                                        ]),
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)))),
                            Spacer(),
                          ]))),
                      flex: 1,
                    ),
                  ]),
            ),
            flex: 2,
          ),
        ],
      ),
      Positioned(
          top: 40.0,
          child: Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/US.png',
                      height: 25,
                      fit: BoxFit.cover,
                    ),
                  )
                ]),
          )),
    ]));
  }
}
