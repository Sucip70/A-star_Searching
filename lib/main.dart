import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:kanigara/_Asearch.dart';
import 'package:kanigara/_data.dart';
import 'package:kanigara/_page.dart';
import '_excel.dart';
import '_search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int indexPage = 0, _location = 9;
List<Loc> _listRecRes;
ASearch aStar;
void setLocation(int i) {
  _location = i;
}

int getLoc() {
  return _location;
}

void reloadRec() {
  _listRecRes.clear();
  _listRecRes = aStar.getNearestRecommend(_location);
}

class _MyHomePageState extends State<MyHomePage> {
  bool onBoarding = true;
  var titlePage = ['Home', 'Search', 'History'];
  SearchBar searchBar;
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
  List<int> catSel = [];
  List<Loc> loc = [];

  int colorCard = 0;
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      title: new Text(
        titlePage[indexPage],
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        searchBar.getSearchAction(context),
      ],
    );
  }

  _MyHomePageState() {
    searchBar = new SearchBar(
      inBar: true,
      setState: setState,
      onSubmitted: onSubmitted,
      buildDefaultAppBar: buildAppBar,
      closeOnSubmit: false,
      clearOnSubmit: false,
      onChanged: setQuery,
      onCleared: clearQuery,
      onClosed: closeSearch,
    );
    aStar = new ASearch();
    _listRecRes = aStar.getNearestRecommend(_location);
    loc = List.from(aStar.dot);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String pattern = "";
  bool isSearch = false;
  List<String> query = [], tags = [];

  void onSubmitted(String value) {
    setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
    isSearch = true;
    query = getResDataset(pattern);
  }

  void setQuery(String s) {
    pattern = s;
    isSearch = false;
    tags = getQueryDataset(getDataset(), pattern);
  }

  void clearQuery() {
    pattern = "";
  }

  void closeSearch() {
    isSearch = false;
    pattern = "";
    query.clear();
  }

  void setPage(int i) {
    setState(() {
      indexPage = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> page = <Widget>[
      homePage(context, _listRecRes),
      searchPage(context),
      Column(
        children: [
          locationPicker(context),
          Container(
            height: 560,
            child: ListView.builder(
                itemCount: loc.length,
                itemBuilder: (context, index) {
                  return index != _location
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Card(
                                        color: Colors.yellow[100],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: InkWell(
                                          child: Center(
                                            child: Text('$index'),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              setLocation(index);
                                              reloadRec();
                                            });
                                          },
                                        )),
                                  ),
                                  Container(
                                    width: 290,
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      loc[index].alamat,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.black.withAlpha(50),
                                height: 10,
                              )
                            ],
                          ))
                      : Container();
                }),
          )
        ],
      )
    ];
    return onBoarding
        ? Scaffold(
            body: Container(
            color: Colors.orange,
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 60),
                  child: Text(
                    'Apa makanan \nfavorit mu?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  height: 350,
                  margin: const EdgeInsets.only(top: 30),
                  child: GridView.count(
                      primary: false,
                      crossAxisCount: 3,
                      scrollDirection: Axis.horizontal,
                      children: List.generate(_category.length, (index) {
                        return Expanded(
                            flex: 3,
                            child: Container(
                              height: 100,
                              // color: Colors.green,
                              padding: const EdgeInsets.all(1.0),
                              child: Card(
                                  color: catSel.length == 0
                                      ? Colors.yellow[50]
                                      : catSel.contains(index)
                                          ? Colors.yellow
                                          : Colors.yellow[50],
                                  child: InkWell(
                                    splashColor: Colors.blue.withAlpha(30),
                                    onTap: () {
                                      setState(() {
                                        if (catSel.length == 0) {
                                          catSel.add(index);
                                        } else {
                                          if (catSel.contains(index))
                                            catSel.removeAt(index);
                                          else
                                            catSel.add(index);
                                        }
                                      });
                                    },
                                    child: Container(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                            ));
                      })),
                ),
                Container(
                    height: 60,
                    width: 200,
                    margin: const EdgeInsets.only(top: 60),
                    child: Card(
                      child: InkWell(
                        child: Center(
                            child: Text(
                          'done',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        )),
                        onTap: () {
                          setState(() {
                            onBoarding = false;
                          });
                        },
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    )),
              ],
            ),
          ))
        : Scaffold(
            appBar: searchBar.build(context),
            key: _scaffoldKey,
            body: pattern.length > 0
                ? (isSearch
                    ? showRestaurant(query, context)
                    : queryRecomend(tags, context))
                : Center(
                    child: page.elementAt(indexPage),
                  ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.history), label: 'history'),
              ],
              currentIndex: indexPage,
              selectedItemColor: Colors.amber,
              onTap: setPage,
            ),
          );
  }
}
