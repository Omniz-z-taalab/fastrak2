
import 'package:conditional_builder/conditional_builder.dart';
import 'package:country_picker/country_picker.dart';
import 'package:fastrak2/Bloc/GetAddressBloc/GetAddressBloc.dart';
import 'package:fastrak2/Bloc/GetAddressBloc/GetAddressEvent.dart';
import 'package:fastrak2/Bloc/GetAddressBloc/GetAddressState.dart';
import 'package:fastrak2/Bloc/OrdersBloc/PickupFrom/createorder_bloc.dart';
import 'package:fastrak2/Bloc/passwordBloc/Password%20State.dart';
import 'package:fastrak2/Models/Api/CitiesApi.dart';
import 'package:fastrak2/Models/Api/GetaddApi.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/network/ImagesScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScreen extends StatefulWidget {
  AdressUser user;
  String name;
  String buildNumber;
  String fullAddress;
  String floorNumber;
  String Apartmen;
  String landMark;
  String phonee;
  Citys city;
  Area areas;
  EditScreen(this.name,this.buildNumber,this.fullAddress,this.floorNumber,this.Apartmen,this.landMark,this.phonee,this.city,this.areas,this.user);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

//   String countryName = '20';
//   final formm = GlobalKey<FormState>();
//   TextEditingController BuildingName = TextEditingController();
//   TextEditingController ClintName = TextEditingController();
//   TextEditingController FloorNumber = TextEditingController();
//   TextEditingController Apartment = TextEditingController();
//   TextEditingController address = TextEditingController();
//   TextEditingController phone = TextEditingController();
//   List<Cities> cities = [];
//   Cities city;
  List<Areas> areaa = [];
//   List<Cities> ee;
  Areas areas;
