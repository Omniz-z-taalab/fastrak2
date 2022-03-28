import 'dart:io';
import 'package:fastrak2/loading/loading.dart';
import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:fastrak2/Chash/cashHelper.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/Models/Api/Error.dart';
import 'package:fastrak2/Models/Api/RegistarApi.dart';
import 'package:fastrak2/network/endpoint.dart';
import 'package:fastrak2/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Registration extends StatefulWidget {
  String phone;

  Registration(this.phone);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController passwordconfirm = TextEditingController();
  String countryName = '20';
  bool isCheck = false;
  File _image;
  final imagepicker = ImagePicker();
  bool _isHidden = true;

  Future<RegisterApi> setData() async {
    showProgress(context, 'Loading...', true);
    try {
      Dio.Response response = await dio().post(REGISTER, data: {
        'first_name': firstname.text,
        'last_name': lastname.text,
        'password': password.text,
        'phone': phone.text,
      });
      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        Data res = Data.fromJson(response.data['data']);
        CacheHelper.putData(key: 'firstName', value: res.firstName);
        hideProgress();
        print(res.phone);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        print('error');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('gggggg');
        Error error = Error.fromJson(e.response.data);
        print(error.errors[0].message);
        Fluttertoast.showToast(
            msg: '${error.errors[0].message}',
            textColor: Colors.white,
            backgroundColor: Colors.red);
      }
    }
  }

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
          padding: EdgeInsets.all( 10),
          child: Image.asset(
            'images/Logoword.png',
            width: 250,
            height: 80,
          ),
        ),
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
              height: 900,
              width: 370,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF6B778D80).withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 9,
                      offset: Offset(0, 1),
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 2,
                  // ),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("SIGN UP",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  SizedBox(
                    width: 35.0,
                    height: 5.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () async {
                      var status = await Permission.camera.status;
                      if (!status.isGranted) {
                        await Permission.camera.request();
                      }
                    },
                    child: Column(
                      children: [
                        Column(children: [
                          Container(
                              height: 145,
                              width: 153,
                              decoration: BoxDecoration(
                                color: Color(0xFFD5C7E5),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Color(0xFFECE4F1),
                                  width: 12,
                                ),
                              ),
                              child: _image == null
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFFDBCDE6),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                      ),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            // _image == null
                                            Column(children: [
                                              Image.asset('images/camera.png'),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Profile Photo",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.0,
                                                  color: Color(0xFF4B0082),
                                                ),
                                              ),
                                            ])
                                          ]),
                                      onPressed: () {
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
                                                            "Choose option",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 15)),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors.grey
                                                                  .shade300)),
                                                    ),
                                                    child: ListTile(
                                                      title: Center(
                                                        child: Text(
                                                          "Gallery",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .lightBlueAccent,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                      onTap: pickImage,
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
                                                          "Camera",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .lightBlueAccent,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                      onTap: takePhoto,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Center(
                                                      child: Text("Cancel",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontSize: 20)),
                                                    ),
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                    )
                                  : Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Stack(
                                          children: [
                                            Container(
                                              child: Image.file(
                                                File(_image.path),
                                                fit: BoxFit.fill,
                                              ),
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _image = null;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.cancel,
                                                  color: Colors.red,
                                                ))
                                          ],
                                        ),
                                      ),
                                    )),
                          SizedBox(
                            height: 15,
                          ),
                          Form(
                            key: _formkey,
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 285),
                              child: Text(
                                'First Name',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 11),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 15, left: 15),
                              child: SizedBox(
                                height: 45,
                                child: TextFormField(
                                  controller: firstname,
                                  keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'first name',hintStyle: TextStyle(fontSize:12 ,color: Colors.grey.shade500),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color:   Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)),),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "First name Field is required";
                                    }
                                    if (value.length > 7) {
                                      return 'Must be less than 7 charater ';
                                    }
                                    // return null if the text is valid
                                    return null;
                                  },
                                ),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 280),
                            child: Text(
                              'Last Name',
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 11),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 15, left: 15),
                              child: SizedBox(
                                height: 45,
                                child: TextFormField(
                                    controller: lastname,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'last name',hintStyle: TextStyle(fontSize:12 ,color: Colors.grey.shade500),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color:   Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)),),

                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Last name Field is required";
                                      }
                                      if (value.length > 7) {
                                        return 'Must be less than 7 charater ';
                                      }
                                      // return null if the text is valid
                                      return null;
                                    }),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 265),
                            child: Text(
                              'Email Address',
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 11),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 15, left: 15),
                              child: SizedBox(
                                height: 45,
                                child: TextFormField(
                                    controller: Email,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Email',hintStyle: TextStyle(fontSize:12 ,color: Colors.grey.shade500),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color:   Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)),),

                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
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
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 265),
                            child: Text(
                              'Mobile phone',
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 11),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15, left: 15),
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                controller: phone,
                                keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Mobile Number',hintStyle: TextStyle(fontSize:12 ,color: Colors.grey.shade500),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color:   Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)),

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
                                                right: 15, left: 20),
                                            height: 20,
                                            child: Text(
                                              '${countryName}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  wordSpacing: 10),
                                            ),
                                          ),
                                        ),
                                        // Icon(
                                        //   Icons.arrow_drop_down,
                                        //   color: Colors.black12,
                                        //   size: 20,
                                        // ),
                                        Container(
                                          color: Colors.grey.shade500,
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
                                    return "A Mobile number is required";
                                  }
                                  if (value.length < 9) {
                                    return "Mobile number should be 10 numbers";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 200),
                          child: Text(
                            'Company Name (Optional)',
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 11),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 15, left: 15),
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'company name',hintStyle: TextStyle(fontSize:12 ,color: Colors.grey.shade500),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color:   Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)),),

                                ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 280),
                          child: Text(
                            'Password',
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 11),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 15, left: 15),
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                  controller: password,
                                  obscureText: _isHidden,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: '******',hintStyle: TextStyle(fontSize:12 ,color: Colors.grey.shade500),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color:   Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)),),

                                  validator: (value) {
                                    // add your custom validation here.
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    if (value.length < 5) {
                                      return 'Must be more than 4 charater';
                                    }
                                    return null;
                                  }),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 240),
                          child: Text(
                            'Confirm Password',
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 11),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 15, left: 15),
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                controller: passwordconfirm,
                                obscureText: _isHidden,

                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: '******',hintStyle: TextStyle(fontSize:12 ,color: Colors.grey.shade500),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color:   Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),borderRadius: BorderRadius.circular(10)),),

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Password field is required";
                                  }
                                  if (password.text != passwordconfirm.text) {
                                    return 'password should contain a minimum of 8 characters '
                                        'and numbers,lower case';
                                  }

                                  return null;
                                },
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Checkbox(
                                    value: isCheck,
                                    checkColor: Colors.white,
                                    activeColor: Color(0xFF4B0082),
                                    onChanged: (bool value) {
                                      setState(() {
                                        isCheck = value;
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 20,
                                // width: 95,
                                child: Text(
                                  "I agree to the",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                height: 27,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  // SizedBox(
                                  //   height: 27,
                                  // Container(
                                  //   margin:
                                  //       EdgeInsets.only(bottom: 15, top: 5),
                                  child: Text(
                                    'Terms & Conditions',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4B0082)),
                                  ),
                                ),
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0, left: 15),
                          child: Container(
                            width: 350,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState.validate()) {
                                  if (isCheck != true) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "you should agree to terms and Conditions and Privacy Policy to be able to continue",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.yellow,
                                        textColor: Colors.black,
                                        fontSize: 10.0);
                                  } else {
                                    setData();
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 6),
                                //  primary: Color(0xFF4B0082)),
                                primary: Color(0xFF4B0082),
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),

                                  // ButtonStyle(
                                ),
                              ),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  pickImage() async {
    var pickedImage = await imagepicker.getImage(source: ImageSource.gallery);
    Navigator.pop(context);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {}
    });
  }

  takePhoto() async {
    var takePhoto = await imagepicker.getImage(source: ImageSource.camera);
    Navigator.pop(context);
    setState(() {
      if (takePhoto != null) {
        _image = File(takePhoto.path);
      } else {}
    });
  }
}
