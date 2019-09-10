import 'package:flutter/material.dart';
import 'item.dart';
import 'cart.dart';
import 'package:fluro/fluro.dart';
import 'payment.dart';

class Chooser extends StatefulWidget {
  final type; // Eat in or Take out

  Chooser({this.type});

  @override
  _MyChooserState createState() => _MyChooserState();
}

class _MyChooserState extends State<Chooser> {
  List<Item> itemMenu = [];
  List<Cart> itemCart = [];
  void initState() {
    super.initState();
    Item i1 = new Item("Combo Meal", "assets/combo.png");
    Item i2 = new Item("Burgers", "assets/burgers.png");
    Item i3 = new Item("Happy Meal", "assets/meal.png");
    Item i4 = new Item("Dummy", "assets/in.png");
    itemMenu.add(i1);
    itemMenu.add(i2);
    itemMenu.add(i3);
    itemMenu.add(i4);
    itemMenu.add(i4);
    itemMenu.add(i4);
    itemMenu.add(i4);

    Cart c1 = new Cart("Meal", "assets/combo.png", 7.25, 1);
    Cart c2 = new Cart("Happy Meal", "assets/meal.png", 4.00, 1);
    Cart c3 = new Cart("Big Mac", "assets/burgers.png", 2.75, 1);
    Cart c4 = new Cart("Dummy", "assets/in.png", 3.25, 1);
    itemCart.add(c1);
    itemCart.add(c2);
    itemCart.add(c3);
    itemCart.add(c4);
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
                                            : Color.fromRGBO(201, 22, 25, 1),
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
                                              FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                      itemMenu[index].name,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              Spacer(),
                                            ]),
                                        onPressed: () {},
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    20.0)))));
                          })),
                      flex: 2),
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
                                            Spacer(),
                                            Image.asset(
                                              'assets/logo.png',
                                              fit: BoxFit.cover,
                                            ),
                                            Text("Name"),
                                            Spacer(),
                                            Text(
                                              "\$2.79",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      230, 203, 51, 1)),
                                            ),
                                            Spacer(),
                                          ]),
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(
                                                  20.0)))));
                        })),
                    flex: 1,
                  )
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
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(246, 246, 246, 1)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 100,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("My",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19)),
                                        Text("Order",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19)),
                                        SizedBox(height: 7),
                                        Text(widget.type,
                                            style: TextStyle(fontSize: 14))
                                      ])),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.black26,
                                indent: 10,
                                endIndent: 10,
                                height: 5,
                              ),
                              Expanded(
                                  child: ListView.separated(
                                itemCount: itemCart.length,
                                separatorBuilder: (context, index) => Divider(
                                  color: Colors.black26,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                itemBuilder: (context, position) {
                                  return listItem(position);
                                },
                              ))
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
                            Divider(
                              color: Colors.black26,
                              indent: 10,
                            ),
                            SizedBox(height: 5),
                            Text("Total", style: TextStyle(fontSize: 14)),
                            SizedBox(height: 5),
                            getTotal(),
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
                                          FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text("Done",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20)))
                                        ]),
                                    onPressed: () {
                                      Navigation.initPaths(itemCart,widget.type);
                                      Navigation.router.navigateTo(context, 'payment',
                                          transition: TransitionType.fadeIn);
                                    },
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

  Widget listItem(int position) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            itemCart[position].img,
            fit: BoxFit.contain,
          ),
          FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(itemCart[position].name,
                  style: TextStyle(fontWeight: FontWeight.bold))),
          Text("\$" + itemCart[position].getTotalPrice().toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ButtonTheme(
                  minWidth: 20.0,
                  height: 25.0,
                  buttonColor: Color.fromRGBO(246, 246, 246, 1),
                  child: RaisedButton(
                      child: Text("-"),
                      onPressed: () {
                        setState(() {
                          itemCart[position].remove();
                          if (itemCart[position].qtt <= 0) {
                            itemCart.removeAt(position);
                          }
                        });
                      }),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0))),
              Text(
                itemCart[position].qtt.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ButtonTheme(
                  minWidth: 20.0,
                  height: 25.0,
                  buttonColor: Color.fromRGBO(230, 203, 51, 1),
                  child: RaisedButton(
                      child: Text("+"),
                      onPressed: () {
                        setState(() {
                          itemCart[position].add();
                        });
                      }),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0))),
            ],
          )
        ]);
  }

  Widget getTotal() {
    int i = 0;
    double total = 0.0;
    while (i < itemCart.length) {
      total = total + itemCart[i].getTotalPrice();
      i++;
    }
    return Text("\$" + total.toString(),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25));
  }
}
class Navigation {
  static Router router;

  static void initPaths(itemCart,type) {
    router = Router()
      ..define('/', handler: Handler(
          handlerFunc: (BuildContext context, Map<String, dynamic> params) {
            return Chooser();
          }))
      ..define('payment', handler: Handler(
          handlerFunc: (BuildContext context, Map<String, dynamic> params) {
            return Payment(cart : itemCart, type : type);
          }));
  }

}
