import 'package:fastrak2/Chash/cashHelper.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/passwodApi.dart';
import 'package:fastrak2/loading/loading.dart';
import 'package:fastrak2/network/endpoint.dart';
import 'package:fastrak2/screens/Home.dart';
import 'package:fastrak2/screens/Otp.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Password extends StatefulWidget {

  String phone;
  // String countryName;
  Password(this.phone);

  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController password = TextEditingController();
  TextEditingController _phone = TextEditingController();
  String countryName;
  void initState() {
    if (widget.phone != null) {
      _phone.text = widget.phone;
    }
    print('omnia:${widget.phone}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFF9FAFF)));
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFF),

      appBar: AppBar(
        elevation: 0,
      title: Padding(
        padding: EdgeInsets.only(left: 20),
      child: Image.asset(
      'images/Logoword.png',
      width: 250,
      height: 80,
      ),),
        leading: BackButton(
          onPressed: () {
            hideProgress();
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF9FAFF),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              height: 560,
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
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Image.asset(
                      'images/group.png',
                      height: 300,
                      width: 250,
                    ),
                  ),
                  Text("ENTER YOUR PASSWORD",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    width: 45.0,
                    height: 5.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0,right: 20),
                          child: Text(
                            "Password",
                            style: TextStyle(color: Colors.black38, fontSize: 11),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: password,
                        obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',hintStyle: TextStyle(fontSize:12 ,color: Colors.grey.shade500),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:   Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)),),

                        ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                              child: Text(
                                "Forget password?",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4B0082),
                                    fontWeight: FontWeight.w400),
                              ),
                              onTap: () {
                                setState(() async {

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OTP(widget.phone)));
                                });
                              }),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15),
              child: InkWell(
                onTap: () {
            newwpass();
            },
                child: Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF4B0082),
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w500),
                      ),),

                      ),
                    ),
                  ),
                  ],
              ),
            ),
          ),
        ),

  );
  }

  Future<passwordApi> newwpass() async {
    try {
      showProgress(context, 'Loading', true);
      Dio.Response response = await dio().post(
          PASSWORD,
          data: {
            'countryName': countryName,
            'phone': _phone.text,
            'password': password.text,
          });
      if (response.statusCode == 200) {
        Data user = Data.fromJson(response.data['data']);
        if (user.hasPassword) {
          FocusManager.instance.primaryFocus?.unfocus();

          hideProgress();
          final data = jsonEncode(user.toJson());
          CacheHelper.putData(key: 'user', value: data);
          CacheHelper.putData(key: 'token', value: user.accessToken);
          CacheHelper.putData(key: 'firstName', value: user.firstName);
          print('mmmmmmmmmm' + CacheHelper.getData(key: 'token'));
          Navigator.push(context , MaterialPageRoute(builder: (context) =>
              Home()));

        }
      } else {
        print("error");
      }
    }  on DioError catch (e) {
      if (e.response != null) {
        print('gggggg');
        Error errorr = Error.fromJson(e.response.data);
        print(errorr.errors[0].message);
        Fluttertoast.showToast(msg: '${errorr.errors[0].message}',
            textColor: Colors.white,
            backgroundColor: Colors.red);
      }}}}