//   var selected;
//   bool chance;
//   String name;
//   String buildNumber;
//   String fullAddress;
//   String floorNumber;
//   String Apartmen;
//   String landMark;
//   String phonee;
//   @override

  String countryName = '20';

  dynamic CityDropDown = 'Cairo';
  var elemant = [];

  String Dropdownvalue = 'Maadi';
  var item = [
    'Maadi',
  ];

  List<Cities> cities = [];
  Cities city;
  List<Areas> area = [];
  List<Cities> ee;
  var selected;
  bool chance;
  String name = 'ddddd';

  final form = GlobalKey<FormState>();
  TextEditingController BuildingName = TextEditingController();
  TextEditingController FloorNumber = TextEditingController();
  TextEditingController Apartment = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  final ClintName = TextEditingController();
  Citys citys;
  // Area area;
  @override
  void initState() {
    super.initState();
    print(widget.name);
    name = widget.name;
    ClintName.text = name;
    BuildingName.text = widget.buildNumber;
    FloorNumber.text = widget.floorNumber;
    Apartment.text = widget.Apartmen;
    address.text = widget.fullAddress;
    phone.text = widget.phonee;
    Apartment.text = widget.Apartmen;
    citys =widget.city;
    // area =widget.areas;


  }


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => GetAddressBloc(),
        child: BlocConsumer<GetAddressBloc, GetAddressState>(
            listener: (context, state) {
              if(state is SuccessAddState){
                cities = state.data;
                print(areaa);

              }
              if (state is ChangeState) {
                city = state.cityChange;
                areas = null;
                areaa = state.cityChange.areas;
                print(city.toString() + 'zaaaaaaaaaa');

              }
              if (state is SucessAdd) {
                print('zzzzzzzzzzzzzzzz');
                print(state.value.city.toString() + 'sasaaaaaaaaaa');
                widget.user = state.value;
                print(widget.user.address);
                print(widget.user.name);
                print('wegzzzzzzzzzzzzzzz');

                print(widget.user.phone);
                print(widget.user.id);

                Navigator.pop(context, widget.user);

                // BlocProvider.of<GetAddressBloc>(context).add(startScreenEvent());
              }
            },

            builder: (context, state) {
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
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              'Add New Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.grey),
                            ),
                          ),
                          Column(children: [
                            Form(
                              key: form,
                              child: Column(children: [
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 350.0,
                                  height: 1.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey,
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
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15, left: 15),
                                          child: Center(
                                              child: TextFormField(
                                                // initialValue: widget.name,
                                                controller: ClintName ,
                                              )
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
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
                                          height: 5,
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
                                            child: DropdownButtonFormField<Cities>(
                                              value: city,
                                              isExpanded: true,
                                              onChanged: (Cities Value) {
                                                city = Value;
                                                BlocProvider.of<GetAddressBloc>(
                                                    context)
                                                    .add(OncityChange(city));
                                                print(city.name);
                                                print(city.id.toString() +
                                                    'ashhhhhhhhhrakaaaaat');
                                              },
                                              items: cities.map((Cities user) {
                                                return new DropdownMenuItem<Cities>(

                                                  value: user,
                                                  child: new Text(
                                                    user.name,
                                                    style: new TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                );
                                              }).toList(),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.name.isEmpty) {
                                                  return "build number field is required";
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
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
                                          height: 5,
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
                                            child: DropdownButtonFormField<Areas>(
                                              value:  areas,
                                              isExpanded: true,
                                              onChanged: (Areas Value) {
                                                areas = Value;
                                                BlocProvider.of<GetAddressBloc>(
                                                    context)
                                                    .add(onAreachange(areas));
                                              },

                                              items: areaa.map((Areas value) {
                                                return new DropdownMenuItem<Areas>(
                                                  key: Key(value.id),
                                                  value: value,
                                                  child: new Text(
                                                    value.name,
                                                    style: new TextStyle(
                                                        color: Colors.black),
                                                  ),

                                                );
                                              }).toList(),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.name.isEmpty) {
                                                  return "build number field is required";
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
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
                                          height: 5,
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
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            "Full Address",
                                            style: TextStyle(color: Colors.black38),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
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
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            "Floor Number",
                                            style: TextStyle(color: Colors.black38),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
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
                                                  height: 10,
                                                ),
                                                Container(
                                                  width: 500,
                                                  child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
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
                                                          height: 5,
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
                                                          height: 10,
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
                                                          height: 5,
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
                                                            TextInputType
                                                                .number,
                                                            decoration:
                                                            InputDecoration(
                                                              hintText:
                                                              "phone Number",
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
                                                              prefixIcon: Container(
                                                                width: 60,
                                                                child: Row(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap: () {
                                                                        showCountryPicker(
                                                                          context:
                                                                          context,
                                                                          showPhoneCode:
                                                                          true,
                                                                          onSelect:
                                                                              (Country
                                                                          country) {
                                                                            print(
                                                                                "FF: ${country.countryCode}");
                                                                            setState(
                                                                                    () {
                                                                                  countryName =
                                                                                      country.phoneCode;
                                                                                });
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            right:
                                                                            17,
                                                                            left:
                                                                            15,
                                                                            top: 8),
                                                                        height: 20,
                                                                        child: Text(
                                                                          '+${countryName}',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                              12,
                                                                              wordSpacing:
                                                                              10,
                                                                              color: Colors
                                                                                  .grey
                                                                                  .shade700),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    // Icon(
                                                                    //   Icons.arrow_drop_down,
                                                                    //   color: Colors.black12,
                                                                    //   size: 20,
                                                                    // ),
                                                                    Container(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade300,
                                                                      child:
                                                                      SizedBox(
                                                                        width: 1.0,
                                                                        height:
                                                                        25.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly,
                                                              LengthLimitingTextInputFormatter(
                                                                  10),
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                  r'^[1-9][0-9]*$'))
                                                            ],
                                                            validator: (value) {
                                                              if (value == null ||
                                                                  value.isEmpty) {
                                                                return "required phone number";
                                                              }
                                                              if (value.length <
                                                                  9) {
                                                                return "Mobile number should be between 8 and 10 numbers";
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
                                                                    width: 200,
                                                                    height: 50,
                                                                    child: TextButton(
                                                                      style: TextButton
                                                                          .styleFrom(
                                                                        padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                          left:
                                                                          15.0,
                                                                          right:
                                                                          15.0,
                                                                        ),
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
                                                                      // condition: state
                                                                      // is! CreateLoadingState,
                                                                      // builder:
                                                                      //     (context) =>
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          if (form
                                                                              .currentState
                                                                              .validate()) {
                                                                            BlocProvider.of<GetAddressBloc>(context).add(AddAddress(
                                                                                ClintName.text,
                                                                                BuildingName.text,
                                                                                address.text,
                                                                                phone.text,
                                                                                Apartment.text,
                                                                                FloorNumber.text,areas,city));
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

                                                                    )),

                                                              ),
                                                            ]),
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

            }));}
}

//     BlocProvider(
//         create: (context) => GetAddressBloc(),
//         child: BlocConsumer<GetAddressBloc, GetAddressState>(
//         listener: (context, state) {
//       // if(state is SuccessAddressState){
//       //   print(state.value.data.data.first.address + 'yaaaaarab');
//       //   name = state.value.data.data.first.name;
//       //   buildNumber = state.value.data.data.first.buildingNumber;
//       //   fullAddress = state.value.data.data.first.address;
//       //   floorNumber = state.value.data.data.first.floorNumber;
//       //   Apartmen = state.value.data.data.first.apartmentNumber;
//       //   landMark = state.value.data.data.first.landlineNumber;
//       //   phonee = state.value.data.data.first.phone;
//
//
//       // }
//     },
//     builder: (context, state) {
//