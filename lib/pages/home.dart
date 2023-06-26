import 'package:flutter/material.dart';
import 'package:pizza_planet/pages/login.dart';
import 'package:pizza_planet/pages/menu.dart';
import 'package:pizza_planet/utils.dart';
import 'package:pizza_planet/components/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  // Category choosing variable
  static bool pizza = false;
  static bool burger = false;
  static bool garlicBread = false;

  // Item details
  static List<String> pizzasName = [];
  static List<dynamic> pizzasDesc = [];
  static List<dynamic> pizzasCosts = [];
  static List<dynamic> pizzasType = [];
  static List<dynamic> pizzasImages = [];
  static List<dynamic> pizzasAvl = [];

  static List<String> burgerName = [];
  static List<dynamic> burgerDesc = [];
  static List<dynamic> burgerCosts = [];
  static List<dynamic> burgerType = [];
  static List<dynamic> burgerImages = [];
  static List<dynamic> burgerAvl = [];

  static List<String> breadName = [];
  static List<dynamic> breadDesc = [];
  static List<dynamic> breadCosts = [];
  static List<dynamic> breadType = [];
  static List<dynamic> breadImages = [];
  static List<dynamic> breadAvl = [];

  // Only veg toggle
  static bool onlyVeg = false;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;

  // Carousel
  List<String> carouselImages = [
    "images/pizza_carousel.jpg",
    "images/burger_carousel.jpeg",
    "images/bread_carousel.jpeg"
  ];
  List<String> carouselItems = [
    "Margheritta Pizza",
    "Aloo Tikki Burger",
    "Cheese Dip Garlic bread"
  ];
  List<String> carouselCosts = ["₹180", "₹60", "₹125"];
  List<String> carouselItemType = ["Veg", "Veg", "Veg"];

  // Categories
  List<String> menu = [
    "Pizza",
    "Burger",
    "Garlic Bread",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    fetchPizzas() async {
      var instance1 = FirebaseFirestore.instance;
      final docRef = instance1.collection("Menu").doc("Pizzas");
      await docRef.get().then((DocumentSnapshot snapshot) {
        final data = snapshot.data() as Map<String, dynamic>;
        Home.pizzasName = (data.keys).toList();
        var l1 = [];
        var l2 = [];
        var l3 = [];
        var l4 = [];
        var l5 = [];
        Home.pizzasCosts = (data.values).toList();
        for (var ob in Home.pizzasCosts) {
          l1.add([ob[0], ob[1], ob[2]]);
          l2.add(ob[3]);
          l3.add("images/pizza_carousel.jpg");
          l4.add(ob[4]);
          l5.add(ob[5]);
        }
        Home.pizzasCosts = l1;
        Home.pizzasType = l2;
        Home.pizzasImages = l3;
        Home.pizzasAvl = l4;
        Home.pizzasDesc = l5;
      }, onError: (e) {
        print(e);
        print("not working-pizzas");
      });
    }
    fetchBurgers() async {
      var instance2 = FirebaseFirestore.instance;
      final docRef = instance2.collection("Menu").doc("Burger");
      await docRef.get().then((DocumentSnapshot snapshot) {
        final data = snapshot.data() as Map<String, dynamic>;
        Home.burgerName = (data.keys).toList();
        var temp = (data.values).toList();
        var l1 = [];
        var l2 = [];
        var l3 = [];
        var l4 = [];
        var l5 = [];
        for (var ob in temp) {
          l1.add(ob[0]);
          l2.add(ob[1]);
          l3.add('images/burger_carousel.jpeg');
          l4.add(ob[2]);
          l5.add(ob[3]);
        }
        Home.burgerCosts = l1;
        Home.burgerType = l2;
        Home.burgerImages = l3;
        Home.burgerAvl = l4;
        Home.burgerDesc = l5;
      }, onError: (e) {
        print(e);
        print("not working-burgers");
      });
    }
    fetchBreads() async {
      var instance3 = FirebaseFirestore.instance;
      final docRef = instance3.collection("Menu").doc("Bread");
      await docRef.get().then((DocumentSnapshot snapshot) {
        final data = snapshot.data() as Map<String, dynamic>;
        Home.breadName = (data.keys).toList();
        var temp = (data.values).toList();
        var l1 = [];
        var l2 = [];
        var l3 = [];
        var l4 = [];
        var l5 = [];
        for (var ob in temp) {
          l1.add(ob[0]);
          l2.add(ob[1]);
          l3.add('images/garlic_bread.png');
          l4.add(ob[2]);
          l5.add(ob[3]);
        }
        Home.breadCosts = l1;
        Home.breadType = l2;
        Home.breadImages = l3;
        Home.breadAvl = l4;
        Home.breadDesc = l5;
      }, onError: (e) {
        print(e);
        print("not working-breads");
      });
    }

    getPhoneNumber() async {
      Login.pn = await SharedPref.getStringValuesSF("phoneNumber");
    }

    fetchPizzas();
    fetchBurgers();
    fetchBreads();

    getPhoneNumber();

    return Scaffold(
      backgroundColor: ghostWhite,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            // Search bar
            searchBar(Home.pizzasName + Home.burgerName + Home.breadName),

            // What are you craving for text
            Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 10, 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "What are you craving for?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),

            // Categories
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Home.pizza = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Menu()));
                    },
                    child: categoryItem("images/pizza_image.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Home.burger = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Menu()));
                    },
                    child: categoryItem("images/burger_image.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Home.garlicBread = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Menu()));
                    },
                    child: categoryItem("images/garlic_bread1.png"),
                  ),
                ],
              ),
            ),

            // Veg Only Button
            Container(
              margin: const EdgeInsets.fromLTRB(25, 35, 5, 5),
              width: 110,
              decoration: BoxDecoration(
                border: Border.all(
                  color: primaryBorderDarkWhite,
                  width: 1.8,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '   Veg ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Switch(
                    value: Home.onlyVeg,
                    onChanged: (value) {
                      setState(() {
                        Home.onlyVeg = value;
                      });
                    },
                    activeTrackColor: const Color(0xFF00CB3B),
                    activeColor: const Color(0xFF00A906),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 10, 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Recommended",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              height: 235,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                  itemCount: carouselImages.length,
                  pageSnapping: true,
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      var activePage = page;
                    });
                  },
                  itemBuilder: (context, pagePosition) {
                    return Stack(alignment: Alignment.bottomLeft, children: [
                      Container(
                        height: 235,
                        width: 300,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Color(0xFFB9B9B9),
                              blurRadius: 6,
                              offset: Offset(0, 6))
                        ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage(carouselImages[pagePosition]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                          height: 70,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(179, 55, 55, 55),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          width: 300,
                          padding: const EdgeInsets.only(left: 10, top: 8),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      carouselItems[pagePosition],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          letterSpacing: 1),
                                    )),
                                    if (carouselItemType[pagePosition] ==
                                        "Veg") ...[
                                      Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                            top: 15, left: 80, right: 10),
                                        child: Image(
                                          image:
                                              AssetImage('images/veg_icon.jpg'),
                                          height: 15,
                                          width: 15,
                                          // color: Color.fromARGB(179, 0, 0, 0),
                                        ),
                                      ),
                                    ] else ...[
                                      Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                            top: 15, left: 80, right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Image(
                                          image: AssetImage(
                                              'images/non_veg_icon.png'),
                                          height: 16,
                                          width: 16,
                                          // color: Color.fromARGB(179, 0, 0, 0),
                                        ),
                                      ),
                                    ]
                                  ],
                                ),
                                Row(children: [
                                  Text(
                                    carouselCosts[pagePosition],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        letterSpacing: 1),
                                  ),
                                ])
                              ]))
                    ]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
