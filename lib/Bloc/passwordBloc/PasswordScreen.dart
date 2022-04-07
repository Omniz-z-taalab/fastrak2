import 'package:conditional_builder/conditional_builder.dart';
import 'package:fastrak2/Bloc/passwordBloc/Password%20State.dart';
import 'package:fastrak2/Bloc/passwordBloc/PasswordBloc.dart';
import 'package:fastrak2/Bloc/passwordBloc/PasswordEvent.dart';
import 'package:fastrak2/Chash/cashHelper.dart';
import 'package:fastrak2/network/ImagesScreen.dart';
import 'package:fastrak2/screens/Home.dart';
import 'package:fastrak2/screens/ForgetPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


    class PasswordScreen extends StatefulWidget {
      String phone;
      String countryName;
      PasswordScreen(this.phone);

      @override
      State<PasswordScreen> createState() => _PasswordScreenState();
    }

    class _PasswordScreenState extends State<PasswordScreen> {

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
      // eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMTI3MGFiYmRiOTM3OWVjODY3NzA2MjMxODMzMDgzOGE3MDI5ZTZkMjQ5OTAwYjdhYTNhOTAyOTY5ZDNlMjgzNDdjYTQ0Y2I4MGJkNmVkMWYiLCJpYXQiOjE2NDkzMzMzNDksIm5iZiI6MTY0OTMzMzM0OSwiZXhwIjoxNjgwODY5MzQ5LCJzdWIiOiIyMTMxZGVjZC0wYTdhLTQwMjQtODBiZi03ODM3MmIwNjkzMjAiLCJzY29wZXMiOltdfQ.XPEAghQsBQJYHQfrvntv-ga-X5C0iE9JiuNvaexDWwiS92b18ZsZZb7s72Pp64our9QfCOER1OQbsSjN4yhRmizcXrW9zCyn__Vyoi5P6uPFGV80G6KNdO27NMKsfx5LVRfJZ5x4a4dYypZexqV5vjteF_XD5NcmPIaz8V113yZ2rlxZRAE_jz3-rygGk2EBKzZAR8sND6kIcFZzjEBoqNtmc0V4bzqlDzEXMMiYV1TFLi322VniUC9ZcbMtw5EK_riFQwg392FXnulhGE6zouz3BYL7MQabZwZ_08CIlmVXjbcL20aqZeTErsgNtgYht5RUt3bmuqeiES_Y6s1h6x8P9SY8Lm1VWm_AAnaWoUZUn37HlGues3JeoNySL1UcM50wPXiw-dQ6FQRSwFtiF3I1A9KLh_dsfz_8ZiNt7mqj9kQkRk_lNZIeu9Nxrea_2qM6WvI8TxzPrwTIfoyqnzekpPg2T9cG8eEQokS2wVV3O2EJ1mNI7DhqgWS99glc4yctLOcIoXWpXWUEFeXjpVw8le3_WOC4_PMgG0gnvMmZfE40kpC6i_Rw6asJmb6FuSqEK5mKpSEXOCQrucwBtsSPdYIo3PuvM1LdJdVTSCFT8Iutp1JPhANCT1H7iVW2N7BBkeg8_K0BstIL3ZkRtcuwEYA0Fml1rc7vklpes_s

      Widget build(BuildContext context) {
      return BlocProvider(
            create: (context) => PasswordBloc(),
            child: BlocConsumer<PasswordBloc, PasswordState>(
            listener: (context, state){
            if(state is PasswordSuccess){
              print(state.value.data.accessToken);
              print('omniaaaaaaaaaaa3');
              CacheHelper.saveData(key: 'firstName', value: state.value.data.firstName).then((value){
                print(state.value.data.firstName);
                CacheHelper.saveData(key: 'token', value: state.value.data.accessToken).then((value){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              });});

            }if(state is PasswordErrorr){
              Fluttertoast.showToast(
                  msg: state.ctch.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.yellow,
                  textColor: Colors.black,
                  fontSize: 10.0);
            }
        },
        builder: (context, state) {
  return Scaffold(
      backgroundColor: Color(0xFFF9FAFF),
      appBar: AppBar(
        elevation: 0,
      title: Padding(
        padding: EdgeInsets.only(left: 20),
      child: Image.asset(
     FastrakLogo,
      width: 250,
      height: 80,
      ),),
        leading: BackButton(
          onPressed: () {
            // hideProgress();
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
                      FastrakLogin,
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
                                              ForgotPassword(widget.phone)));
                                });
                              }),
                          SizedBox(
                            height: 30,
                          ),
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
                                 condition: state is! PasswordLoading,
                                builder: (context) => TextButton(
                                  onPressed: () {
                                    BlocProvider.of<PasswordBloc>(context).add(PasswordUsser(password.text,phone.text,countryName));
                                  },
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text('NEXT',style: TextStyle(fontSize: 14,color: Colors.white),)),
                                ),
                                fallback: (context) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),),),
                        ],
                      ),
                    ),
                  ),


                        ]))))
);}));
  }}
