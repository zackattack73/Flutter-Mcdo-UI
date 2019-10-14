import 'package:flutter/material.dart';
import 'cart.dart';

class Payment extends StatefulWidget {
  final cart;
  final type; // Eat in or Take out

  Payment({this.cart, this.type});

  @override
  _MyPaymentState createState() => _MyPaymentState();
}

class _MyPaymentState extends State<Payment> {
  List<Cart> itemCart = [];
  void initState() {
    super.initState();
    itemCart = widget.cart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(43, 124, 58, 1),
        body: Stack(
          children: <Widget>[
            Positioned(
                top: 40.0,
                child: Container(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButton(),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 90),
                Center(
                    child: Image.asset(
                  'assets/logo.png',
                  height: 60.0,
                  fit: BoxFit.cover,
                )),
                SizedBox(height: 15),
                Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("My",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white)),
                          Text("Order",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white)),
                          SizedBox(height: 7),
                          Text(widget.type,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white))
                        ])),
                SizedBox(height: 15),
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
                )),
                SizedBox(height: 10),
                Center(child:
                ButtonTheme(
                    minWidth: 50.0,
                    height: 50.0,
                    child: RaisedButton(
                        color: Color.fromRGBO(230, 203, 51, 1),
                        child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: <Widget>[
                              FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text("Payment",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 20)))
                            ]),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            new BorderRadius.circular(30.0))))),
                SizedBox(height: 10),
              ],
            )
          ],
        ));
  }

  Widget listItem(int position) {
    return Row(
        children: <Widget>[
          SizedBox(width: 15),
          CircleAvatar(backgroundColor: Colors.white,radius: 35,child: Image.asset(
            itemCart[position].img,
          ),),

          SizedBox(width: 20),
          FittedBox(
              fit: BoxFit.fitWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(itemCart[position].name,
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                  SizedBox(height: 5),
                  Text("\$" + itemCart[position].getTotalPrice().toString(),style: TextStyle(color: Colors.white),)
                ],
              )),
          Spacer(),
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
              SizedBox(width: 10),
              Text(
                itemCart[position].qtt.toString(),
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(width: 10),
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
          ),SizedBox(width: 10)
        ]);
  }
}
