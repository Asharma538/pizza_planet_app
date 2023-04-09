import 'package:flutter/material.dart';
import 'package:pizza_planet/pages/menu.dart';
import 'package:pizza_planet/utils.dart';
import 'package:advanced_search/advanced_search.dart';
import 'package:pizza_planet/components/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  static bool pizza = false;
  static bool burger = false;
  static bool garlicBread = false;

  static List<dynamic> pizzasName = [];
  static List<dynamic> pizzasCosts = [];

  static List<dynamic> burgerName = [];
  static List<dynamic> burgerCosts = [];
  static List<dynamic> burgerType = [];
  static List<dynamic> burgerImages = [];

  static List<dynamic> breadName = [];
  static List<dynamic> breadCosts = [];
  static List<dynamic> breadType = [];
  static List<dynamic> breadImages = [];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSwitched = false;
  late PageController _pageController;

  List<String> carouselImages = [
    "images/pizza_carousel.jpg",
    "images/burger_carousel.jpeg",
    "images/bread_carousel.jpeg"
  ];
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
      var _instance1 = FirebaseFirestore.instance;
      final docRef = _instance1.collection("Menu").doc("Pizzas");
      await docRef.get().then(
              (DocumentSnapshot snapshot) {
            final data = snapshot.data() as Map<String,dynamic>;
            Home.pizzasName = (data.keys).toList();
            Home.pizzasCosts = (data.values).toList();
          },
          onError: (e){
            print("not working-1");
          }
      );
    }
    fetchBurgers() async {
      var _instance2 = FirebaseFirestore.instance;
      final docRef = _instance2.collection("Menu").doc("Burger");
      await docRef.get().then(
              (DocumentSnapshot snapshot) {
            final data = snapshot.data() as Map<String,dynamic>;
            Home.burgerName = (data.keys).toList();
            var temp = (data.values).toList();
            var l1=[];
            var l2=[];
            var l3=[];
            for (var ob in temp){
              l1.add(ob[0]);
              l2.add(ob[1]);
              l3.add('images/burger_carousel.jpeg');
            }
            Home.burgerCosts = l1;
            Home.burgerType = l2;
            Home.burgerImages = l3;
          },
          onError: (e){
            print("not working-burgers");
          }
      );
    }
    fetchBreads() async {
      var _instance3 = FirebaseFirestore.instance;
      final docRef = _instance3.collection("Menu").doc("Bread");
      await docRef.get().then(
              (DocumentSnapshot snapshot) {
            final data = snapshot.data() as Map<String,dynamic>;
            Home.breadName = (data.keys).toList();
            var temp = (data.values).toList();
            var l1=[];
            var l2=[];
            var l3=[];
            for (var ob in temp){
              l1.add(ob[0]);
              l2.add(ob[1]);
              l3.add('images/garlic_bread.png');
            }
            Home.breadCosts = l1;
            Home.breadType = l2;
            Home.breadImages = l3;
          },
          onError: (e){
            print("not working-breads");
          }
      );
    }
    fetchPizzas();
    fetchBurgers();
    fetchBreads();
    return Scaffold(
      backgroundColor: ghostWhite,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              child: AdvancedSearch(
                maxElementsToDisplay: 5,
                singleItemHeight: 48,
                selectedTextColor: const Color(0xFF3363D9),
                borderColor: const Color(0xFFA2A2A2),
                searchResultsBgColor: primaryWhite,
                enabledBorderColor: primaryBorderDarkWhite,
                fontSize: 16,
                borderRadius: 5,
                hintText: ' 🔍   Search pizzas, burgers, breads',
                cursorColor: Colors.blueGrey,
                focusedBorderColor: const Color(0xFF545454),
                inputTextFieldBgColor: Colors.white10,
                itemsShownAtStart: 10,
                searchMode: SearchMode.CONTAINS,
                showListOfResults: true,
                unSelectedTextColor: Colors.black,
                verticalPadding: 10,
                horizontalPadding: 10,
                hideHintOnTextInputFocus: true,
                hintTextColor: Colors.grey.shade800,
                onItemTap: (index, value) {
                  // print("selected item index is $index");
                },
                onSearchClear: () {},
                onSubmitted: (searchText, listOfResults) {
                  // print("Submitted: $searchText");
                },
                onEditingProgress: (searchText, listOfResults) {},
                searchItems: const [
                  'Corn Pizza',
                  'Aloo tikki Burger',
                  'Garlic Bread',
                  'Cheese Pizza',
                  'Margherita Pizza',
                  'Veggie Burger',
                  'Green Wave Pizza'
                ],
              ),
            ),
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
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Home.pizza = true;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Menu()));
                    },
                    child: categoryItem("images/pizza_image.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Home.burger = true;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Menu()));
                    },
                    child: categoryItem("images/burger_image.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Home.garlicBread = true;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Menu()));
                    },
                    child: categoryItem("images/garlic_bread1.png"),
                  ),
                ],
              ),
            ),
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
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
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
              height: 200,
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
                    return Container(
                      margin: const EdgeInsets.fromLTRB(5, 5, 15, 10),
                      padding: const EdgeInsets.fromLTRB(1, 3, 1, 5),
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(0xFFB9B9B9),
                            blurRadius: 6,
                            offset: Offset(
                              0,
                              6,
                            )),
                      ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: AssetImage(carouselImages[pagePosition]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }),
            ),

          ],
        ),
      ),
    );
  }
}
