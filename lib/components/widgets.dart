import 'package:advanced_search/advanced_search.dart';
import 'package:flutter/material.dart';
import 'package:pizza_planet/main_screen.dart';
import 'package:pizza_planet/pages/cart.dart';
import 'package:pizza_planet/utils.dart';
import 'package:provider/provider.dart';
import 'package:pizza_planet/cartProvider/provider.dart';
import 'package:pizza_planet/pages/home.dart';

Widget categoryItem(String path) {
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 18, 10, 5),
    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
    decoration: BoxDecoration(
      color: primaryBlue,
      border: Border.all(color: primaryBorderDarkWhite, width: 0.4),
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
            color: Color(0xFFB9B9B9),
            blurRadius: 6,
            offset: Offset(
              0,
              6,
            ))
      ],
    ),
    child: Image(
      image: AssetImage(path),
      fit: BoxFit.fitWidth,
      height: 80,
      width: 80,
    ),
  );
}

PreferredSizeWidget appBarMenu(String s) {
  return AppBar(
      backgroundColor: primaryBlue,
      centerTitle: true,
      title: Text(s),
      actions: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
          // child: const Icon(Icons.person),
        ),
      ]);
}

Widget menuItem(context, itemImage, itemName, itemDesc, itemType, itemCost,
    isAvailable, category) {
  return Container(
    padding: const EdgeInsets.only(left: 10),
    margin: const EdgeInsets.only(
      left: 10,
      right: 10,
      bottom: 10,
    ),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primaryBorderDarkWhite, width: 0.4),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
              color: Color(0xFFB9B9B9),
              blurRadius: 5,
              offset: Offset(
                0,
                3,
              ))
        ]),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Image(
            height: 90,
            width: 90,
            // image: AssetImage(itemImage),
            image: NetworkImage(itemImage),
            fit: BoxFit.cover,
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: 15)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(itemName,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: 0.5)),
            const SizedBox(
              height: 2,
            ),
            if (itemDesc != "None") ...[
              Text(
                itemDesc,
                // softWrap: true,
                overflow: TextOverflow.ellipsis,
                // maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    letterSpacing: 0.5),
              ),
            ],
            if (itemType == 'Vegetarian') ...[
              Text(
                itemType,
                style: const TextStyle(
                    color: Color.fromARGB(255, 70, 158, 73),
                    fontWeight: FontWeight.w500),
              ),
            ] else ...[
              Text(
                itemType,
                style: const TextStyle(
                    color: Color.fromARGB(255, 204, 14, 14),
                    fontWeight: FontWeight.w500),
              ),
            ],
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "₹$itemCost",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
                if (isAvailable == 'A') ...[
                  const Padding(padding: EdgeInsets.only(left: 120)),
                  ElevatedButton(
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text("Item added to cart"),
                        action: SnackBarAction(
                            label: "UNDO",
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeItem(itemName);
                              if (category == "pizza") {
                                Home.pizza = true;
                              } else if (category == "burger") {
                                Home.burger = true;
                              } else {
                                Home.garlicBread = true;
                              }
                            }),
                      );
                      if (category == "pizza") {
                        Home.pizza = true;
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (category == "burger") {
                        Home.burger = true;
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        Home.garlicBread = true;
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      Provider.of<CartProvider>(context, listen: false)
                          .addItem(itemName, itemCost);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryBlue),
                    child: const Text("+ADD"),
                  ),
                  // SnackBar(content: Text("Item added to cart"))
                ] else ...[
                  const Padding(padding: EdgeInsets.only(left: 90)),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC50000)),
                    child: const Text("Out of Stock"),
                  )
                ]
              ],
            ),
            const SizedBox(
              height: 3,
            ),
          ],
        )
      ],
    ),
  );
}

Widget searchBar(searchList) {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 18, 20, 0),
    child: AdvancedSearch(
      maxElementsToDisplay: 5,
      singleItemHeight: 40,
      selectedTextColor: const Color(0xFF3363D9),
      borderColor: const Color(0xFFA2A2A2),
      searchResultsBgColor: ghostWhite,
      enabledBorderColor: primaryBorderDarkWhite,
      fontSize: 16,
      borderRadius: 5,
      hintText: ' 🔍   Search pizzas, burgers, breads',
      cursorColor: Colors.blueGrey,
      focusedBorderColor: const Color(0xFF545454),
      inputTextFieldBgColor: Colors.white10,
      itemsShownAtStart: 5,
      searchMode: SearchMode.CONTAINS,
      showListOfResults: true,
      unSelectedTextColor: Colors.black,
      verticalPadding: 10,
      horizontalPadding: 10,
      hideHintOnTextInputFocus: true,
      hintTextColor: Colors.grey.shade800,
      onItemTap: (index, value) {
        // print("selected item is $value");
      },
      onSearchClear: () {},
      onSubmitted: (searchText, listOfResults) {
        // print("Submitted: $searchText");
      },
      onEditingProgress: (searchText, listOfResults) {},
      searchItems: searchList,
    ),
  );
}
