import 'package:date_field/date_field.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:fastrak2/Bloc/OrdersBloc/ShipmentCostScreen.dart';
import 'package:fastrak2/Bloc/OrdersBloc/ShipmentDetailsBloc/newscreen.dart';
import 'package:fastrak2/Bloc/OrdersBloc/ShipmentDetailsBloc/shipment_details_bloc.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/ApiPrice.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/network/ImagesScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Shipmentdetails extends StatefulWidget {
  String Size;
  Data newuser;
  Data newman;

  Shipmentdetails(this.Size, this.newuser, this.newman);

  @override
  State<Shipmentdetails> createState() => _ShipmentdetailsState();
}

class _ShipmentdetailsState extends State<Shipmentdetails> {
  final formkey = GlobalKey<FormState>();

  Data newnewMen;
  bool isSwitched = false;
  var textValue = 'Amount to be collected';
  TextEditingController collectAmount = TextEditingController();
  bool status = false;
  String num = '.0';
  int integer;

  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {

   return BlocProvider(
        create: (context) => ShipmentDetailsBloc(),
        child: BlocConsumer<ShipmentDetailsBloc, ShipmentDetailsState>(
          listener: (context , state){
            if(state is SuccessSipmentState){
              print('voooooov');
              integer = state.value.totalShippingFees;
              print('88888888888888888888888888888');
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShipmentCostScreen( collectAmount.text, num, widget.newuser, Dropdown, dropdownValue, integer, widget.Size, widget.newman)));
            }if(state is ErrorSipmentState){
              Fluttertoast.showToast(
                  msg: state.ShipmentError.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.yellow,
                  textColor: Colors.black,
                  fontSize: 10.0);
            }
          },
         builder: (context, state) {
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
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFFF9FAFF),
            child: Column(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Shipment Details",
                        style: TextStyle(
                            color: Color(0xFF6B778D),
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
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 50),
                child: Image.asset(ShipmentDetails),
              ),
              Form(
                key: formkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 270),
                        child: Text(
                          "Delivery time",
                          style: TextStyle(color: Color(0xFF6B778D)),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12, top:5),
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
                  padding: EdgeInsets.only(right: 280),
                  child: Text(
                    "Pick up date",
                    style: TextStyle(color: Color(0xFF6B778D)),
                  ),

              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12, top: 5),
                child: SizedBox(
                    height: 45,
                    width: 370,
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
                        padding: const EdgeInsets.only(right: 280, bottom: 5),
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
                height: 50,
                width: 370,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF6B778D80)),
                    borderRadius: BorderRadius.circular(8.0)),
                child: DateTimeFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8)),
                    hintStyle: TextStyle(color: Color(0xFF6B778D80),fontSize: 15),
                    errorStyle: TextStyle(color: Colors.redAccent),
                  ),
                  mode: DateTimeFieldPickerMode.time,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    print(value);
                    integer = value.hour;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   // color: Colors.white,
              //   height: 50,
              //   width: 380,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(15),
              //           topRight: Radius.circular(15)),
              //       color: Colors.white),
                // child: Row(
                //   children: [
                //     Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Container(
                //               padding: EdgeInsets.all(10),
                //               child: Text(
                //                 'Amount to be collected',
                //                 style: TextStyle(color: Color(0xFF6B778D)),
                //               )),
                //         ]),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 120.0),
                //       child: FlutterSwitch(
                //         width: 40.0,
                //         height: 20.0,
                //         toggleColor: Color(0xFF4B0082),
                //         switchBorder: Border.all(
                //           color: Color(0xFF4B0082),
                //           width: 1.0,
                //         ),
                //         activeColor: Colors.white,
                //         inactiveColor: Colors.white,
                //         valueFontSize: 16.0,
                //         toggleSize: 20.0,
                //         value: status,
                //         borderRadius: 30.0,
                //         padding: 2.0,
                //         showOnOff: true,
                //         onToggle: (val) {
                //           setState(() {
                //             status = val;
                //           });
                //         },
                //       ),
                //     ),
                //   ],
                // ),
              // ),
              // SizedBox(
              //   height: 1,
              //   width: 380,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.black12,
              //     ),
              //   ),
              // ),
              Container(
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
                        padding: const EdgeInsets.only(left: 5.0,right: 5),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'collected amount',
                              style: TextStyle(color: Color(0xFF6B778D)),
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
                        child:Padding(
                          padding: EdgeInsets.only(right: 5,left: 2),
                          child: Container(
                            width: 230,
                            height: 50,
                            // padding: EdgeInsets.only(right: 2,left: 2),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black45)),
                            // color: Colors.black45,
                           child: Row(
                              children: [

                             SizedBox(
                               width: 115,
                               child: TextFormField(
                                controller: collectAmount,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  // contentPadding: EdgeInsets.only(right: 20),
                                  hintStyle: TextStyle(color: Color(0xFF6B778D80)),
                                    enabledBorder: InputBorder.none,

                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(

                                    borderRadius: BorderRadius.circular(10),
                                    // borderSide: BorderSide(
                                      // color: Colors.amber,
                                    // ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                  )
                                ),
                            ),
                             ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 33.0,top: 3,bottom: 3),
                                  child: Container(
                                    width: 75,
                                    height: 40,

                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xFF6B778D80)),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text('EGP',style: TextStyle(color: Color(0xFF6B778D)),)),
                                  ),
                                )
                              ])
                          ),
                        ),
                      ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
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
                              style: TextStyle(color: Color(0xFF6B778D)),
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
                      value: status,
                      borderRadius: 30.0,
                      padding: 2.0,
                      showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
              ),
              // SizedBox(
              //   height: 1,
              //   width: 380,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.black12,
              //     ),
              //   ),
              // ),


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
                    maxLines: height ~/ 20,  // <--- maxLines
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      // contentPadding: EdgeInsets.only(
                      //     top: 3, bottom: 3, right: 5, left: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 3, color: Color(0xFF6B778D80)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter description";
                      }
                      return 'null';
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
                                left: 15.0, right: 15.0, top: 15, bottom: 15),
                            primary: Colors.black,
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: Color(0xFF4B0082),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            "Next",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          onPressed: () {
                            if (formkey.currentState.validate()) {
                              BlocProvider.of<ShipmentDetailsBloc>(context).add(SendData(collectAmount.text,description.text));
                              print('zzzzzzzzzzzzzzzz');


                            }
                          }),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }),);}

  String dropdownValue = 'Pick up date';

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
            },
            items: <String>['Pick up date', 'Today', 'Tomorrow']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )));
  String Dropdown = 'Rushed Delivery - 180 minutes';

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
            value: Dropdown,
            style: TextStyle(color: Colors.black),
            underline: Container(),
            onChanged: (String Value) {
              setState(() {
                Dropdown = Value;
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
