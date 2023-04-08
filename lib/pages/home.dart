import 'package:flutter/material.dart';
import 'package:pizza_planet/utils.dart';
import 'package:advanced_search/advanced_search.dart';
import 'package:pizza_planet/components/widgets.dart';
import 'package:pizza_planet/pages/cart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSwitched = false;
  late PageController _pageController;
  List<String> categoryImages = [
    "images/pizza_image.png",
    "images/burger_image.png",
    "images/garlic_bread1.png"
  ];
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
                maxElementsToDisplay: 5, singleItemHeight: 48,
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
                searchItems: const ['Corn Pizza', 'Aloo tikki Burger', 'Garlic Bread', 'Cheese Pizza','Margherita Pizza','Veggie Burger','Green Wave Pizza'],
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
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  for (var catItem=0;catItem<categoryImages.length;catItem+=1)
                  GestureDetector(
                      onTap: () {
                        var found=false;
                        for (var temp=0; temp<Cart.quantity.length;temp+=1){
                          if (Cart.cartItems[temp]==menu[catItem]){
                            Cart.quantity[temp]+=1;
                            found=true;
                            break;
                          }
                        }
                        if (found==false){
                          Cart.cartItems.add(menu[catItem]);
                          Cart.price.add(6);
                          Cart.quantity.add(1);
                        }
                        setState(() {});
                      },
                      child: categoryItem(categoryImages[catItem]),
                  )
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
              child:   PageView.builder(
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
                      decoration: const BoxDecoration(
                          boxShadow:[
                            BoxShadow(
                              color: Color(0xFFB9B9B9),
                              blurRadius: 6,
                              offset: Offset(
                                0,
                                6,
                              )
                            ),
                          ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                            image: AssetImage(carouselImages[pagePosition]),fit: BoxFit.fill,
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
