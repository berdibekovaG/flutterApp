import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      home: _buildMainScreen(),
    );
  }
}

class _buildMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSearchBar(),
      body: _buildImages(),
    );
  }
}

Widget _buildSearchBar() => PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        height: 37,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[400],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 7, left: 17),
          child: Material(
            color: Colors.grey[400],
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Search',
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

Widget _buildImages() => ListView(
      children: <Widget>[
        Container(
          child: Stack(
              children: <Widget>[
                Container(
                child:
                Image.asset('assets/images/pic1.png')),
            Align(
                alignment: FractionalOffset(0.4, 0.3),
                child: _buildFavouriteCard(),
                  ),
              ],
          ),
),
        Container(
          height: 338,
          width: 340,
          child: Image.asset('assets/images/pic2.png'),
        ),
      ],
    );

Widget _buildFavouriteCard() => Container(
        child: Card(
      child: IconButton(
        icon: FavouriteWidget(),
      ),
    ));

class FavouriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavouriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 2157;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: IconButton(
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
            onPressed: _toggleFavorite,
            color: Colors.red[700],
          ),
        ),
        SizedBox(
          width: 105,
          height: 25,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
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
