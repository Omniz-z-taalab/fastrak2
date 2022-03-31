
import 'package:conditional_builder/conditional_builder.dart';
import 'package:dio/dio.dart' as Dio;

import 'package:fastrak2/Bloc/cubitLogin/fastrak_login_cubit.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/checkuser.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/loading/loading.dart';
import 'package:fastrak2/network/endpoint.dart';
import 'package:fastrak2/screens/Home.dart';
import 'package:fastrak2/screens/Registar.dart';
import 'package:fastrak2/screens/password.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String countryName = '20';

  TextEditingController phone = TextEditingController();
  final _key = GlobalKey<FormState>();

  //3.126.221.243:8080

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FastrakLoginCubit(),
      child: BlocConsumer<FastrakLoginCubit, FastrakLoginState>(
        listener: (context, state) {
          print('qqqqqqqqqqqqq');
              if(state is FastrakLoginSuccess){
                print('aaaaaaaaaaaaa');
              if (state.checkUser.data.isExist){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Password('$countryName-${phone.text}')));
                print(state.checkUser);
              }else{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Registration('${phone.text}')));
                print(state.checkUser);
              }
        }},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xFFF9FAFF),
            appBar: new AppBar(
              elevation: 0,
              title: Center(
                child: Image.asset(
                  'images/Logoword.png',
                  width: 250,
                  height: 80,
                ),
              ),
              backgroundColor: Color(0xFFF9FAFF),
            ),
            body: SingleChildScrollView(
                //
                child: Padding(
              padding: const EdgeInsets.only(top: 25.0, right: 25, left: 25),
              child: Container(
                  height: 770,
                  width: 370,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF6B778D80).withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 1),
                        ),
                      ]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: Image.asset(
                            'images/group.png',
                            height: 300,
                            width: 250,
                          ),
                        ),
                        Text("SIGN IN",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 35.0,
                          height: 5.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _key,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('Mobile Number',
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 11)),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                                width: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, left: 15),
                                child: TextFormField(
                                  controller: phone,
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "phone Number",
                                    hintStyle: TextStyle(color: Colors.grey),
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
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade500),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: Container(
                                      width: 60,
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              showCountryPicker(
                                                context: context,
                                                showPhoneCode: true,
                                                onSelect: (Country country) {
                                                  print(
                                                      "FF: ${country.countryCode}");
                                                  setState(() {
                                                    countryName =
                                                        country.phoneCode;
                                                  });
                                                },
                                              );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 17, left: 15, top: 8),
                                              height: 20,
                                              child: Text(
                                                '+${countryName}',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    wordSpacing: 10,
                                                    color:
                                                        Colors.grey.shade700),
                                              ),
                                            ),
                                          ),
                                          // Icon(
                                          //   Icons.arrow_drop_down,
                                          //   color: Colors.black12,
                                          //   size: 20,
                                          // ),
                                          Container(
                                            color: Colors.grey.shade300,
                                            child: SizedBox(
                                              width: 1.0,
                                              height: 25.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^[1-9][0-9]*$'))
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "required phone number";
                                    }
                                    if (value.length < 9) {
                                      return "Mobile number should be between 8 and 10 numbers";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                      child: socialButton(
                                          "images/facebook.png", "Facebook")),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: socialButton(
                                          "images/google.png", "Google")),
                                  SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       right: 15.0, left: 15),
                              //   child: InkWell(
                              //       child: Container(
                              //         width: 350,
                              //         height: 50,
                              //         decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(10),
                              //           color: Color(0xFF4B0082),
                              //         ),
                              //         child: Align(
                              //             alignment: Alignment.center,
                              //             child: Text(
                              //               'Next',
                              //               style:
                              //                   TextStyle(color: Colors.white),
                              //             )),
                              //       ),
                              //       onTap: () {
                              //         if (_key.currentState.validate()) {
                              //         } else {}
                              //       }),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0,left: 15),
                                child: Container(
                                  width: 350,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF4B0082),
                                  ),
                                  child: ConditionalBuilder(
                                    condition: state is! FastrakLoginLoading,
                                    builder: (context) => TextButton(onPressed: () {
                                      if (_key.currentState.validate())
                                        FastrakLoginCubit.get(context)
                                            .user(phone: phone.text);

                                    },
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Next',
                                          style:
                                          TextStyle(color: Colors.white),
                                        )),
                                    ),
                                    fallback: (context) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: 320.0,
                                height: 1.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15.0, left: 15),
                                  child: InkWell(
                                      child: Container(
                                        width: 350,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Continue As Guest',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                        builder: (context) => Home()));
                                      })),
                            ],
                          ),
                        )
                      ])),
            )),
          );
        },
      ),
    );
  }

  Widget socialButton(String image, String title) {
    return Container(
        height: 45,
        width: 90,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade500, width: 1),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image,
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    color: Colors.black87),
              ),
            ]));
  }
}
