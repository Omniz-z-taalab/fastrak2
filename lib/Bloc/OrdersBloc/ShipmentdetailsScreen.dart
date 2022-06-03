import 'dart:convert';

import 'package:date_field/date_field.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:fastrak2/Bloc/OrdersBloc/ShipmentCostScreen.dart';
import 'package:fastrak2/Bloc/OrdersBloc/ShipmentDetailsBloc/newscreen.dart';
import 'package:fastrak2/Bloc/OrdersBloc/ShipmentDetailsBloc/shipment_details_bloc.dart';
import 'package:fastrak2/Bloc/passwordBloc/Password%20State.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/ApiPrice.dart';
import 'package:fastrak2/Models/Api/GetaddApi.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/network/ImagesScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Shipmentdetails extends StatefulWidget {
  String weight;
  AdressUser newuser;
  AdressUser newman;
  String dropdownvalue;
UserAddress pickupfrom;
UserAddress Dropof;
  Shipmentdetails(this.weight, this.newuser, this.newman, this.dropdownvalue,this.pickupfrom,this.Dropof);

  @override
  State<Shipmentdetails> createState() => _ShipmentdetailsState();
}

class _ShipmentdetailsState extends State<Shipmentdetails> {
  final FormKey = GlobalKey<FormState>();
  AdressUser newnewMen;
  AdressUser newnewuser;
  bool isSwitched = false;
  var textValue = 'Amount to be collected';
  TextEditingController collectAmount = TextEditingController();
  bool status = false;
  String num = '.0';
  String mony = '0';
  int integer;
  dynamic eeeee;
  int index = 1;
  var time;
  int value = 1;
  TextEditingController controller = TextEditingController();
  TextEditingController description = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();

