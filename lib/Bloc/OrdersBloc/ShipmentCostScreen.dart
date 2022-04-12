import 'package:conditional_builder/conditional_builder.dart';
import 'package:fastrak2/Bloc/OrdersBloc/ShipmentDetailsBloc/LastScreenInOrder.dart';
import 'package:fastrak2/Bloc/OrdersBloc/ShipmentDetailsBloc/shipment_details_bloc.dart';
import 'package:fastrak2/Bloc/OrdersBloc/lastScreenInOrder.dart';
import 'package:fastrak2/Bloc/OrdersBloc/PromoCodeBloc/promo_code_bloc.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/network/ImagesScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShipmentCostScreen extends StatefulWidget {
  String num;
  String dropdownValue;
  String weight;
  Data newuser;
  Data newman;
  String collectAmount;
  String description;
  int integer;
  String DeliveryTime;

  ShipmentCostScreen(
      this.num,
      this.newuser,
      this.dropdownValue,
      this.weight,
      this.newman,
      this.collectAmount,
      this.description,
      this.integer,
      this.DeliveryTime);

  @override
  State<ShipmentCostScreen> createState() => _ShipmentCostScreenState();
}

class _ShipmentCostScreenState extends State<ShipmentCostScreen> {
  TextEditingController code = TextEditingController();
  bool isCheck = false;
  int val = -1;
  int Coasst;
  int current = 0;
  String Textt;
  String newText;

  // int index = 0;

  void initState() {
    // TODO: implement initState
    super.initState();

    print(widget.num);
    print('aaaaaaaaaaaa');
    print(widget.newman);
    print(widget.newman.address + widget.newman.phone);
    print('bbbbbbbbbbbb');

    print(widget.DeliveryTime);
    print('ccccccccccccc');

    print(widget.dropdownValue);
    print('dddddddddddddd');

    print(widget.weight);
    print('eeeeeeeeeeee');

    print(widget.newuser);
    print('fffffffffffffff');

    print(widget.collectAmount);
    print('gggggggggggggg');

    print(widget.description);
    print('hhhhhhhhhhhhhhhhs');

    print(widget.integer);

    print('mnasss');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ShipmentDetailsBloc(),
        child: BlocConsumer<ShipmentDetailsBloc, ShipmentDetailsState>(
            listener: (context, state) {
          if (state is CodeSuccess) {
            print(state.value.shippingFees);
            widget.integer = state.value.shippingFees;
            print('eslaaaaaaaaaam');
            Fluttertoast.showToast(
                msg: 'Success Code',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 20.0);
            Navigator.pop(context, state.value.shippingFees);
          }
          if (state is CodeErorr) {
            Fluttertoast.showToast(
                msg: state.onError.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 10.0);
          }
          if (state is ChangeButtonSuccess) {
            // print(state.current);
            current = state.State;
            // print('vvvvvvvvvvvvvvv');
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
            body: Column(
              children: [
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
                              return Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:
                                                      Colors.grey.shade300))),
                                      child: ListTile(
                                        title: Center(
                                            child: Text('Discount Code')),
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
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Discount Code',
                                                        hintStyle: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors
                                                                .grey.shade500),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300,
                                                                width: 1.0),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
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
                                                          print(code.text +
                                                              widget.weight +
                                                              widget
                                                                  .description +
                                                              widget
                                                                  .collectAmount);
                                                          BlocProvider.of<
                                                                      ShipmentDetailsBloc>(
                                                                  context)
                                                              .add(CheckCode(
                                                                  code.text,
                                                                  widget.weight,
                                                                  widget
                                                                      .description,
                                                                  widget
                                                                      .collectAmount));
                                                        }),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                        ))
                                  ]);
                            });
                      })
                ]),
                SizedBox(
                  height: 50,
                ),
                Row(children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          BlocProvider.of<ShipmentDetailsBloc>(context)
                              .add(ChangeButton(0));
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  // border: Border.all(
                                  // color: Color(0xFF4B0082), width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.purple.shade100
                                            .withOpacity(.03),
                                        spreadRadius: 3),
                                  ]),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: current == 1
                                          ? Colors.purple.shade50
                                          : Colors.purple.shade600,
                                      width: 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      "images/mon.png",
                                      height: 40,
                                      width: 40,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Cash on Delivery",
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black87),
                                    ),
                                  ],
                                ),
                                // ("images/money.png", "Cash on Pickup")),
                              ),
                            ))),
                  ),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            BlocProvider.of<ShipmentDetailsBloc>(context)
                                .add(ChangeButton(1));
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    // border: Border.all(
                                    //     color: Color(0xFF4B0082), width: 1),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.purple.shade100
                                              .withOpacity(.03),
                                          spreadRadius: 3),
                                    ]),
                                child: Container(
                                  // color: current == 0 ? Colors.red : Colors.blue,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                        color: current == 0
                                            ? Colors.purple.shade50
                                            : Colors.purple.shade600,
                                        width: 1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "images/money.png",
                                        height: 40,
                                        width: 40,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Cash on Pickup",
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                              )))),
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                        'Pay using visa/card machine',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF6B778D)),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      current == 1 ?
                      'A 2% Additional charge will be added to your payment':
                          '',
                      style: TextStyle(fontSize: 13, color: Color(0xFF6B778D)),
                    ),
                  ),
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
                                  left: 15.0, right: 15.0, top: 15, bottom: 15),
                              primary: Colors.black,
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: Color(0xFF4B0082),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      LastScreenInOrder(
                                        widget.weight,
                                        widget.DeliveryTime,
                                        widget.newman,
                                        widget.newuser,
                                        widget.collectAmount,
                                        widget.description,
                                      )));
                              }
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }));

  }

  Widget socialButton(String image, String title) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Color(0xFF4B0082), width: 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.purple.shade100.withOpacity(.03),
                  spreadRadius: 3),
            ]),
        child: Container(
          // color: current == 0 ? Colors.red : Colors.blue,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
                color: current == 1 ? Color(0xFF4B0082) : Colors.red, width: 1),
            // boxShadow: [
            //   BoxShadow(color:
            //       Colors.purple.shade100.withOpacity(.03),
            //       spreadRadius: 3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image,
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 8,
                    fontStyle: FontStyle.normal,
                    color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
//
//   Widget Button(String image, String title) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child:
//       Container(
//         height: 60,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(7),
//             border: Border.all(color: Color(0xFF4B0082), width: 1),
//             boxShadow: [
//               BoxShadow(
//
//                   color: Colors.purple.shade100.withOpacity(.03),
//                   spreadRadius: 3),
//             ]),
//
//         child: Container(
//           // color: current == 0 ? Colors.red : Colors.blue,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(7),
//             border: Border.all(
//                 color: index == 1 ?
//                 Color(0xFF4B0082)
//                     : Colors.red,
//                 width: 1),
//             // boxShadow: [
//             //   BoxShadow(color:
//             //       Colors.purple.shade100.withOpacity(.03),
//             //       spreadRadius: 3),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image.asset(
//                 image,
//                 height: 40,
//                 width: 40,
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 title,
//                 style: TextStyle(
//                     fontSize: 8,
//                     fontStyle: FontStyle.normal,
//                     color: Colors.black87),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
}
