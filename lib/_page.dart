import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '_excel.dart';
import 'package:kanigara/main.dart';

Widget homePage(BuildContext context, List<Loc> _recList) {
  Map<int, List<String>> _category = {
    0: ['New', 'assets/Icon/confetti.png'],
    1: ['Pickup', 'assets/Icon/take-away.png'],
    2: ['Near Me', 'assets/Icon/nearby.png'],
    3: ['Hemat', 'assets/Icon/piggy-bank.png'],
    4: ['Best Seller', 'assets/Icon/star.png'],
    5: ['24 Jam', 'assets/Icon/24-hours.png'],
    6: ['Disukai', 'assets/Icon/love.png'],
    7: ['Healthy', 'assets/Icon/healthy-food.png'],
    8: ['Promo', 'assets/Icon/price-tag.png']
  };
  return ListView(padding: EdgeInsets.all(12.0), children: [
    locationPicker(context),
    new Container(
      height: 30,
      child: Text(
        'Restaurant for you',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ),
    new Container(
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _recList.length,
          itemBuilder: (context, index) {
            return Container(
              width: 150,
              // color: Colors.blue,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: Column(children: [
                    new Container(
                      height: 110,
                      width: 150,
                      // color: Colors.orange,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15))),
                        color: Colors.orange,
                        margin: const EdgeInsets.all(0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                color: Colors.orange[200],
                                size: 40,
                              ),
                              Text(
                                'No Image',
                                style: TextStyle(
                                    color: Colors.orange[200], fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(10.0),
                      height: 35,
                      child: Text(
                        _recList[index].nama,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    new Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        color: Colors.black.withAlpha(0),
                        alignment: Alignment.topLeft,
                        child: Row(children: [
                          Container(
                              child: Row(children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.yellow,
                            ),
                            Text(
                              _recList[index].rating.toString(),
                              style: TextStyle(color: Colors.black38),
                            ),
                          ])),
                          Container(
                              padding: const EdgeInsets.only(left: 25),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.directions,
                                    size: 16,
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    _recList[index].disFrom.toStringAsFixed(1) +
                                        'km',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black38),
                                  )
                                ],
                              ))
                        ]))
                  ]),
                ),
              ),
            );
          }),
    ),
    new Container(
      height: 40,
      alignment: Alignment.centerLeft,
      child: Text(
        'Category',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ),
    new Container(
      height: 340,
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
    )
  ]);
}

Widget queryRecomend(List<String> _query, BuildContext context) {
  return ListView.builder(
    itemCount: _query.length,
    itemBuilder: (context, index) {
      return Container(
        child: Column(
          children: [
            Text(_query[index]),
            Divider(
              color: Colors.black.withAlpha(50),
              height: 20,
            )
            //lak dipencet queryne ganti
          ],
        ),
      );
    },
  );
}

Widget showRestaurant(List<String> _query, BuildContext context) {
  return _query.length == 0
      ? Container(
          child: Text('Restaurant no found!'),
        )
      : ListView.builder(
          itemCount: _query.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(_query[index]),
            );
          },
        );
}

Widget locationPicker(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.yellow[100],
            child: InkWell(
                splashColor: Colors.orange,
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  aStar.dot[getLoc()].alamat,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  'My Location',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        )
      ],
    ),
  );
}
