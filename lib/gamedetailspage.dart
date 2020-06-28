import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:game_store/models/GameObject.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class GameDetails extends StatelessWidget {
  GameDetails(this.index, this.game);
  final int index;
  final GameObject game;

  @override
  Widget build(BuildContext context) {
    _ageRatingButton(age) {
      return Container(
        height: 25,
        width: 40,
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.0),
              side: BorderSide(color: Colors.red)),
          padding: EdgeInsets.all(3.0),
          onPressed: () {},
          color: Colors.red,
          child: Center(
            child: Text(
              age,
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      // appBar: AppBar(title: Text(game.title)),
      body: Container(
        width: double.infinity,
        color: Colors.grey[100],
        padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 15),
        child: Column(
          children: <Widget>[
            Container(
              child: Hero(
                  tag: game.title,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(game.imgUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: BackdropFilter(
                          filter:
                              new ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(game.imgUrl))),
                        height: 300,
                        width: 250,
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              game.title,
              style: TextStyle(fontSize: 36, color: Colors.blue[700]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SmoothStarRating(
                    starCount: 5,
                    rating: 4,
                    size: 25.0,
                    isReadOnly: true,
                    color: Colors.yellow[700],
                    borderColor: Colors.yellow[700],
                    spacing: 0.0),
                Text("32 reviews")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "\$45.00",
                  style: TextStyle(
                      fontSize: 19,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey[600]),
                ),
                Text(
                  "\$30.00",
                  style: TextStyle(fontSize: 32, color: Colors.green),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Description",
                style: TextStyle(fontSize: 32, color: Colors.blue[900]),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                _ageRatingButton("18"),
                Text(
                  "Nudity Drugs Violence",
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                )
              ],
            ),
            Spacer(),
            SizedBox(
              width: 180,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                    side: BorderSide(color: Colors.blue)),
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(3.0),
                onPressed: () {},
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
