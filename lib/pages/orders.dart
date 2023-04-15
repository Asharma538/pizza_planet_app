import 'package:flutter/material.dart';
import 'package:pizza_planet/utils.dart';
import 'package:advanced_search/advanced_search.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
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
  var more = false;
  var hide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child :Container(
          child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 15, left: 20),
                    child: Text(
                      "Your orders",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(18, 18, 20, 0),
                    child: AdvancedSearch(
                      maxElementsToDisplay: 5,
                      singleItemHeight: 48,
                      selectedTextColor: const Color(0xFF3363D9),
                      borderColor: primaryBorderDarkWhite,
                      searchResultsBgColor: primaryWhite,
                      enabledBorderColor: primaryBorderDarkWhite,
                      fontSize: 14,
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
                      hintTextColor: Colors.grey,
                      onItemTap: (index, value) {},
                      onSearchClear: () {},
                      onSubmitted: (searchText, listOfResults) {},
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
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Container(
                    child: Column(
                      children: <Widget>[
                        for (int i = 0; i < image.length; i++)
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
                                      )
                                      )
                                ]),
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                            child: Column(children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(image[i][0]),
                                      height: 100,
                                      width: 100,
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 20)),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 0)),
                                        Text(
                                          itemName[i][0],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 0)),
                                        Row(
                                          children: [
                                            Text(
                                              "Ordered On : ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              dates[i],
                                              style: TextStyle(
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
                                  more == false &&
                                  image[i].length > 1) ...[
                                Container(
                                  alignment: Alignment.topCenter,
                                  decoration: BoxDecoration(
                                      color: primaryRed,
                                      border: Border.all(
                                          color: primaryBorderDarkWhite, width: 0.4),
                                      borderRadius: BorderRadiusDirectional.only(
                                          bottomEnd: Radius.circular(10),
                                          bottomStart: Radius.circular(10))),
                                  child: GestureDetector(
                                    child: Text(
                                      "More",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 255, 255, 255),
                                          fontSize: 16,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    onTap: () {
                                      visib = true;
                                      setState(() {});
                                      more = true;
                                    },
                                  ),
                                )
                              ] else if (visib == true &&
                                  image[i].length > 1 &&
                                  more == true) ...[
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
                                        Padding(padding: EdgeInsets.only(left: 20)),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 0)),
                                            Text(
                                              itemName[i][j],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.left,
                                            ),
                                            Padding(padding: EdgeInsets.only(left: 0)),
                                            Row(
                                              children: [
                                                Text(
                                                  "Ordered On : ",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  dates[i],
                                                  style: TextStyle(
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
                                    decoration: BoxDecoration(
                                      color: primaryRed,
                                      border: Border.all(
                                          color: primaryBorderDarkWhite, width: 0.4),
                                      borderRadius: BorderRadiusDirectional.only(
                                          bottomEnd: Radius.circular(10),
                                          bottomStart: Radius.circular(10)),
                                    ),
                                    child: GestureDetector(
                                      child: Text(
                                        "Hide",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            fontSize: 16,
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onTap: () {
                                        visib = false;
                                        more = false;
                                        setState(() {});
                                      },
                                    ),
                                  )
                                ]
                              ]
                            ]),
                          ),
                      ],
                    ),
                  )
                ],
            ),
    )));
  }
}
