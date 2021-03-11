import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FavoriteButton.dart';
import 'SecondScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      home: _BuildMainScreen(),
    );
  }
}

class _BuildMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSearchBar(),
      body: _buildImages(context = context),
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
          color: Color(0xffF5F5F8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 7, left: 17),
          child: Material(
            color: Color(0xfff5f5f8),
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
                      hintText: ' Search',
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

Widget _buildImages(buildContext) => ListView(
      padding: const EdgeInsets.only(bottom: 20, left: 20),
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: _buildPhotoAndCard('assets/images/pic1.png'),
        ),
        GestureDetector(
          child: Container(child: _buildPhotoAndCard('assets/images/pic2.png')),
          onTap: () => Navigator.push(
            buildContext,
            MaterialPageRoute(builder: (context) => SecondScreen()),
          ),
        ),
      ],
    );

Widget _buildFavouriteCard() => Flexible(
      fit: FlexFit.tight,
      child: Container(
        width: 105,
        child: Card(
          child: FavouriteWidget(),
        ),
      ),
    );

Widget _buildPhotoAndCard(String photo) => Stack(
      children: <Widget>[
        Container(
          child: Image.asset(photo),
        ),
        Align(
          alignment: Alignment.topRight,
// alignment: FractionalOffset(0.7, 0.3),
          child: _buildFavouriteCard(),
        ),
      ],
    );
