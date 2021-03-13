import 'package:flutter/material.dart';

class FavouriteWidget extends StatefulWidget {
  @override
  FavoriteWidgetState createState() => FavoriteWidgetState();
}

class FavoriteWidgetState extends State<FavouriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 2157;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  alignment: Alignment.centerLeft,
                  icon: (_isFavorited
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border)),
                  onPressed: _toggleFavorite,
                  color: Colors.black,
                ),
                SizedBox(
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      '$_favoriteCount',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }
}
