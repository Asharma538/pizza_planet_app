import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pizza_planet/components/widgets.dart';
import 'package:pizza_planet/utils.dart';
import 'package:pizza_planet/pages/home.dart';
import 'package:pizza_planet/pages/cart.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var category = ["Pizza", "Burger", "Garlic_Bread"];
  var Pizza = ["images/pizza_carousel.jpg", "images/pizza_carousel.jpg"];
  var Pizza_val = [120, 160];
  var Pizza_type = ["Vegetarian", "Vegeterian"];
  var regular = true;
  var medium = false;
  var large = false;
  @override
  Widget build(BuildContext context) {
    if (Home.pizza == true) {
      Home.pizza = false;
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appBarMenu('pizzasName'),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: const Image(
                      image: AssetImage('images/pizza-3000273_1920.jpg'),
                      fit: BoxFit.fitWidth,
                    )),
                // const Padding(
                //     padding: EdgeInsets.only(top: 20, left: 10, right: 10)),
                SizedBox(
                  height: 50,
                  child: AppBar(
                    backgroundColor: primaryRed,
                    bottom: TabBar(
                        indicatorColor: primaryRed,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .25),
                        unselectedLabelStyle: TextStyle(fontSize: 15),
                        tabs: [
                          Tab(
                            text: "Regular",
                          ),
                          Tab(
                            text: "Medium",
                          ),
                          Tab(
                            text: "Large",
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                for (int j = 0; j < Pizza.length; j++)
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 2, bottom: 5),
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: primaryBorderDarkWhite, width: 0.4),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xFFB9B9B9),
                              blurRadius: 5,
                              offset: Offset(
                                0,
                                3,
                              ))
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Image(
                            image: AssetImage(Pizza[j]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 15)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(Home.pizzasName[j],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: 0.5)),
                            Text(
                              Pizza_type[j],
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 70, 158, 73),
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "₹${Pizza_val[j]}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  width: 125,
                                ),
                                SizedBox(
                                  width: 60,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      var found = false;
                                      for (var ci = 0;
                                          ci < Cart.quantity.length;
                                          ci++) {
                                        if (Cart.cartItems[ci] ==
                                            Home.pizzasName[j]) {
                                          Cart.quantity[ci] += 1;
                                          found = true;
                                          break;
                                        }
                                      }
                                      if (found == false) {
                                        Cart.cartItems.add(Home.pizzasName[j]);
                                        Cart.quantity.add(1);
                                        Cart.price.add(Pizza_val[j]);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryBlue,
                                        padding: EdgeInsets.all(0)),
                                    child: const Text("+ADD"),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      );
    } else if (Home.burger == true) {
      Home.burger = false;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBarMenu('BURGER'),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                  child: const Image(
                    image: AssetImage('images/menu_burger.jpg'),
                    fit: BoxFit.fitWidth,
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10)),
              for (int j = 0; j < Home.burgerName.length; j++)
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    margin:
                        const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: primaryBorderDarkWhite, width: 0.4),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xFFB9B9B9),
                              blurRadius: 5,
                              offset: Offset(
                                0,
                                6,
                              ))
                        ]),
                    child: Row(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Image(
                            image: AssetImage(Home.burgerImages[j]),
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(Home.burgerName[j],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    letterSpacing: 0.5)),
                            if (Home.burgerType[j] == 'Vegetarian') ...[
                              Text(
                                Home.burgerType[j],
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 70, 158, 73),
                                    fontWeight: FontWeight.w500),
                              ),
                            ] else ...[
                              Text(
                                Home.burgerType[j],
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 204, 14, 14),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                            Row(
                              children: [
                                Text(
                                  "₹${Home.burgerCosts[j]}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 120,
                                ),
                                SizedBox(
                                  width: 60,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      var found = false;
                                      for (var ci = 0;
                                          ci < Cart.quantity.length;
                                          ci++) {
                                        if (Cart.cartItems[ci] ==
                                            Home.burgerName[j]) {
                                          Cart.quantity[ci] += 1;
                                          found = true;
                                          break;
                                        }
                                      }
                                      if (found == false) {
                                        Cart.cartItems.add(Home.burgerName[j]);
                                        Cart.quantity.add(1);
                                        Cart.price.add(Home.burgerCosts[j]);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryBlue,
                                        padding: EdgeInsets.all(0)),
                                    child: const Text("+ADD"),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            )
                          ],
                        )
                      ],
                    )),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );
    } else if (Home.garlicBread == true) {
      Home.garlicBread = false;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBarMenu('GARLIC BREAD'),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: 300,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                  child: const Image(
                    image: AssetImage('images/menu_garlic_bread.jpg'),
                    fit: BoxFit.fill,
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10)),
              for (int j = 0; j < Home.breadName.length; j++)
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  margin:
                      const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: primaryBorderDarkWhite, width: 0.4),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xFFB9B9B9),
                            blurRadius: 5,
                            offset: Offset(
                              0,
                              6,
                            ))
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Image(
                          image: AssetImage(Home.breadImages[j]),
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 30)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(Home.breadName[j],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  letterSpacing: 0.5)),
                          if (Home.breadType[j] == 'Vegetarian') ...[
                            Text(
                              Home.breadType[j],
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 70, 158, 73),
                                  fontWeight: FontWeight.w500),
                            ),
                          ] else ...[
                            Text(
                              Home.breadType[j],
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 204, 14, 14),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                          Row(
                            children: [
                              Text(
                                "₹${Home.breadCosts[j]}",
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(left: 120)),
                              SizedBox(
                                width: 60,
                                child: ElevatedButton(
                                  onPressed: () {
                                    var found = false;
                                    for (var ci = 0;
                                        ci < Cart.quantity.length;
                                        ci++) {
                                      if (Cart.cartItems[ci] ==
                                          Home.breadName[j]) {
                                        Cart.quantity[ci] += 1;
                                        found = true;
                                        break;
                                      }
                                    }
                                    if (found == false) {
                                      Cart.cartItems.add(Home.breadName[j]);
                                      Cart.quantity.add(1);
                                      Cart.price.add(Home.breadCosts[j]);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryBlue,
                                      padding: EdgeInsets.all(0)),
                                  child: const Text("+ADD"),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );
    }
    return Text('');
  }
}
