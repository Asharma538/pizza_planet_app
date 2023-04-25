import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pizza_planet/utils.dart';
import 'package:advanced_search/advanced_search.dart';

import '../image_controller.dart';
import 'login.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);
  static List<String> orderedItems = [];
  static List<String> orderDates = [];
  static List<String> orderImages = [];

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  fetchOrders() async{
    // var orderList = await FirebaseFirestore.instance.collection("Users").doc(Login.pn).get();
    // var dates = orderList.data()?.keys.toList();
    // var orders = orderList.data()?.values.toList();
    // List<String> l1=[];
    // List<String> l2=[];
    // List<String> l3=[];
    // Get.lazyPut(() => imageController());
    // imageController _imagecontroller = Get.find();
    // for (var i=0;i<dates!.length;i++){
    //   var temp = orders![i].keys.toList()[0];
    //   l1.add(temp);
    //   l2.add(dates[i].substring(0,10));
    //   print(_imagecontroller.allImagesBurger.indexOf(temp));
    // }
    // Orders.orderedItems = l1;
    // Orders.orderDates = l2;
    // print(Orders.orderDates);
    // print(Orders.orderedItems);
  }
  var itemName = [
    ["Corn Pizza", "Garlic Bread"],
    ["Aloo Tikki Burger"],
    ["Cheese Pizza"]
  ];
  var dates = ["02-02-23", "23-02-23", "04-03-23"];
  var image = [
    ["images/pizza_image.png", "images/garlic_bread.png"],
    ["images/burger_image.png"],
    ["images/pizza_image.png"]
  ];
  var visib = false;
  var hide = false;

  @override
  Widget build(BuildContext context) {
    fetchOrders();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Your",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: primaryRed),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 120,
                  child: Image(
                    image: AssetImage("images/delivery_boy-transformed.png"),
                    // fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Orders",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: primaryRed),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            Column(
              children: <Widget>[
                for (int i = 0; i < image.length; i++) ...[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: primaryBorderDarkWhite, width: 0.4),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xFFB9B9B9),
                              blurRadius: 6,
                              offset: Offset(
                                0,
                                6,
                              ))
                        ]),
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(image[i][0]),
                                height: 100,
                                width: 100,
                              ),
                              const Padding(padding: EdgeInsets.only(left: 20)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(padding: EdgeInsets.only(left: 0)),
                                  Text(
                                    itemName[i][0],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.left,
                                  ),
                                  const Padding(padding: EdgeInsets.only(left: 0)),
                                  Row(
                                    children: [
                                      const Text(
                                        "Ordered On : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        dates[i],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        if (visib == false &&
                            image[i].length > 1) ...[
                          Container(
                            alignment: Alignment.topCenter,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadiusDirectional.only(
                                  bottomEnd: Radius.circular(10),
                                  bottomStart: Radius.circular(10)),
                            ),
                            child: GestureDetector(
                              child: const Text(
                                "More",
                                style: TextStyle(
                                    // color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 16,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w600),
                              ),
                              onTap: () {
                                visib = true;
                                setState(() {});
                              },
                            ),
                          )
                        ] else if (visib == true &&
                            image[i].length > 1 ) ...[
                          for (int j = 1; j < image[i].length; j++) ...[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 0.5,
                              color: primaryBorderDarkWhite,
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                              child: Row(
                                children: [
                                  Image(
                                    image: AssetImage(image[i][j]),
                                    height: 100,
                                    width: 100,
                                  ),
                                  const Padding(padding: EdgeInsets.only(left: 20)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(padding: EdgeInsets.only(left: 0)),
                                      Text(
                                        itemName[i][j],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                      const Padding(padding: EdgeInsets.only(left: 0)),
                                      Row(
                                        children: [
                                          const Text(
                                            "Ordered On : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            dates[i],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                // border: Border.all(
                                //     color: primaryBorderDarkWhite, width: 0.4),
                                borderRadius: BorderRadiusDirectional.only(
                                    bottomEnd: Radius.circular(10),
                                    bottomStart: Radius.circular(10)),
                              ),
                              child: GestureDetector(
                                child: const Text(
                                  "Hide",
                                  style: TextStyle(
                                      // color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 16,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w600),
                                ),
                                onTap: () {
                                  visib = false;
                                  setState(() {});
                                },
                              ),
                            )
                          ]
                        ]
                      ]
                    ),
                  ),
                ]
              ],
            )
          ],
        )
      )
    );
  }
}
