import 'package:flutter/material.dart';
import 'package:pizza_planet/utils.dart';
import 'package:advanced_search/advanced_search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(14, 15, 14, 0),
            child: AdvancedSearch(
              maxElementsToDisplay: 5, singleItemHeight: 48,
              selectedTextColor: const Color(0xFF3363D9), borderColor: primaryBorderDarkWhite, searchResultsBgColor: primaryWhite, enabledBorderColor: primaryBorderDarkWhite,
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
        ],
      ),
    );
  }
}

