import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'favorite_button.dart';
import 'screen_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar(),
      body: images(context = context),
    );
  }

  Widget searchBar() => PreferredSize(
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

  Widget images(buildContext) => ListView(
        children: <Widget>[
          Container(
           margin: const EdgeInsets.only(bottom: 12.0),
            child: Center(

              child: _buildPhotoAndCard('assets/images/pic1.png'),
            ),
          ),
          GestureDetector(
            child: Container(
                child: Center(
                    child: _buildPhotoAndCard('assets/images/pic2.png'))),
            onTap: () => Navigator.push(
              buildContext,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            ),
          ),
        ],
      );

  Widget favoriteCard() => Card(
        child: FavouriteWidget(),
      );

  Widget _buildPhotoAndCard(String photo) => Stack(
        children: <Widget>[
          Container(
            child: Image.asset(photo),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: favoriteCard(),
          ),
        ],
      );
}
