

import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/screens/createorder/SetAddressFirstUser.dart';
import 'package:fastrak2/screens/createorder/SetAddressSecondUser.dart';
import 'package:fastrak2/screens/createorder/Shipmentdetails.dart';
import 'package:flutter/material.dart';

class PickupAddressScreen extends StatefulWidget {
  String Sizeitem;

  PickupAddressScreen(this.Sizeitem);

  @override
  State<PickupAddressScreen> createState() => _PickupAddressScreenState();
}

class _PickupAddressScreenState extends State<PickupAddressScreen> {
  TextEditingController zayed = TextEditingController();
  TextEditingController controll = TextEditingController();
  String dropdownvalue = 'Outside city';
  var items = [
    'Outside city',
  ];

  Data SecondUser = new Data();
  String Size;
  Data firstUser = new Data();
  Data newuser;
  Data newman;

  Dropss() async {
    Data result = await Navigator.push(
        context, MaterialPageRoute(
      builder: (BuildContext context) {
        return SetAddressFirstUser(firstUser);
      },
    ));
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' );
    zayed.text = result.name;
    print(result.phone);
    newman = result;
    print("===================================================");
    setState(() {
    });
  }
  DropDown() async {
    SecondUser.id = 'zayde';
    Data newresult = await Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => SetAddressSecondUser(SecondUser)));
    print(newresult.phone);
    controll.text = newresult.name;
    newuser = newresult;
    print('sayda');
    setState(() {});
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.Sizeitem + 'nnnnnnnn');
    Size = widget.Sizeitem;
    print('fffffff');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFF),

      appBar: new AppBar(
        elevation: 0,
        title: Image.asset(
          'images/Logoword.png',
          width: 250,
          height: 80,
        ),
        backgroundColor: Color(0xFFF9FAFF),
        leading: BackButton(
            onPressed: (){
              Navigator.pop(context);}
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pickup locations',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6B778D)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 15),
                  child: SizedBox(
                    width: 70.0,
                    height: 4.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF4B0082),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 5),
                  child: SizedBox(
                    width: 20.0,
                    height: 4.0,
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
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 100),
              child: Image.asset('images/loca.png'),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Text(
                      "Type of  delivery",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: SizedBox(
                          height: 45,
                          width: 370,
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Color(0xFF6B778D80)),
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButton(
                              value: dropdownvalue,
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                    value: items, child: Text(items));
                              }).toList(),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownvalue = newValue;
                                });
                              },
                              underline: SizedBox(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Text(
                      "Pickup to",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: SizedBox(
                            height: 45,
                            width: 370,
                            child: Container(
                              padding: EdgeInsets.all(10
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xFF6B778D80)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(

                                controller: zayed,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide : BorderSide.none,

                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: InkWell(
                                      child: ImageIcon(
                                        AssetImage('images/locc.png'),
                                      ),),),),
                                onTap: () {
                                  Dropss();
                                  setState(() {

                                  });
                                },

                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 25),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Drop off",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 12.0, right: 12),
                                child: SizedBox(
                                  height: 45,
                                  width: 370,
                                  child: Container(
                                    padding: EdgeInsets.all(10
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Color(0xFF6B778D80)),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: TextFormField(

                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide : BorderSide.none,
                                        ),
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: InkWell(
                                            child: ImageIcon(
                                              AssetImage('images/locc.png'),
                                            ),),),),

                                      controller: controll,
                                      onTap: () {
                                        DropDown();
                                      },

                                    ),

                                  ),
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15, top: 15, bottom: 15),
                                    child: Container(
                                      width: 360,
                                      height: 50,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.only(
                                              left: 15.0,
                                              right: 15.0,
                                              top: 15,
                                              bottom: 15),
                                          primary: Colors.black,
                                          textStyle: const TextStyle(fontSize: 20),
                                          backgroundColor: Color(0xFF4B0082),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        child: Text(
                                          "Next",
                                          style: TextStyle(
                                              fontSize: 18.0, color: Colors.white),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  Shipmentdetails(Size, newuser, newman)));
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ]),
                ]),
          ])),
    );
  }
}
