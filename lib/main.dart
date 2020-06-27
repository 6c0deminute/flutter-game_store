import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_store/models/GameObject.dart';
import 'package:game_store/gamedetailspage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<GameObject> games = [
    GameObject(
        title: "Last of US Part II",
        imgUrl:
            "https://store.playstation.com/store/api/chihiro/00_09_000/container/BR/pt/999/UP9000-CUSA07820_00-THELASTOFUSP2DLX/1593219668000/image?w=240&h=240&bg_color=000000&opacity=100&_version=00_09_000"),
    GameObject(
        title: "Desperados III",
        imgUrl:
            "https://store.playstation.com/store/api/chihiro/00_09_000/container/BR/pt/999/UP4389-CUSA11318_00-DES3DELUXEUS0000/1592817985000/image?w=240&h=240&bg_color=000000&opacity=100&_version=00_09_000"),
    GameObject(
        title: "Horizon Zero Dawn",
        imgUrl:
            "https://store.playstation.com/store/api/chihiro/00_09_000/container/BR/pt/999/UP9000-CUSA10237_00-HRZCE00000000000/1593219039000/image?w=240&h=240&bg_color=000000&opacity=100&_version=00_09_000"),
    GameObject(
        title: "Grand Theft Auto V",
        imgUrl:
            "https://store.playstation.com/store/api/chihiro/00_09_000/container/BR/pt/999/UP1004-CUSA00419_00-PREMIUMPACKOGGW1/1593218843000/image?w=240&h=240&bg_color=000000&opacity=100&_version=00_09_000"),
    GameObject(
        title: "Far Cry New Dawn",
        imgUrl:
            "https://store.playstation.com/store/api/chihiro/00_09_000/container/BR/pt/999/UP0001-CUSA13917_00-FARCRYBOWMORE000/1593219509000/image?w=240&h=240&bg_color=000000&opacity=100&_version=00_09_000")
  ];

  String selectedCategory = 'All';

  _categoryButton(String category) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.0),
            side: BorderSide(color: Colors.blue)),
        color: category == selectedCategory ? Colors.blue : Colors.white,
        textColor: category != selectedCategory ? Colors.blue : Colors.white,
        padding: EdgeInsets.all(3.0),
        onPressed: () {
          setState(() {
            selectedCategory = category;
          });
        },
        child: Text(
          category.toUpperCase(),
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  _searchButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: "Search",
            fillColor: Colors.white70),
      ),
    );
  }

  _categoryContainer() {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _categoryButton("All"),
          _categoryButton("Action"),
          _categoryButton("FPS"),
          _categoryButton("Puzzle"),
        ],
      ),
      height: 50,
    );
  }

  _featuredContainer() {
    return Container(
        margin: EdgeInsets.only(left: 30, bottom: 10),
        child: RichText(
            text:
                TextSpan(style: TextStyle(color: Colors.blue[600]), children: [
          TextSpan(
              text: 'Featured',
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold)),
          TextSpan(text: ' $selectedCategory', style: TextStyle(fontSize: 22)),
        ])));
  }

  _gameListContainer() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(top: 20.0, left: 10, right: 10, bottom: 20.0),
      height: 165,
      child: GameList(games),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.blue),
        backgroundColor: Colors.white,
        title: Text(
          "CodeMinute",
          style: TextStyle(color: Colors.blue),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _searchButton(),
              _categoryContainer(),
              _featuredContainer(),
              _gameListContainer(),
              Container(
                  margin: EdgeInsets.only(left: 30, bottom: 10),
                  child: Text(
                    "On Sale",
                    style: TextStyle(fontSize: 30, color: Colors.blue[600]),
                  )),
              Container(
                height: 640,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50)),
                    color: Colors.white),
                padding: EdgeInsets.only(top: 30),
                child: ListView(
                  children: <Widget>[
                    ...games.map((e) => GameCard(e)),
                    ...games.map((e) => GameCard(e))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  GameCard(this.game);
  GameObject game;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              offset: Offset(3, 3),
              blurRadius: 2,
              color: Colors.black.withAlpha(30))
        ],
      ),
      margin: EdgeInsets.only(left: 35, right: 35, bottom: 20),
      height: 90,
      child: Row(
        children: <Widget>[
          Container(width: 90,  child: Image.network(game.imgUrl)),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    game.title,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 22, letterSpacing: .9),
                  ),
                  Text(
                    "\$45,00",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    "\$30,00",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: Icon(Icons.shopping_cart)),
          )
        ],
      ),
    );
  }
}

class GameList extends StatefulWidget {
  GameList(this.games);
  final List<GameObject> games;

  @override
  _GameListState createState() => _GameListState(this.games);
}

class _GameListState extends State<GameList> {
  PageController _controller =
      new PageController(viewportFraction: 0.40, initialPage: 1);
  _GameListState(this.games);
  final List<GameObject> games;

  double currentPageValue = 0.0;
  int currentSelected = 0;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        currentPageValue = _controller.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: this.games.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        GameDetails(index, this.games[index])),
              );
            },
            child: Game(index, currentPageValue, this.games[index]));
      },
    );
  }
}

class Game extends StatelessWidget {
  Game(this.index, this.currentPageValue, this.game);
  final int index;
  GameObject game;
  final double currentPageValue;
  @override
  Widget build(BuildContext context) {
    double rotateValue = (pi / 3 + 0.1) * (index - currentPageValue).abs();
    return Container(
      child: Stack(
        children: <Widget>[
          Transform(
              transform: Matrix4.identity()
                ..scale(1 - (index - currentPageValue).abs() / 4),
              child: Hero(
                tag: game.title,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(4, 9),
                            blurRadius: 3,
                            color: Colors.black54)
                      ],
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage(game.imgUrl))),
                  width: rotateValue < 1.6 ? 120 : 0,
                  height: 150,
                ),
              )),
        ],
      ),
    );
  }
}
