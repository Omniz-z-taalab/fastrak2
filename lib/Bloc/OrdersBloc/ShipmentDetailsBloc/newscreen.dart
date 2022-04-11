import 'package:fastrak2/Bloc/OrdersBloc/PromoCodeBloc/promo_code_bloc.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/network/ImagesScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen extends StatefulWidget {
  String num;
  String bottom;
  String dropdownValue;
  String Dropdown;
  int integer;
  String Size;
  Data newuser;
  Data newman;

  Screen(this.bottom, this.num, this.newuser, this.Dropdown, this.dropdownValue,
      this.integer, this.Size, this.newman);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PromoCodeBloc(),
        child: BlocConsumer<PromoCodeBloc, PromoCodeState>(
            listener: (context, state) {
          if (state is CodeSuccess) {
            print('voooooov');
          }
        }, builder: (context, state) {
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
              body: Column(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Shipment Cost",
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
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery fee",
                          style: TextStyle(color: Colors.black38, fontSize: 15),
                        ),
                        SizedBox(
                          width: 163,
                        ),
                        Text(
                          "Discount code",
                          style: TextStyle(color: Colors.black38, fontSize: 15),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 100, right: 60, top: 25, bottom: 25),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.purple.shade100.withOpacity(.03),
                                spreadRadius: 3),
                          ]),
                      child: Text(
                        '${widget.integer.toString() + widget.num}'
                        'EGP',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF4B0082)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                    width: 20,
                  ),
                  InkWell(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 70, right: 50, top: 35, bottom: 35),
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: ExactAssetImage(PromoCode),
                              fit: BoxFit.none,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      Colors.purple.shade100.withOpacity(.03),
                                  spreadRadius: 3),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) {
                              return Column(children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade300))),
                                  child: ListTile(
                                    title: Center(child: Text('Discount Code')),
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade300)),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      PromoCode,
                                      width: 300,
                                      height: 80,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 60),
                                    child: Container(
                                        height: 400,
                                        child: Column(children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15,
                                                right: 310,
                                                top: 10,
                                                bottom: 6),
                                            child: Text('Enter Code'),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  right: 15, left: 15),
                                              child: SizedBox(
                                                height: 45,
                                                child: TextFormField(
                                                    controller: code,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    decoration: InputDecoration(
                                                      hintText: 'Discount Code',
                                                      hintStyle: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors
                                                              .grey.shade500),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300,
                                                                  width: 1.0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300,
                                                                  width: 1.0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return "Email Field is required";
                                                      }
                                                      if (!RegExp(
                                                              "[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                                          .hasMatch(value)) {
                                                        {
                                                          return "Invalid email";
                                                        }
                                                      }
                                                      return null;
                                                    }),
                                              )),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15,
                                                          top: 15,
                                                          bottom: 15),
                                                  child: Container(
                                                      width: 360,
                                                      height: 50,
                                                      child: TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15.0,
                                                                  right: 15.0,
                                                                  top: 15,
                                                                  bottom: 15),
                                                          primary: Colors.black,
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 20),
                                                          backgroundColor:
                                                              Color(0xFF4B0082),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          "Next",
                                                          style: TextStyle(
                                                              fontSize: 18.0,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        onPressed: () {
                                                          BlocProvider.of<
                                                                      PromoCodeBloc>(
                                                                  context)
                                                              .add(CheckCode(code.text));
                                                        },
                                                      )),
                                                )
                                              ])
                                        ])))
                              ]);
                            });
                      })
                ])
              ]));
        }));
  }
}
