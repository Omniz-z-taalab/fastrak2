import 'package:conditional_builder/conditional_builder.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:fastrak2/Bloc/OrdersBloc/createorder_bloc.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/network/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SetAddressFirstUser extends StatefulWidget {
  Data firstUser;

  SetAddressFirstUser(this.firstUser);

  @override
  State<SetAddressFirstUser> createState() => _SetAddressFirstUserState();
}

class _SetAddressFirstUserState extends State<SetAddressFirstUser> {
  String CityDropDown = 'Cairo';
  var elemant = [
    'Cairo',
  ];

  String Dropdownvalue = 'Maadi';
  var item = [
    'Maadi',
  ];

  final form = GlobalKey<FormState>();
  TextEditingController BuildingName = TextEditingController();
  TextEditingController ClintName = TextEditingController();
  TextEditingController FloorNumber = TextEditingController();
  TextEditingController Apartment = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();

  //

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CreateorderBloc(),
        child: BlocConsumer<CreateorderBloc, CreateorderState>(
            listener: (context, state) {
          if (state is OrderSuccess) {
            print(state.value.address);
            print(state.value.name);
            print('5555555555555555555555');
            widget.firstUser = state.value;
            Navigator.pop(context, widget.firstUser);
          }
          if (state is ErrorState) {
            Fluttertoast.showToast(
                msg: state.ctch.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.yellow,
                textColor: Colors.black,
                fontSize: 10.0);
          }
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
                leading: BackButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    Navigator.pop(context);
                  },
                ),
                backgroundColor: Color(0xFFF9FAFF),
              ),
              body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Add New Address',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey),
                      ),
                      Column(children: [
                        Form(
                          key: form,
                          child: Column(children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 15, right: 15),
                              child: SizedBox(
                                width: 400.0,
                                height: 1.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 500,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        "Client Name",
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15),
                                      child: Center(
                                        child: TextFormField(
                                          controller: ClintName,
                                          maxLines: 1,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintText: "clint name",
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
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Client Name field is required";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        "City",
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 15, left: 15),
                                      child: Container(
                                        width: 700,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: DropdownButton(
                                          style: new TextStyle(
                                            color: Colors.black38,
                                          ),
                                          value: CityDropDown,
                                          items: elemant.map((String ele) {
                                            return DropdownMenuItem(
                                              value: ele,
                                              child: Text(ele),
                                            );
                                          }).toList(),
                                          onChanged: (String Value) {
                                            setState(() {
                                              CityDropDown = Value;
                                            });
                                          },
                                          underline: SizedBox(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        "Area",
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 15, left: 15),
                                      child: Container(
                                        width: 400,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: DropdownButton(
                                          style: new TextStyle(
                                            color: Colors.black38,
                                          ),

                                          value: Dropdownvalue,

                                          // Array list of items
                                          items: item.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              Dropdownvalue = newValue;
                                            });
                                          },
                                          underline: SizedBox(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        "Build Name",
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15),
                                      child: TextFormField(
                                        controller: BuildingName,
                                        maxLines: 1,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: "Build Number",
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
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "build number field is required";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        "Full Address",
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15),
                                      child: TextFormField(
                                        controller: address,
                                        maxLines: 1,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: "address",
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
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "address field is required";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        "Floor Number",
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15),
                                      child: TextFormField(
                                        controller: FloorNumber,
                                        maxLines: 1,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: "floor number",
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
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "floor number field is required";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 500,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Text(
                                                "Apartment (Optional)",
                                                style: TextStyle(
                                                    color: Colors.black38),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              width: 700,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 15, left: 15),
                                                child: TextFormField(
                                                  maxLines: 1,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    hintText: "apartment",
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            top: 3,
                                                            bottom: 3,
                                                            right: 5,
                                                            left: 5),
                                                    fillColor: Colors.white,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey.shade500),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              width: 500,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0),
                                                      child: Text(
                                                        "LandMark (Optional)",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black38),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 700,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 15,
                                                                left: 15),
                                                        child: TextFormField(
                                                          maxLines: 1,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "LandMark",
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 3,
                                                                    bottom: 3,
                                                                    right: 5,
                                                                    left: 5),
                                                            fillColor:
                                                                Colors.white,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0),
                                                      child: Text(
                                                        "phone number",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black38),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0,
                                                              right: 15),
                                                      child: TextFormField(
                                                        controller: phone,
                                                        maxLines: 1,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: "phone",
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  top: 3,
                                                                  bottom: 3,
                                                                  right: 5,
                                                                  left: 5),
                                                          fillColor:
                                                              Colors.white,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .shade500),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                        ),
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return "phone number field is required";
                                                          }
                                                          if (value.length <
                                                              9) {
                                                            return "Mobile number should be between 8 and 14 number";
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 15.0,
                                                                    right: 15,
                                                                    top: 15,
                                                                    bottom: 15),
                                                            child: Container(
                                                              width: 380,
                                                              height: 50,
                                                              child: TextButton(
                                                                  style: TextButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            15.0,
                                                                        right:
                                                                            15.0,
                                                                        top: 15,
                                                                        bottom:
                                                                            15),
                                                                    primary: Colors
                                                                        .black,
                                                                    textStyle: const TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xFF4B0082),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      ConditionalBuilder(
                                                                    condition: state
                                                                        is! CreateLoadingState,
                                                                    builder:
                                                                        (context) =>
                                                                            TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        if (form
                                                                            .currentState
                                                                            .validate()) {
                                                                          BlocProvider.of<CreateorderBloc>(context).add(SendAddress(
                                                                              ClintName.text,
                                                                              BuildingName.text,
                                                                              address.text,
                                                                              phone.text,
                                                                              Apartment.text,
                                                                              FloorNumber.text));
                                                                        }
                                                                      },
                                                                      child: Align(
                                                                          alignment: Alignment.center,
                                                                          child: Text(
                                                                            'NEXT',
                                                                            style:
                                                                                TextStyle(fontSize: 14, color: Colors.white),
                                                                          )),
                                                                    ),
                                                                    fallback:
                                                                        (context) =>
                                                                            Center(
                                                                      child:
                                                                          CircularProgressIndicator(),
                                                                    ),

                                                                  )),
                                                            ),
                                                          ),
                                                        ]) // }))),
                                                  ]),
                                            ),
                                          ]),
                                    ),
                                  ]),
                            ),
                          ]),
                        )
                      ]),
                    ]),
              ));
        }));
  }
}
