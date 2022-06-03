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

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  UserAddress statee;
  String name;
  String buildNumber;
  String fullAddress;
  String floorNumber;
  String Apartmen;
  String landMark;
  String phonee;
  Citys city;
  String updateAdd;
  List<UserAddress> Add = [];
  Area areas;
  AdressUser user = new AdressUser();
  bool loading = false;

  // Dropss() async {
  //   AdressUser result = await
  //   print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
  //   updateAdd = result.address;
  //   print(name);
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
            updateAdd = Add.first.address;
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
                padding: const EdgeInsets.only(left: 20.0, top: 10, right: 80),
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
                          const EdgeInsets.only(left: 25, top: 20, right: 15),
                      child: Text(
                        'Manage Addresses',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 10),
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
                // InkWell(
                Container(
                  height: 550,
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: Add.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.only(
                                  right: 20, left: 20, top: 10, bottom: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(color: Colors.white),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade700
                                            .withOpacity(.02),
                                        spreadRadius: 5),
                                  ]),
                              child: Material(
                                child: InkWell(
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: ListTile(
                                      leading: Icon(Icons.edit),
                                      title: Text(
                                        Add[index].address,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return EditScreen(
                                            name,
                                            buildNumber,
                                            fullAddress,
                                            floorNumber,
                                            Apartmen,
                                            landMark,
                                            phonee,
                                            city,
                                            areas,
                                            user);
                                      },
                                    )).then((value) =>
                                        BlocProvider.of<GetAddressBloc>(context)
                                            .add(startScreenEvent()));
                                  },
                                ),
                              ));
                        }),
                  ),
                ),
                // SizedBox(
                //   width: 260,
                // ),
                // Icon(Icons.edit),
                // ],
                // ),

                // onTap: () {
                //   Dropss();
                // }),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, top: 10, bottom: 15),
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
              ]),
            ),
          );
        }));
  }
}
