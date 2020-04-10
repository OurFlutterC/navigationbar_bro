import 'package:flutter/material.dart';
import 'package:navigationbar_bro/navigationbar_bro.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Bar Bro Package',
      home: Example(),
    );
  }
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationBarBro(
    children:<Widget>[
        //here your pages
    ],
    btnsBar:<BtnBar>[
        BtnBar(
        title:"Home",
        icon:Icons.home,
        ),
        BtnBar(
        title:"Profile",
        icon:Icons.person,
        ),
        BtnBar(
        title:"Search",
        icon:Icons.search,
        ),
        BtnBar(
        title:"Store",
        icon:Icons.store,
        ),
        BtnBar(
        title:"Settings",
        icon:Icons.settings,
        ),
        //add more if you need it.
    ],
    position:PositionBar.top, //PositionBar.left, PositionBar.bottom or PositionBar.right (choose the position of navigation bar)
    colorSelectBtn: Colors.white, //Color of select button
    colorAllBtn:Colors.grey, //Color of others button
    opacityBar:0.5, //oppacity of buttons bar (0.0 to 1.0)
    btnBarRadius:BorderRadius.only(bottomLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)), //Radius of buttons bar
),
    );
  }
}