  newCoast() async {
    Coast result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ShipmentCostScreen(
                num,
                widget.newuser,
                dropdownValue,
                widget.weight,
                widget.newman,
                collectAmount.text,
                description.text,
                integer,
                DeliveryTime,
                isSwitched,
                index,
                eeeee,
                value,widget.Dropof,widget.pickupfrom)));

    print('?????????????????????????????');
    print(result.shippingFees);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     print('aaaaaaaaaaaaaaaaa' + widget.dropdownvalue.toString());
    // print(widget.newman.city.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShipmentDetailsBloc(),
      child: BlocConsumer<ShipmentDetailsBloc, ShipmentDetailsState>(
          listener: (context, state) {
        if (state is SuccessSipmentState) {
          print(state.value.shippingFees);
          print('voooooov');
          eeeee = state.value.totalShippingFees;
          print(eeeee);

          newCoast();
        }
        if (state is switchSuccess) {
          status = state.switchh;
        }
        if (state is fragileSwitchState) {
          isSwitched = state.fragileSwitch;
        }
        if (state is ErrorSipmentState) {
          Fluttertoast.showToast(
              msg: state.ShipmentError.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.yellow,
              textColor: Colors.black,
              fontSize: 10.0);
        }
        if (state is DataTimeSuccessState) {
          integer = state.value;
          DateFormat dateFormat = new DateFormat.H();
          var open = dateFormat.parse("13:00");
          String formattedDate = DateFormat('kk').format(open);
          int newopen = int.parse(formattedDate);
          ////////////////////////////////////////////////////////////////////
          var close = dateFormat.parse("04:00");
          String formattedDateClose = DateFormat('kk').format(close);
          int DateTomorro = int.parse(formattedDateClose);
          print(DateTomorro.toString() + 'wwwssssssaaaaaaxxxxxx');
          if (dropdownValue == 'Today') {
            if (integer > newopen) {
              return Fluttertoast.showToast(
                  msg: 'please select time before 1pm',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.amberAccent,
                  textColor: Colors.black,
                  fontSize: 12.0);
              print(integer);
            }
          }
          if (dropdownValue == 'Tomorrow') {
            if (integer > DateTomorro) {
              integer = null;

              return Fluttertoast.showToast(
                  msg: 'please select time before 4pm ',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.amberAccent,
                  textColor: Colors.black,
                  fontSize: 12.0);
              print(integer);
            }
          }
        }
      }, builder: (context, state) {
        final height = 100.0;

        return Scaffold(
            appBar: new AppBar(
              elevation: 0,
              title: Image.asset(
                FastrakLogo,
                width: 250,
                height: 80,
              ),
              backgroundColor: Color(0xFFF9FAFF),
              leading: BackButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  Navigator.pop(context);
                },
                color: Colors.black,
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                color: Color(0xFFF9FAFF),
                child: Form(
                  key: FormKey,
                  child: Column(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0,left: 15 ,bottom: 10),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Shipment Details",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 5),
                        child: SizedBox(
                          width: 80.0,
                          height: 4.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFF4B0082),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                        height: 4.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFD5C7E5),
                          ),
                        ),
                      ),
                    ]),
                    Container(
                      padding: EdgeInsets.only(
                          left: 30, right: 30, top: 30, bottom: 30),
                      child: Image.asset(ShipmentDetails,width: 150,),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 285, bottom: 5, left: 15),
                            child: Text(
                              "Delivery time",
                              style: TextStyle(color: Color(0xFF6B778D)),
                            ),
                          ),
                        ]),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, right: 12, top: 5),
                      child: SizedBox(
                        height: 45,
                        width: 360,
                        child: _dropDown(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 285, bottom: 5, left: 15),
                      child: Text(
                        "Pick up date",
                        style: TextStyle(color: Color(0xFF6B778D)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, right: 12, top: 5),
                      child: SizedBox(
                          height: 45,
                          width: 360,
                          child: Container(
                            child: _hintDown(),
                          )),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 285, bottom: 5, left: 15),
                            child: Text(
                              "Pick up time",
                              style: TextStyle(color: Color(0xFF6B778D)),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ]),
                    Container(
                      width: 360,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(7)),
                      child: DateTimeFormField(
                          decoration: const InputDecoration(
                            hintText: 'Select Time',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.black45),
                             errorStyle: TextStyle(color: Colors.red),
                          ),
                          validator: (value) {
                            if (value == null ) {
                              return " field is required";
                            }
                            return null;
                          },
                          mode: DateTimeFieldPickerMode.time,
                          autovalidateMode: AutovalidateMode.always,
                          onDateSelected: (DateTime value) {
                            BlocProvider.of<ShipmentDetailsBloc>(context)
                                .add(DateTimeEvent(value.hour));
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // color: Colors.white,
                      height: 50,
                      width: 380,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Amount to be collected',
                                      style:
                                          TextStyle(color: Color(0xFF6B778D)),
                                    )),
                              ]),
                          Padding(
                            padding: const EdgeInsets.only(left: 150.0),
                            child: FlutterSwitch(
                              width: 45.0,
                              height: 25.0,
                              toggleColor: Color(0xFF4B0082),
                              switchBorder: Border.all(
                                color: Color(0xFF4B0082),
                                width: 1.0,
                              ),
                              activeColor: Colors.white,
                              inactiveColor: Colors.white,
                              valueFontSize: 16.0,
                              toggleSize: 20.0,
                              value: status,
                              borderRadius: 30.0,
                              padding: 2.0,
                              showOnOff: true,
                              onToggle: (val) {
                                status = val;
                                BlocProvider.of<ShipmentDetailsBloc>(context)
                                    .add(eventSwitch(status));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    status == true
                        ? Container(
                            height: 60,
                            width: 380,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'collected amount',
                                          style: TextStyle(
                                              color: Color(0xFF6B778D)),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 5, left: 2),
                                    child: Container(
                                        width: 230,
                                        height: 50,
                                        // padding: EdgeInsets.only(right: 2,left: 2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black45)),
                                        // color: Colors.black45,
                                        child: Row(children: [
                                          SizedBox(
                                            width: 115,
                                            child: TextFormField(
                                              controller: collectAmount,
                                              maxLines: 1,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  // contentPadding: EdgeInsets.only(right: 20),
                                                  hintStyle: TextStyle(
                                                      color:
                                                          Color(0xFF6B778D80)),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    // borderSide: BorderSide(
                                                    // color: Colors.amber,
                                                    // ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 33.0, top: 3, bottom: 3),
                                            child: Container(
                                              width: 75,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(0xFF6B778D80)),
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'EGP',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF6B778D)),
                                                  )),
                                            ),
                                          )
                                        ])),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // color: Colors.white,
                      height: 50,
                      width: 380,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Fragile items',
                                      style:
                                          TextStyle(color: Color(0xFF6B778D)),
                                    )),
                              ]),
                          Padding(
                            padding: const EdgeInsets.only(left: 215.0),
                            child: FlutterSwitch(
                              width: 45.0,
                              height: 25.0,
                              toggleColor: Color(0xFF4B0082),
                              switchBorder: Border.all(
                                color: Color(0xFF4B0082),
                                width: 1.0,
                              ),
                              activeColor: Colors.white,
                              inactiveColor: Colors.white,
                              valueFontSize: 16.0,
                              toggleSize: 20.0,
                              value: isSwitched,
                              borderRadius: 30.0,
                              padding: 2.0,
                              showOnOff: true,
                              onToggle: (val) {
                                isSwitched = val;
                                BlocProvider.of<ShipmentDetailsBloc>(context)
                                    .add(eventfragileSwitch(isSwitched));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "what are you shipping ? (Add a description)",
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0, left: 25),
                      child: TextFormField(
                          controller: description,
                          maxLines: height ~/ 20,
                          // <--- maxLines
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 3, color: Color(0xFF6B778D80)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return " field is required";
                            }
                            return null;
                          }),
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
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                                onPressed: () {
                                  DateFormat dateFormat = new DateFormat.H();
                                  var open = dateFormat.parse("13:00");
                                  String formattedDate =
                                      DateFormat('kk').format(open);
                                  int newopen = int.parse(formattedDate);
                                  ////////////////////////////////////////////////////////////////////
                                  var close = dateFormat.parse("04:00");
                                  String formattedDateClose =
                                      DateFormat('kk').format(close);
                                  int DateTomorro =
                                      int.parse(formattedDateClose);
                                  print(DateTomorro.toString() +
                                      'wwwssssssaaaaaaxxxxxx');
                                  if (dropdownValue == 'Today') {
                                    if (integer > newopen) {
                                      return Fluttertoast.showToast(
                                          msg: 'please select time before 1pm',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.amberAccent,
                                          textColor: Colors.black,
                                          fontSize: 12.0);
                                      print(integer);
                                    }
                                  }
                                  if (dropdownValue == 'Tomorrow') {
                                    if (integer > DateTomorro) {
                                      integer = null;

                                      return Fluttertoast.showToast(
                                          msg: 'please select time before 4pm ',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.amberAccent,
                                          textColor: Colors.black,
                                          fontSize: 12.0);
                                      print(integer);
                                    }
                                  }

                                  if (FormKey.currentState.validate()) {
                                    // integer = null;
                                    // print(integer);

                                    BlocProvider.of<ShipmentDetailsBloc>(
                                            context)
                                        .add(SendData(
                                      collectAmount.text,
                                      description.text,
                                      widget.weight,
                                      index,
                                    ));
                                    print(index);
                                    print(collectAmount);
                                    print('zzzzzzzzzzzzzzzz');
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ));
      }),
    );
  }

  String dropdownValue = 'Today';

  Widget _hintDown() => Container(
      height: 50,
      width: 340,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF6B778D80)),
          borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
          padding: EdgeInsets.all(5.0),
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            elevation: 16,
            style: TextStyle(color: Colors.black),
            underline: Container(),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
              if (dropdownValue == 'Today') {
                value = 1;
              }
              if (dropdownValue == 'Tomorrow') {
                value = 2;
              }
            },
            items: <String>['Today', 'Tomorrow']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )));

  String DeliveryTime = 'Rushed Delivery - 180 minutes';

  Widget _dropDown() => Container(
        height: 50,
        width: 340,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF6B778D80)),
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: DropdownButton<String>(
            isExpanded: true,
            value: DeliveryTime,
            style: TextStyle(color: Colors.black),
            underline: Container(),
            onChanged: (String Value) {
              if (Value == 'Rushed Delivery - 180 minutes') {
                index = 1;
              }
              if (Value == 'Same Day - 12 hours') {
                index = 2;
              }
              if (Value == 'Next Day - 24 hours') {
                index = 3;
              }
              setState(() {
                DeliveryTime = Value;
                print('$index + ${Value}');
              });
            },
            items: <String>[
              'Rushed Delivery - 180 minutes',
              'Same Day - 12 hours',
              'Next Day - 24 hours'
            ].map<DropdownMenuItem<String>>((String newvalue) {
              return DropdownMenuItem<String>(
                value: newvalue,
                child: Text(newvalue),
              );
            }).toList(),
          ),
        ),
      );
}
//
