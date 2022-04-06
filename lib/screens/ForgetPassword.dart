import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  String phone;
  ForgotPassword( this.phone, );

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: (){
          Navigator.pop(context);
        },),
      ),
    );
  }
}
