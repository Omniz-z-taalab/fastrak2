
import 'package:fastrak2/screens/homelayout/first.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFF),
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 45.0,top: 10,right: 20),
          child: Image.asset(
              'images/Logoword.png',
              width: 250,
              height: 80,

          ),

        ),

        actions: [

          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset("images/nout.png"),iconSize: 50,
              ),
          ),

        ],
        backgroundColor: Color(0xFFF9FAFF),
      ),
      bottomNavigationBar:SizedBox(height: 65,child: BottomNavigationBar(
        showSelectedLabels: true,
          selectedIconTheme:  IconThemeData( color: Colors.black,
              opacity: 1.0,
              size: 30.0
          ),
           unselectedIconTheme:IconThemeData(color: Colors.purple),
        selectedItemColor: Color(0xFF4B0082),
        unselectedItemColor: Colors.grey.shade600.withOpacity(.60),
        type: BottomNavigationBarType.fixed,

        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Image.asset("images/order.png"),
          ),label: 'Order' ),
          BottomNavigationBarItem(icon: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Image.asset("images/dash.png"),
          ),label: 'Dashboard' ),
          BottomNavigationBarItem(icon: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Image.asset("images/prof.png"),
          ),label: 'Profile' ),
          BottomNavigationBarItem(icon: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Image.asset("images/menu.png"),
          ),label: 'Menu' )

        ],
          // selectedItemColor: Color(0xFF4B0082),
      ),),
      // body: Homeorder(),
    );
  }
}
