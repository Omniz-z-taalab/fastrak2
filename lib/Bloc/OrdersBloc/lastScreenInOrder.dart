import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:flutter/material.dart';

class lastScreenInOrder extends StatefulWidget {
  String number;
  String shetbutton;
  String Drob;
  String Down;
  int intt;
  String Sizee;
  AdressUser newnewuser;
  AdressUser newnewman;

  lastScreenInOrder(this.shetbutton, this.number, this.newnewman, this.Drob,
      this.newnewuser, this.Down, this.intt, this.Sizee);

  @override
  State<lastScreenInOrder> createState() => _lastScreenInOrderState();
}

class _lastScreenInOrderState extends State<lastScreenInOrder> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.number);
    print(widget.shetbutton);
    print(widget.newnewman);
    print(widget.Drob);
    print(widget.newnewuser);
    print(widget.Down);
    print(widget.intt);
    print(widget.Sizee);



  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
