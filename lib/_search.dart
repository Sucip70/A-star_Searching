import 'package:flutter/material.dart';

Widget searchPage(BuildContext context) {
  Map<int, List<String>> _category = {
    0: ['Bakery', 'assets/Icon/bakery.png'],
    1: ['Chinese', 'assets/Icon/chinese-food.png'],
    2: ['Drink', 'assets/Icon/drinks.png'],
    3: ['Fast Food', 'assets/Icon/fast-food.png'],
    4: ['Chicken', 'assets/Icon/fried-chicken.png'],
    5: ['Middle East', 'assets/Icon/kebab.png'],
    6: ['Korean', 'assets/Icon/kimchi.png'],
    7: ['Coffee', 'assets/Icon/latte.png'],
    8: ['Bakso', 'assets/Icon/meatballs.png'],
    9: ['Snack', 'assets/Icon/nuggets.png'],
    10: ['Japanese', 'assets/Icon/onigiri.png'],
    11: ['Pizza', 'assets/Icon/pizza.png'],
    12: ['Noodle', 'assets/Icon/ramen.png'],
    13: ['Rice', 'assets/Icon/rice.png'],
    14: ['Satay', 'assets/Icon/satay.png'],
    15: ['Seafood', 'assets/Icon/shrimp.png'],
    16: ['Sweets', 'assets/Icon/sweets.png'],
    17: ['Thaifood', 'assets/Icon/tomyam.png']
  };
  return Container(
    height: 700,
    child: GridView.count(
        primary: false,
        crossAxisCount: 3,
        children: List.generate(_category.length, (index) {
          return Expanded(
              flex: 3,
              child: Container(
                height: 100,
                // color: Colors.green,
                padding: const EdgeInsets.all(1.0),
                child: Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        print('$index');
                      },
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            _category[index][1],
                            scale: 5,
                          ),
                          Text(_category[index][0])
                        ],
                      )),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0))),
              ));
        })),
  );
}
