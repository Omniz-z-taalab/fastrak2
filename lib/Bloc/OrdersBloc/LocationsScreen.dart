import 'package:fastrak2/Bloc/OrdersBloc/PickupFrom/createorder_bloc.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/Bloc/OrdersBloc/PickupFrom/PickupFromScreen.dart';
import 'package:fastrak2/Bloc/OrdersBloc/DropOf/DropofScreen.dart';
import 'package:fastrak2/Bloc/OrdersBloc/ShipmentdetailsScreen.dart';
import 'package:fastrak2/network/ImagesScreen.dart';
import 'package:fastrak2/screens/homelayout/addAddress/getAddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickupAddressScreen extends StatefulWidget {
  String weight;

  PickupAddressScreen(this.weight);

  @override
  State<PickupAddressScreen> createState() => _PickupAddressScreenState();
}

class _PickupAddressScreenState extends State<PickupAddressScreen> {
  TextEditingController zayed = TextEditingController();
  TextEditingController controll = TextEditingController();
  dynamic dropdownvalue = 'Outside city';
  var items = ['Outside city',
    'Inside city'];

  AdressUser SecondUser = new AdressUser();

  // String Size;
  AdressUser firstUser = new AdressUser();
  AdressUser newuser;
  AdressUser newman;
  Dropss() async {
    AdressUser result = await Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return SetAddressFirstUser(firstUser);
      },
    ));
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    zayed.text = result.name;
    print(result.city.id);
    newman = result;

    print("===================================================");
    setState(() {});
  }

  DropDown() async {
    SecondUser.id = 'zayde';
    AdressUser newresult = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                SetAddressSecondUser(SecondUser)));
    print(newresult.phone);
    controll.text = newresult.name;
    newuser = newresult;
    print('sayda');
    setState(() {});
  }



  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // FocusScope.of(context).requestFocus(new FocusNode());

    return BlocProvider(
        create: (context) => CreateorderBloc(),
        child: BlocConsumer<CreateorderBloc, CreateorderState>(
            listener: (context, state) {

              // if (state is CheckDataSuccess) {
            // print(state.data.first.cities.first.name);
            // print(items);
            // print('>>>>>>>>>>>>>>>>');
          // }
        }, builder: (context, state) {
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
              leading: BackButton(onPressed: () {
                Navigator.pop(context);
              }),
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
                        'Locations',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
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
                padding:
                    EdgeInsets.only(left: 120, right: 120, top: 30, bottom: 30),
                child: Image.asset(LocationImage),
              ),
              Form(
                key: _form,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Text(
                          "Type of  delivery",
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: SizedBox(
                              height: 50,
                              width: 400,
                              child: Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.black45),
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: dropdownvalue,
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                        value: items, child: Text(items));
                                  }).toList(),
                                  onChanged: (dynamic newValue) {
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
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Text(
                          "Pickup from",
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: TextFormField(

                                    controller: zayed,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top: 3, bottom: 3, right: 5, left: 5),
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      suffixIcon: InkWell(
                                        child: ImageIcon(
                                          AssetImage(IconLocation),
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return " field is required";
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      FocusScope.of(context).requestFocus(new FocusNode());

                                      showModalBottomSheet(
                                        context: context,
                                        builder: (builder) {
                                          return Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            color: Colors.grey
                                                                .shade300))),
                                                child: ListTile(
                                                  title: Center(
                                                    child: Text(
                                                        "Add pickup location",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 15)),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey.shade300)),
                                                ),
                                                child: ListTile(
                                                  title: Center(
                                                    child: Text(
                                                      "Choose address",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF4B0082),
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Dashboard()));
                                                  },
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                        color: Colors
                                                            .grey.shade300),
                                                  ),
                                                ),
                                                child: ListTile(
                                                  title: Center(
                                                    child: Text(
                                                      "Confirm",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF4B0082),
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                              ListTile(
                                                title: Center(
                                                  child: Container(
                                                    width: 300,
                                                    height: 45,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color(0xFF4B0082),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                          "Add new Address",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16)),
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {

                                                  BlocProvider.of<CreateorderBloc>(context)
                                                      .add(CheckData());
                                                   Dropss();
                                                },
                                              ),
                                            ],
                                          );

                                          // ();
                                        },
                                      );
                                    })),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 25),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Drop off",
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, right: 12),
                                      child: TextFormField(
                                          maxLines: 1,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            contentPadding: EdgeInsets.only(
                                                top: 3,
                                                bottom: 3,
                                                right: 5,
                                                left: 5),
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade500),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            suffixIcon: InkWell(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 2.0),
                                                child: ImageIcon(
                                                  AssetImage(IconLocation),
                                                ),
                                              ),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return " field is required";
                                            }
                                            return null;
                                          },
                                          controller: controll,
                                          onTap: () {
                                            FocusScope.of(context).requestFocus(new FocusNode());

                                            showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Wrap(
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300))),
                                                      child: ListTile(
                                                        title: Center(
                                                          child: Text(
                                                              "Add pickup location",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      15)),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300)),
                                                      ),
                                                      child: ListTile(
                                                        title: Center(
                                                          child: Text(
                                                            "Choose address",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF4B0082),
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          Dashboard()));
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors.grey
                                                                  .shade300),
                                                        ),
                                                      ),
                                                      child: ListTile(
                                                        title: Center(
                                                          child: Text(
                                                            "Confirm",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF4B0082),
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                    ListTile(
                                                      title: Center(
                                                        child: Container(
                                                          width: 300,
                                                          height: 45,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Color(
                                                                0xFF4B0082),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                                "Add new Address",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16)),
                                                          ),
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        DropDown();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          })),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0,
                                              right: 15,
                                              top: 30,
                                              bottom: 15),
                                          child: Container(
                                            width: 420,
                                            height: 50,
                                            child: TextButton(
                                                style: TextButton.styleFrom(
                                                  // padding: EdgeInsets.only(
                                                  //     left: 15.0,
                                                  //     right: 15.0,
                                                  //     top: 15,
                                                  //     bottom: 15),
                                                  primary: Colors.black,
                                                  textStyle: const TextStyle(
                                                      fontSize: 20),
                                                  backgroundColor:
                                                      Color(0xFF4B0082),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Next",
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  if (_form.currentState
                                                      .validate()) {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Shipmentdetails(
                                                                    widget
                                                                        .weight,
                                                                    newuser,
                                                                    newman,dropdownvalue)));
                                                  }
                                                }),
                                          ),
                                        ),
                                      ]),
                                ]),
                          ]),
                    ]),
              ),
            ])),
          );
        }));
  }
}
