import 'package:conditional_builder/conditional_builder.dart';
import 'package:fastrak2/Bloc/cubitLogin/password_cubit.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Password extends StatefulWidget {
String phone;
Password(this.phone);
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFF9FAFF)));
    return BlocProvider(
    create: (context)=> FastrakPasswordBloc() ,
    child: newpass('${widget.phone}'));
    }}


    class newpass extends StatefulWidget {
      String phone;
      String countryName;
      newpass(this.phone);

      @override
      State<newpass> createState() => _newpassState();
    }

    class _newpassState extends State<newpass> {

      TextEditingController password = TextEditingController();
      TextEditingController phone = TextEditingController();
      final key = GlobalKey<FormState>();

      String countryName = '02';
      void initState() {
        if (widget.phone != null) {
          phone.text = widget.phone;
        }
        print('omnia:${widget.phone}');
        super.initState();
      }
      @override
      Widget build(BuildContext context) {

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
                    child: Form(
                      key: key,
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
      //             Padding(
      //               padding: const EdgeInsets.only(right: 15.0,left: 15),
      //               child: Container(
      //                 width: 350,
      //                 height: 50,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(10),
      //                   color: Color(0xFF4B0082),
      //                 ),
      //                 child: ConditionalBuilder(
      //                   // condition: state is! FastrakPasswordLoading,
      //                   builder: (context) => TextButton(onPressed: () {
      // if (key.currentState.validate());
      //              // context.read<FastrakPasswordBloc>().(()),
      //
      //                     child: Align(
      //                         alignment: Alignment.center,
      //                         child: Text(
      //                           'Next',
      //                           style:
      //                           TextStyle(color: Colors.white),
      //                         // )),
      //                   ),
      //
      //                 ),
      //               ),
      //             ),
      //             ],
      //         ),
      //       ),
      //     ),
      //   ),

                        ]))))
);
  }}
  //
// }

// create: (context) => FastrakPasswordBloc(),
//       child: BlocConsumer<FastrakPasswordBloc, FastrakPasswordState>(
//       listener: (context, state) {
//     if(state is FastrakPasswordSuccess){
//       if (state.checkPassword.data.hasPassword){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
//       }}if(state is FastrakPasswordError){
//           Fluttertoast.showToast(msg: '${state.error.errors[0].message}',
//               textColor: Colors.white,
//               backgroundColor: Colors.red);
//       }