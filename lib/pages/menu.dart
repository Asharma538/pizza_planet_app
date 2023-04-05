import 'package:flutter/material.dart';
import 'package:pizza_planet/components/widgets.dart';
import 'package:pizza_planet/utils.dart';
import 'package:pizza_planet/pages/home.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var category = ["Pizza", "Burger", "Garlic_Bread"];
  var Pizza = ["images/pizza_carousel.jpg"];
  var Pizza_name = ["Margherita Pizza"];
  var Pizza_val = ["₹120"];
  var Pizza_type = ["Vegetarian"];
  var Burger = ['images/burger_carousel.jpeg'];
  var Burger_name = ["Aloo Tikki Burger"];
  var Burger_val = ["₹60"];
  var Burger_type = ["Vegetarian"];
  var Garlic_Bread = ['images/garlic_bread.png'];
  var Garlic_Bread_name = ["Veg Cheese Garlic Bread"];
  var Garlic_Bread_val = ["₹105"];
  var Garlic_Bread_type = ["Vegetarian"];
  @override
  Widget build(BuildContext context) {
    if (Home.pizza == true) {
      Home.pizza = false;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarMenu('PIZZA'),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  child: Image(
                    image: AssetImage('images/pizza-3000273_1920.jpg'),
                    fit: BoxFit.fitWidth,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)))),
              Padding(padding: EdgeInsets.only(top: 20, left: 10, right: 10)),
              for (int j = 0; j < Pizza.length; j++)
                Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(left: 10, right: 10),
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
                            image: AssetImage(Pizza[j]),
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 30)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Pizza_name[j],
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    letterSpacing: 0.5)),
                            Text(
                              Pizza_type[j],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 70, 158, 73),
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(
                                  Pizza_val[j],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(padding: EdgeInsets.only(left: 120)),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("+ADD"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryBlue),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ))
            ],
          ),
        ),
      );
    } else if (Home.burger == true) {
      Home.burger = false;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarMenu('BURGER'),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  child: Image(
                    image: AssetImage('images/menu_burger.jpg'),
                    fit: BoxFit.fitWidth,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)))),
              Padding(padding: EdgeInsets.only(top: 20, left: 10, right: 10)),
              for (int j = 0; j < Burger.length; j++)
              Container(
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.only(left: 10, right: 10),
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
                          image: AssetImage(Burger[j]),
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 30)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Burger_name[j],
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  letterSpacing: 0.5)),
                          Text(
                            Burger_type[j],
                            style: TextStyle(
                                color: Color.fromARGB(255, 70, 158, 73),
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Text(
                                Burger_val[j],
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Padding(padding: EdgeInsets.only(left: 120)),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("+ADD"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryBlue),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    } else {
      Home.garlicBread = false;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarMenu('GARLIC BREAD'),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                  child: Image(
                    image: AssetImage('images/menu_garlic_bread.jpg'),
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)))),
              Padding(padding: EdgeInsets.only(top: 20, left: 10, right: 10)),
              for (int j = 0; j < Garlic_Bread.length; j++)
              Container(
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.only(left: 10, right: 10),
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
                        child:  Image(
                          image: AssetImage(Garlic_Bread[j]),
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 30)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Garlic_Bread_name[j],
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  letterSpacing: 0.5)),
                          Text(
                            Garlic_Bread_type[j],
                            style: TextStyle(
                                color: Color.fromARGB(255, 70, 158, 73),
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Text(
                                Garlic_Bread_val[j],
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Padding(padding: EdgeInsets.only(left: 120)),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("+ADD"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryBlue),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    }
  }
}
