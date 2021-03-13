import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/main_menu.dart';
import 'favorite_button.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainSecondScreen(),
    );
  }
}

class MainSecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: new Center(
          child: Text(
            'Photo',
            textAlign: TextAlign.center,
          ),
        ),
        leading: iconBack(context = context),
      ),
      body: ListView(
        children: <Widget>[
          mainPhoto(),
          imageDescription(),
          userInfo(),
          FavouriteWidget(),
        ],
      ),
    );
  }

  Widget mainPhoto() => Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: SizedBox(
          child: Image.asset('assets/images/pic3.png'),
        ),
      );

  Widget iconBack(buildContext) => IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => {
          Navigator.push(
              buildContext, MaterialPageRoute(builder: (context) => MyApp())),
        },
      );

  Widget imageDescription() => Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Text(
          'Beautiful girl in a yellow dress with a flower on her head in the summer in the forest',
          maxLines: 2,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Color(0xFFB2BBC6),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          softWrap: true,
        ),
      );

  Widget userInfo() => Container(
      margin: EdgeInsets.only(bottom: 17),
      child: Card(
          child: Column(
        children: [
          ListTile(
            title: Text(
              'Dianne Miles',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/oval.png'),
            ),
            subtitle: Text(
              '@Dianne Miles',
              style: TextStyle(
                color: Color(0xff8e8e93),
                fontSize: 13,
              ),
            ),
          ),
        ],
      )));
}
