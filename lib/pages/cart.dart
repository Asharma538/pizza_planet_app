import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pizza_planet/components/widgets.dart';
import 'package:pizza_planet/main_screen.dart';
import 'package:pizza_planet/pages/home.dart';
import 'package:pizza_planet/utils.dart';

funky(l1,l2){
 num tot=0;
  for (var i=0;i<l1.length;i++){
    tot += l1[i]*l2[i];
  }
  return tot;
}

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var quantity=[2];
  var price=[3];
  var items = ["Margherita Pizza","Aloo tikki Burger"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ghostWhite,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 35, 0, 10),
            margin: const EdgeInsets.only(bottom: 15),
            alignment: Alignment.center,
            child: const Text(
              "ITEM(S) ADDED",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.9,
            height: 100,
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 14),
            decoration: BoxDecoration(
            border: Border.all(
                color: const Color(0xFFB2B2B2),
                width: 1,
            ),
                borderRadius: BorderRadius.circular(5)
            ),
            child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      items[0],
                      style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    "\$ ${price[0]}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(height: 13,),
                  const Text(
                    "Remove",
                    style: TextStyle(
                        color: primaryRed,
                        fontWeight: FontWeight.w700
                    ),
                  )
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.9 - 280,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                    width: 88,
                    decoration: BoxDecoration(
                      border: Border.all(
                      color: Colors.red,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            quantity[0]-=1;
                            late var tot = funky(price, quantity);
                            setState(() {});
                          },
                          child: const Icon(
                            CupertinoIcons.minus,
                            size: 12
                          ),
                        ),
                        const SizedBox(width: 16,),
                        Text(
                          quantity[0].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                          )
                        ),
                        const SizedBox(width: 16,),
                        GestureDetector(
                            onTap: (){
                              quantity[0] += 1;
                              late var tot = funky(price, quantity);
                              setState(() {});
                            },
                            child: const Icon(
                                CupertinoIcons.plus,
                                size: 13,
                            ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                    child: Text(
                      'Total:  \$ ${quantity[0]*price[0]}  ',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.9,
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
            padding: const EdgeInsets.fromLTRB(18, 15, 0, 15),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color(0xFFD3D3D3)
              ),
              borderRadius: BorderRadius.circular(10),
              color: ghostWhite,
              boxShadow: const [
                BoxShadow(
                    color: Color(0xFFB9B9B9),
                    blurRadius: 6,
                    offset: Offset(
                      0,
                      3,
                    )
                ),
              ]
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
              child: Row(
                children: [
                  const Icon(CupertinoIcons.add_circled,weight: 1,),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      // padding: EdgeInsets.fromLTRB(0, 0, MediaQuery.of(context).size.width*0.35, 0),
                      child: const Text(
                          "Add more items",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  Container(width: MediaQuery.of(context).size.width*0.35,height: 25,color: ghostWhite,),
                  const Icon(Icons.chevron_right)
                ],
              )
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: const Text(
              "BILL SUMMARY",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1, color: const Color(0xFFD3D3D3)
              ),
              borderRadius: BorderRadius.circular(5)
            ),
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
            padding : const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Delivery Charges",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.45,),
                    Text(
                      "FREE",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ],
                ),
                Container(width: MediaQuery.of(context).size.width*0.83,height: 1,color: primaryBorderDarkWhite,margin: const EdgeInsets.fromLTRB(0,10,0,10),),
                Row(
                  children: [
                    const Text(
                      "Grand Total",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.50,),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 50,
                      child: Text(
                        '\$ ${funky(price, quantity)}',
                        style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        ),
                        // textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
