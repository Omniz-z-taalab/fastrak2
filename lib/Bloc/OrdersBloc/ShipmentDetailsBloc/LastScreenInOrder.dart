import 'package:fastrak2/Bloc/OrdersBloc/ShipmentDetailsBloc/shipment_details_bloc.dart';
import 'package:fastrak2/Bloc/passwordBloc/Password%20State.dart';
import 'package:fastrak2/Models/Api/GetaddApi.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/network/ImagesScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LastScreenInOrder extends StatefulWidget {
  String weight;
  String DeliveryTime;
  AdressUser newman;
  AdressUser newuser;
  String collectAmount;
  String description;
  bool isSwitched;
  int index;
  int integer;
  dynamic eeeee;
  int current;
  String dropdownValue;
  int value;
  UserAddress Dropof;
  UserAddress pickupfrom;

  LastScreenInOrder(
      this.isSwitched,
      this.weight,
      this.DeliveryTime,
      this.newman,
      this.newuser,
      this.collectAmount,
      this.description,
      this.index,
      this.integer,
      this.eeeee,
      this.current,
      this.dropdownValue,
      this.value,
      this.Dropof,
      this.pickupfrom);

  State<LastScreenInOrder> createState() => _LastScreenInOrderState();
}

class _LastScreenInOrderState extends State<LastScreenInOrder> {
  bool isCheck = false;
  int value = 0;
  @override
   newAddress (){
    if (widget.newman.address != null) {
      Text(widget.newman.address);
    } else if (widget.pickupfrom.address !=
        null) {
      Text(widget.pickupfrom.address);}
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.pickupfrom.address);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ShipmentDetailsBloc(),
        child: BlocConsumer<ShipmentDetailsBloc, ShipmentDetailsState>(
            listener: (context, state) {
          if (state is StateSuccess) {
            // print(state.value.data.weight);
            showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300))),
                          child: ListTile(
                            title: Center(child: Text('Discount Code')),
                          ),
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey.shade300)),
                          ),
                          child: Center(
                            child: Image.asset(
                              DoneOrder,
                              width: 300,
                              height: 80,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 15, bottom: 15),
                                child: Container(
                                  width: 360,
                                  height: 50,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          top: 15,
                                          bottom: 15),
                                      primary: Colors.black,
                                      textStyle: const TextStyle(fontSize: 20),
                                      backgroundColor: Color(0xFF4B0082),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ]);
                });
          }
        }, builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Image.asset(
                'images/Logoword.png',
                width: 250,
                height: 80,
              ),
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.black,
              ),
              backgroundColor: Color(0xFFF9FAFF),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'My Shipment Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: 350,
                    height: 1250,
                    decoration: BoxDecoration(
                      color: Color(0xFFF9FAFF),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF6B778D80).withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    // child: Container(
                    //   color: Color(0xFFF9FAFF),
                    //   padding: EdgeInsets.all(20),
                    child: Container(
                      padding: EdgeInsets.only(right: 10, left: 10, bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.purple.shade100.withOpacity(.03),
                                spreadRadius: 3),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Shipment Average Weight",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF11364D5E),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.06),
                                    ),
                                  ]),
                              child: Center(
                                child: Text(widget.weight),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Direction",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF11364D5E),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.06),
                                    ),
                                  ]),
                              child: Center(
                                child: Text('OutSide city'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Pickup from",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 300,
                            height: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF11364D5E),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.06),
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: SizedBox(
                                  height: 1,
                                  child: Column(children: [
                                    Text (widget.newman.address != null ?widget.newman.address
              :widget.pickupfrom.address),

                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(widget.newman.phone != null
                                          ? widget.newman.phone
                                          : widget.pickupfrom.phone)
                                      // ]),
                                    ]
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Deliver to ",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              width: 300,
                              height: 80,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF11364D5E),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(.06),
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: SizedBox(
                                    height: 1,
                                    child: Column(children: [
                                      Text(widget.Dropof.address != null
                                          ? widget.Dropof.address
                                          : widget.newuser.address),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(widget.Dropof.phone != null
                                          ? widget.Dropof.phone
                                          : widget.newuser.phone)
                                    ]),
                                    // ]),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Deliver type",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF11364D5E),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.06),
                                    ),
                                  ]),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(widget.DeliveryTime),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Shipping fees',
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF11364D5E),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(.06),
                                      ),
                                    ]),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(widget.eeeee.toString()),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Collected amount",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF11364D5E),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(.06),
                                      ),
                                    ]),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child:
                                        Text(widget.collectAmount.toString()),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Fragile items",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF11364D5E),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.06),
                                    ),
                                  ]),
                              child: Center(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: widget.isSwitched == false
                                          ? Text('no')
                                          : Text('yes'))),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "No. of prices",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF11364D5E),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.06),
                                    ),
                                  ]),
                              child: Center(
                                  child: Align(
                                alignment: Alignment.center,
                                child: Text('1'),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Payment method",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF11364D5E),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.06),
                                    ),
                                  ]),
                              child: Center(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: widget.current == 0
                                        ? Text('Cash On Delivery')
                                        : Text('Cach On Pickup')),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Shipment description  ",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF11364D5E),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.06),
                                    ),
                                  ]),
                              child: Center(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(widget.description))),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Pick up time ",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF11364D5E),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.06),
                                    ),
                                  ]),
                              child: Center(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                          widget.integer.toString() + ':00'))),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Pick up date ",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF11364D5E),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.06),
                                    ),
                                  ]),
                              child: Center(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(widget.dropdownValue))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // color: Colors.white,
                  height: 40,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black38),
                      ]),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
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
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          'i accept the Shipping Policy ',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFF6B778D)),
                        ),
                      ),
                    )
                  ]),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, top: 15, bottom: 15),
                        child: Container(
                          width: 360,
                          height: 50,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    top: 15,
                                    bottom: 15),
                                primary: Colors.black,
                                textStyle: const TextStyle(fontSize: 20),
                                backgroundColor: Color(0xFF4B0082),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                "confirm",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              onPressed: () {
                                if (isCheck != true) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "you should accept the shipping policy",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.amber,
                                      textColor: Colors.white,
                                      fontSize: 15.0);
                                } else {
                                  // print(widget.newuser.id);
                                  BlocProvider.of<ShipmentDetailsBloc>(context)
                                      .add(eveent(
                                          widget.isSwitched,
                                          widget.weight,
                                          widget.DeliveryTime,
                                          widget.newman,
                                          widget.newuser,
                                          widget.collectAmount,
                                          widget.description,
                                          widget.index,
                                          widget.integer,
                                          widget.eeeee,
                                          widget.current,
                                          widget.dropdownValue,
                                          widget.value,
                                          widget.Dropof,
                                          widget.pickupfrom));
                                }
                              }),
                        ),
                      )
                    ])
              ]),
            ),
          );
        }));
  }
}
