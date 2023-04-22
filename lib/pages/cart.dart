import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_planet/cartProvider/provider.dart';
import 'package:pizza_planet/pages/login.dart';
import 'package:pizza_planet/main_screen.dart';
import 'package:pizza_planet/utils.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

totalOrderAmount(l1,l2){
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
  @override
  Widget build(BuildContext context) {

    List<String> cartItems = Provider.of<CartProvider>(context).cartItems;
    List<int> quantity = Provider.of<CartProvider>(context).quantity;
    List<int> price = Provider.of<CartProvider>(context).price;

    if (totalOrderAmount(quantity, price)!=0) {
      return Scaffold(
        backgroundColor: ghostWhite,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(child:
        Column(
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
            for (int i = 0; i < quantity.length; i++)
              if (quantity[i] > 0)
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  padding: const EdgeInsets.fromLTRB(18, 14, 18, 14),
                  margin: const EdgeInsets.only(bottom: 10),
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
                            width: 180,
                            child: Text(
                              cartItems[i],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4,),
                          Text(
                            "₹${price[i]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          const SizedBox(height: 13,),
                          GestureDetector(
                            onTap: (){
                              cartItems.removeAt(i);
                              quantity.removeAt(i);
                              price.removeAt(i);
                              setState(() {});
                            },
                            child: const Text(
                              "Remove",
                              style: TextStyle(
                                  color: primaryRed,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          )
                        ],
                      ),
                      const Expanded(child: SizedBox(height: 1,),),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.end,
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
                                  onTap: () {
                                    quantity[i] -= 1;
                                    late var tot = totalOrderAmount(price, quantity);
                                    if (quantity[i]==0){
                                      cartItems.removeAt(i);
                                      quantity.removeAt(i);
                                      price.removeAt(i);
                                    }
                                    setState(() {});
                                  },
                                  child: const Icon(
                                      CupertinoIcons.minus,
                                      size: 12
                                  ),
                                ),
                                const SizedBox(width: 16,),
                                Text(
                                    quantity[i].toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16
                                    )
                                ),
                                const SizedBox(width: 16,),
                                GestureDetector(
                                  onTap: () {
                                    quantity[i] += 1;
                                    late var tot = totalOrderAmount(price, quantity);
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
                              'Total:  ₹${quantity[i] * price[i]}  ',
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
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
              padding: const EdgeInsets.fromLTRB(18, 15, 18, 15),
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
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.add_circled, weight: 1,size: 24,),
                      Container(
                        width: 180,
                        margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                        // padding: EdgeInsets.fromLTRB(0, 0, MediaQuery.of(context).size.width*0.35, 0),
                        child: const Text(
                          "Add more items",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 25,
                          color: ghostWhite,),),
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
                margin: const EdgeInsets.fromLTRB(15, 30, 15, 20),
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 150,
                          child: Text(
                            "Delivery Charges",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const Expanded(child: SizedBox(height: 1,),),
                        SizedBox(
                          child:Text(
                            "FREE",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue.shade900,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SizedBox(width: 8,)
                      ],
                    ),
                    Container(width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.83,
                      height: 1,
                      color: primaryBorderDarkWhite,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),),
                    Row(
                      children: [
                        const SizedBox(
                          width:150,
                          child:Text(
                          "Grand Total",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        ),
                        const Expanded(child: SizedBox(height: 1,),),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Text(
                            '₹${totalOrderAmount(price, quantity)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.end,
                            // textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ),
            const SizedBox(height: 5,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                backgroundColor: primaryBlue,
                shadowColor: primaryBlack,
                splashFactory: InkSplash.splashFactory,
              ),
              onPressed: (){
                var _razorpay = Razorpay();
                var options = {
                  'key': 'rzp_test_0EUUgwunXDm2bC',
                  'amount': 100*totalOrderAmount(price, quantity), //in the smallest currency sub-unit.
                  'name': 'Pizza Planet',
                  'order_id': (Login.pn).toString(), // Generate order_id using Orders API
                  'description': 'Trial order',
                  'timeout': 60, // in seconds
                  'prefill': {
                    'contact': '9826256162',
                    'email': 'sharma.130@iitj.ac.in'
                  }
                };
                _razorpay.open(options);
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.83,
                height: 48,
                child: const Text(
                  "Proceed to payment",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ghostWhite
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,)
          ],
         ),
        ),
      );
    }
    else{
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
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
              padding: const EdgeInsets.fromLTRB(18, 15, 18, 15),
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
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.add_circled, weight: 1,size: 24,),
                      Container(
                        width: 180,
                        margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                        // padding: EdgeInsets.fromLTRB(0, 0, MediaQuery.of(context).size.width*0.35, 0),
                        child: const Text(
                          "Add more items",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 25,
                          color: ghostWhite,),),
                      const Icon(Icons.chevron_right)
                    ],
                  )
              ),
            ),
          ]
        )
      );
    }
  }
}
