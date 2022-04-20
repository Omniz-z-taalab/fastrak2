import 'package:fastrak2/network/ImagesScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({Key key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF9FAFF),
    appBar: new AppBar(
    elevation: 0,
    title: Image.asset(
    FastrakLogo,
    width: 250,
    height: 80,
    ),
    leading: BackButton(
      color: Colors.black,
    onPressed: () {
    FocusScope.of(context).requestFocus(FocusNode());

    Navigator.pop(context);
    },
    ),
    backgroundColor: Color(0xFFF9FAFF),
    ),  );}
}
