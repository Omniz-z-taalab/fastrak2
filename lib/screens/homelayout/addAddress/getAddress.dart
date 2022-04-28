import 'package:csc_picker/model/select_status_model.dart';
import 'package:fastrak2/Bloc/GetAddressBloc/GetAddressBloc.dart';
import 'package:fastrak2/Bloc/GetAddressBloc/GetAddressEvent.dart';
import 'package:fastrak2/Bloc/GetAddressBloc/GetAddressState.dart';
import 'package:fastrak2/Models/Api/CitiesApi.dart';
import 'package:fastrak2/Models/Api/GetaddApi.dart';
import 'package:fastrak2/screens/homelayout/addAddress/EditScreen.dart';
import 'package:fastrak2/screens/homelayout/addAddress/addUserAddress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool statee = false;
  String name;
  String buildNumber;
  String fullAddress;
  String floorNumber;
  String Apartmen;
  String landMark;
  String phonee;
  Citys city ;
  Area areas;
  UserAddress user = new UserAddress();
  Dropss() async {
    UserAddress result = await Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return EditScreen(name,buildNumber,fullAddress,floorNumber,Apartmen,landMark,phonee,city,areas,user);
      },
    ));
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    name = result.name;
    print(result.city.id);

    print("===================================================");
    setState(() {});
  }
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
          if (state is SuccessAddressState) {
            print(state.value.data.data.first.name + 'yaaaaarab');
            name = state.value.data.data.first.name;
            buildNumber = state.value.data.data.first.buildingNumber;
            fullAddress = state.value.data.data.first.address;
            floorNumber = state.value.data.data.first.floorNumber;
            Apartmen = state.value.data.data.first.apartmentNumber;
            landMark = state.value.data.data.first.landlineNumber;
            phonee = state.value.data.data.first.phone;
            city = state.value.data.data.first.city ;
            areas = state.value.data.data.first.area;
            print(city.toString() +'' +'yaaaaaa Allahhhhhh');
          }
        }, builder: (context, state) {
          return Column(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
                  child: Text(
                    'Manage Addresses',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
              height: 30,
            ),
            InkWell(
                child: Container(
                    width: 340,
                    height: 50,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${name}'),
                        ),
                        SizedBox(
                          width: 260,
                        ),
                        Icon(Icons.edit),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber),
                        borderRadius: BorderRadius.circular(15))),
                onTap: () {
              Dropss();
                }),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, top: 360, bottom: 15),
                    child: Container(
                      width: 380,
                      height: 50,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                            ),
                            primary: Colors.black,
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: Color(0xFF4B0082),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          addUserAddress())).then((value) =>
                                  BlocProvider.of<GetAddressBloc>(context)
                                      .add(startScreenEvent()));
                            },
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Add new Address',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                )),
                          )),
                    ),
                  ),
                ]),
          ]);
        }));
  }
}
