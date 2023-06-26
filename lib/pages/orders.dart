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
  static List<List> orderedItems = [];
  static List<String> orderDates = [];
  static List<String> orderImages = [];
  static List<bool> ordervisib = [];

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  fetchOrders() async {
    var orderList = await FirebaseFirestore.instance
        .collection("Users")
        .doc(Login.pn)
        .get();
    var dates = orderList.data()?.keys.toList();
    var orders = orderList.data()?.values.toList();
    // print(orders![0].keys.toList());
    List<List> l1 = [];
    List<String> l2 = [];
    List<String> l3 = [];
    List<bool> visibilty = [];
    Get.lazyPut(() => imageController());
    imageController _imagecontroller = Get.find();
    for (var i = 0; i < dates!.length; i++) {
      List<String> temp = orders![i].keys.toList();
      // print(temp);
      // for (var j = 0; j < temp.length; j++) {
      //   l1.add(temp[j]);
      // }
      l1.add(temp);
      l2.add(dates[i].substring(0, 10));
      visibilty.add(false);
      // print(_imagecontroller.allImagesBurger.indexOf(temp));
    }
    Orders.orderedItems = l1;
    Orders.orderDates = l2;
    Orders.ordervisib = visibilty;
    // print(Orders.orderDates);
    // print(Orders.orderedItems);
    // print(Orders.ordervisib);
  }

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
                // Your Orders Banner
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Your",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w700, color: primaryRed),
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
                          fontSize: 22, fontWeight: FontWeight.w700, color: primaryRed
                      ),
                    ),
                  ],
                ),

                const Padding(padding: EdgeInsets.only(bottom: 20)),
                Column(
                  children: <Widget>[
                    for (int i = 0; i < Orders.orderDates.length; i++) ...[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                            Border.all(color: primaryBorderDarkWhite, width: 0.4),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xFFB9B9B9),
                                  blurRadius: 6,
                                  offset: Offset(
                                    0,
                                    6,
                                  ))
                                ]
                            ),
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Column(
                        children:[
                          Container(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage("images/burger_image.png"),
                                  height: 100,
                                  width: 100,
                                ),
                                const Padding(padding: EdgeInsets.only(left: 20)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(padding: EdgeInsets.only(left: 0)),
                                    Text(
                                      Orders.orderedItems[i][0],
                                      style: const TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w500),
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
                                          Orders.orderDates[i],
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
                          if (Orders.ordervisib[i] == false && Orders.orderedItems[i].length > 1) ...[
                            // 1st item
                            Container(
                              // alignment: Alignment.topCenter,
                              width: MediaQuery.of(context).size.width,
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
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () {
                                  Orders.ordervisib[i] = true;
                                  setState(() {});
                                },
                              ),
                            )
                          ] else if (Orders.ordervisib[i] == true && Orders.orderedItems[i].length > 1) ...[
                            for (int j = 1; j < Orders.orderedItems[i].length; j++) ...[
                              // border line between two items in the same order
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 0.5,
                                color: primaryBorderDarkWhite,
                              ),
                              // order item
                              Container(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage("images/burger_image.png"),
                                      height: 100,
                                      width: 100,
                                    ),
                                    const Padding(padding: EdgeInsets.only(left: 20)),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.only(left: 0)),
                                        Text(
                                          Orders.orderedItems[i][j],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.left,
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 0)),
                                        Row(
                                          children: [
                                            const Text(
                                              "Ordered On : ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              Orders.orderDates[i],
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
                            ],
                            // Container for Hide Box
                            Container(
                              // alignment: Alignment.topCenter,
                              width: MediaQuery.of(context).size.width,
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
                                      fontSize: 16,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () {
                                  Orders.ordervisib[i] = false;
                                  setState(() {});
                                },
                              ),
                            )
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
