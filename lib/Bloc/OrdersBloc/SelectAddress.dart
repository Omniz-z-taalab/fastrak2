import 'package:fastrak2/Bloc/GetAddressBloc/GetAddressBloc.dart';
import 'package:fastrak2/Bloc/GetAddressBloc/GetAddressEvent.dart';
import 'package:fastrak2/Bloc/GetAddressBloc/GetAddressState.dart';
import 'package:fastrak2/Models/Api/GetaddApi.dart';
import 'package:fastrak2/Models/Api/SetAddress.dart';
import 'package:fastrak2/loading/loading.dart';
import 'package:fastrak2/network/ImagesScreen.dart';
import 'package:fastrak2/screens/homelayout/addAddress/EditScreen.dart';
import 'package:fastrak2/screens/homelayout/addAddress/addUserAddress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectAddressPickupFrom extends StatefulWidget {

  @override
  _SelectAddressPickupFromState createState() => _SelectAddressPickupFromState();
}

class _SelectAddressPickupFromState extends State<SelectAddressPickupFrom> {
  UserAddress statee;
  String name;
  String buildNumber;
  String fullAddress;
  String floorNumber;
  String Apartmen;
  String landMark;
  String phonee;
  Citys city;
  List<UserAddress> Add = [];
  Area areas;
  AdressUser user = new AdressUser();

  // Dropss() async {
  //   UserAddress result = await Navigator.push(context, MaterialPageRoute(
  //     builder: (BuildContext context) {
  //       return EditScreen(name, buildNumber, fullAddress, floorNumber, Apartmen,
  //           landMark, phonee, city, areas, user);
  //     },
  //   ));
  //   print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
  //   name = result.name;
  //   print(result.city.id);
  //
  //   print("===================================================");
  //   setState(() {});
  // }
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('hellooooooz');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetAddressBloc(),
        child: BlocConsumer<GetAddressBloc, GetAddressState>(
            listener: (context, state) {
              if (state is LoadingLogin) {
                _loadingOverlay.show(context);
              } else {
                _loadingOverlay.hide();
              }
          if (state is SuccessAddressState) {
            print(state.value.first.name + 'yaaaaarab');
            Add = state.value;
            name = state.value.first.name;
            buildNumber = state.value.first.buildingNumber;
            fullAddress = state.value.first.address;
            floorNumber = state.value.first.floorNumber;
            Apartmen = state.value.first.apartmentNumber;
            landMark = state.value.first.landlineNumber;
            phonee = state.value.first.phone;
            city = state.value.first.city;
            areas = state.value.first.area;
            print(Add);
            print(city.toString() + '' + 'yaaaaaa Allahhhhhh');
          }
        }, builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 10, right: 80),
                  child: Image.asset(
                    FastrakLogo,
                    width: 250,
                    height: 80,
                  ),
                ),
                backgroundColor: Color(0xFFF9FAFF),
              ),
              body: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      new Container(
                        padding:
                            const EdgeInsets.only(left: 15, top: 30, right: 15),
                        child: Text(
                          'Manage Addresses',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 10),
                            child: SizedBox(
                              width: 80.0,
                              height: 5.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFF4B0082),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: SizedBox(
                              width: 23.0,
                              height: 5.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFFD5C7E5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // InkWell(
                  Container(
                    height: 625,
                    child: Expanded(
                      child: ListView.builder(
                          itemCount: Add.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0,bottom: 5,top:15),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(Add[index].name,style: TextStyle(color: Colors.grey.shade500),)),
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10.0),
                                          // border: Border.all(color: Colors.grey),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade700
                                                    .withOpacity(.03),
                                                spreadRadius: 7),
                                          ]),
                                      child: Material(
                                          child: Padding(
                                            padding: EdgeInsets.all(1),
                                            child: ListTile(
                                              trailing: Icon(Icons.check_circle_outline,color:
                                                Colors.grey.shade400,),
                                              title: Text(
                                                Add[index].address,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),

                                          onTap: () {
                                            Navigator.pop(context,Add[index]);
                                          },
                                        ),)),

                            ),
                                ],
                              ));
                          }),
                    ),
                  ),


                ]),
              ));
        }));
  }
}
