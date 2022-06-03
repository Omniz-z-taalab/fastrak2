import 'package:fastrak2/network/ImagesScreen.dart';
import 'package:fastrak2/screens/homelayout/addAddress/getAddress.dart';
import 'package:flutter/material.dart';

class ManageAddress extends StatefulWidget {
  const ManageAddress({Key key}) : super(key: key);

  @override
  State<ManageAddress> createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  @override
  Widget build(BuildContext context) {
    return
     Column(

    children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Container(
            padding: const EdgeInsets.only(left: 25, top: 30, right: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),

        ],
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 10),
            child: SizedBox(
              width: 80.0,
              height: 5.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF4B0082),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: SizedBox(
              width: 23.0,
              height: 5.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFD5C7E5),
                ),
              ),
            ),
          ),
        ],
      ),
    Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: TextButton(
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF4B0082)),
                  borderRadius:
                  BorderRadius.circular(
                      10),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                      "Manage Addresses",
                      style: TextStyle(
                          color:
                          Color(0xFF4B0082),
                          fontSize: 16)),
                ),
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:
                            (context) =>
                            Dashboard()));
              },
            ),
          ),
        ])]);
  }
}
