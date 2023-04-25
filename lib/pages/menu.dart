import 'package:flutter/material.dart';
import 'package:pizza_planet/components/widgets.dart';
import 'package:pizza_planet/utils.dart';
import 'package:pizza_planet/pages/home.dart';
import 'package:provider/provider.dart';
import '../cartProvider/provider.dart';
import 'package:pizza_planet/image_controller.dart';
import 'package:get/get.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var category = ["Pizza", "Burger", "Garlic_Bread"];
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => imageController());
    imageController _imagecontroller = Get.find();
    List<String> cartItems = Provider.of<CartProvider>(context).cartItems;
    List<int> quantity = Provider.of<CartProvider>(context).quantity;
    List<int> price = Provider.of<CartProvider>(context).price;

    totLength() {
      if (Home.onlyVeg == true) {
        var temp = 0;
        for (String i in Home.pizzasType) {
          if (i == 'Vegetarian') {
            temp++;
          }
        }
        return (118 * temp).toDouble();
      } else {
        return (118 * Home.pizzasName.length).toDouble();
      }
    }

    if (Home.pizza == true) {
      Home.pizza = false;
      return DefaultTabController(
          length: 3,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: appBarMenu('PIZZAS'),
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
                  SizedBox(
                    height: 50,
                    child: AppBar(
                      backgroundColor: Colors.white,
                      bottom: TabBar(
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFE84000),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xFFB9B9B9),
                                    blurRadius: 3,
                                    offset: Offset(
                                      0,
                                      3,
                                    ))
                              ]),
                          indicatorColor: primaryRed,
                          labelColor: Colors.white,
                          unselectedLabelColor: primaryBlack,
                          labelStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.25),
                          unselectedLabelStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          tabs: const [
                            Tab(
                              text: "Regular",
                            ),
                            Tab(
                              text: "Medium",
                            ),
                            Tab(
                              text: "Large",
                            )
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 5.0,
                      maxHeight: totLength(),
                    ),
                    child: TabBarView(
                      children: [
                        for (var tabIndex = 0; tabIndex < 3; tabIndex++) ...[
                          Column(children: [
                            for (int j = 0;
                                j < Home.pizzasImages.length;
                                j++) ...[
                              if (Home.onlyVeg == true) ...[
                                if (Home.pizzasType[j] == 'Vegetarian') ...[
                                  menuItem(
                                      context,
                                      _imagecontroller.allImagesPizza[j],
                                      Home.pizzasName[j],
                                      Home.pizzasType[j],
                                      Home.pizzasCosts[j][tabIndex],
                                      Home.pizzasAvl[j],
                                      "pizza"),
                                ]
                              ] else ...[
                                menuItem(
                                    context,
                                    _imagecontroller.allImagesPizza[j],
                                    Home.pizzasName[j],
                                    Home.pizzasType[j],
                                    Home.pizzasCosts[j][tabIndex],
                                    Home.pizzasAvl[j],
                                    "pizza"),
                              ]
                            ],
                          ]),
                        ]
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ));
    } else if (Home.burger == true) {
      Home.burger = false;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBarMenu('BURGERS'),
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
              for (int j = 0; j < Home.burgerName.length; j++) ...[
                if (Home.onlyVeg == true) ...[
                  if (Home.burgerType[j] == 'Vegetarian')
                    menuItem(
                        context,
                        _imagecontroller.allImagesBurger[j],
                        Home.burgerName[j],
                        Home.burgerType[j],
                        Home.burgerCosts[j],
                        Home.burgerAvl[j],
                        "burger"),
                ] else ...[
                  menuItem(
                      context,
                      _imagecontroller.allImagesBurger[j],
                      Home.burgerName[j],
                      Home.burgerType[j],
                      Home.burgerCosts[j],
                      Home.burgerAvl[j],
                      "burger"),
                ]
              ],
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );
    } else {
      Home.garlicBread = false;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBarMenu('BREADS'),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              height: 300,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: const Image(
                image: AssetImage('images/menu_garlic_bread.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10)),
            for (int j = 0; j < Home.breadName.length; j++) ...[
              if (Home.onlyVeg == true) ...[
                if (Home.breadType[j] == 'Vegetarian') ...[
                  menuItem(
                      context,
                      _imagecontroller.allImagesBreads[j],
                      Home.breadName[j],
                      Home.breadType[j],
                      Home.breadCosts[j],
                      Home.breadAvl[j],
                      "bread"),
                ]
              ] else ...[
                menuItem(
                    context,
                    _imagecontroller.allImagesBreads[j],
                    Home.breadName[j],
                    Home.breadType[j],
                    Home.breadCosts[j],
                    Home.breadAvl[j],
                    "bread"),
              ]
            ],
            const SizedBox(
              height: 20,
            )
          ]),
        ),
      );
    }
  }
}