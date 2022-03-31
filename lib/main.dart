import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:fastrak2/count/bloooc.dart';
import 'package:fastrak2/count/counter%20screen.dart';
import 'package:fastrak2/count/event.dart';
import 'package:fastrak2/Bloc/observer/blocObserver.dart';
import 'package:fastrak2/count/states.dart';
import 'package:fastrak2/Chash/cashHelper.dart';
import 'package:fastrak2/Dio/Diohelper.dart';
import 'package:fastrak2/screens/Home.dart';
import 'package:fastrak2/screens/Registar.dart';
import 'package:fastrak2/screens/log%20in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
          child: HomePageBlocProvider(title: 'Flutter Demo Home Page'),
        )
      //: HomePageVarBloc(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePageBlocProvider extends StatelessWidget {
  HomePageBlocProvider({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'IncrementButton',
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(IncrementCounterEvent());
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'DecrementButton',
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(DecrementCounterEvent());
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
//
// class HomePageVarBloc extends StatefulWidget {
//   HomePageVarBloc({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _HomePageVarBlocState createState() => _HomePageVarBlocState();
// }
//
// class _HomePageVarBlocState extends State<HomePageVarBloc> {
//   CounterBloc _bloc;
//
//   @override
//   void initState() {
//     super.initState();
//     _bloc = CounterBloc();
//   }
//
//   @override
//   void dispose() {
//     _bloc.close();
//     super.dispose();
//   }
//
//   void _incrementCounter() {
//     _bloc.add(IncrementCounterEvent());
//   }
//
//   void _decrementCounter() {
//     _bloc.add(DecrementCounterEvent());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             BlocBuilder<CounterBloc, CounterState>(
//               cubit: _bloc,
//               builder: (context, state) {
//                 return Text(
//                   state.count.toString(),
//                   style: Theme.of(context).textTheme.headline4,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             heroTag: 'IncrementButton',
//             onPressed: _incrementCounter,
//             tooltip: 'Increment',
//             child: Icon(Icons.add),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           FloatingActionButton(
//             heroTag: 'DecrementButton',
//             onPressed: _decrementCounter,
//             tooltip: 'Decrement',
//             child: Icon(Icons.remove),
//           ),
//         ],
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }






// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Bloc.observer = MyBlocObserver();
//   await DioHelper.init();
//   // await CacheHelper.init();
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CounterScreen(),
//     );
//   }
// }
//
// class Login extends StatefulWidget {
//   const Login({Key key}) : super(key: key);
//
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   String countryName = '20';
//
//   TextEditingController phone = TextEditingController();
//   final _key = GlobalKey<FormState>();
//
//   Future<CheckUser> checkuser() async {
//     print('ddddddddd');
//     try{
//       print('woowwwwwww');
//       Dio.Response response = await dio().post( "http://18.159.227.78:8080/api/v1/user/auth/regular/check-user", data: {
//         "phone": phone.text,
//       });
//     }  catch(error) {
//       if (error.response != null) {
//         print(error.response.data);
//         print(error.error);
//         print('aaaaaaaaaa');
//       } else {
//         // Something happened in setting up or sending the request that triggered an Error
//         print(error.message);
//
//       }}}
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF9FAFF),
//       appBar: new AppBar(
//         elevation: 0,
//         title: Center(
//           child: Image.asset(
//             'images/Logoword.png',
//             width: 250,
//             height: 80,
//           ),
//         ),
//         backgroundColor: Color(0xFFF9FAFF),
//       ),
//       body: SingleChildScrollView(
//         //
//           child: Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: Container(
//                 height: 700,
//                 width: 370,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color(0xFF6B778D80).withOpacity(0.2),
//                         spreadRadius: 2,
//                         blurRadius: 6,
//                         offset: Offset(0, 2),
//                       ),
//                     ]),
//                 child:
//                 Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//                   Image.asset(
//                     'images/group.png',
//                     height: 350,
//                     width: 250,
//                   ),
//                   Text("SIGN IN",
//                       style: TextStyle(
//                           fontSize: 20.0,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold)),
//                   SizedBox(
//                     width: 45.0,
//                     height: 3.0,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Form(
//                     key: _key,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 25.0),
//                           child: Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               'Phone Number',
//                               style: TextStyle(color: Color(0xFF6B778D)),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 15.0, left: 15),
//                           child: TextFormField(
//                             controller: phone,
//                             keyboardType: TextInputType.number,
//                             decoration: new InputDecoration(
//                               hintText: " phone Number",
//                               fillColor: Colors.white,
//                               border: new OutlineInputBorder(
//                                 borderRadius: new BorderRadius.circular(10.0),
//                                 borderSide:
//                                 new BorderSide(color: Color(0xFF6B778D4D)),
//                               ),
//                               prefixIcon: Container(
//                                 width: 60,
//                                 child: Row(
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         showCountryPicker(
//                                           context: context,
//                                           showPhoneCode: true,
//                                           onSelect: (Country country) {
//                                             print("FF: ${country.countryCode}");
//                                             setState(() {
//                                               countryName = country.phoneCode;
//                                             });
//                                           },
//                                         );
//                                       },
//                                       child: Container(
//                                         margin:
//                                         EdgeInsets.only(right: 10, left: 20),
//                                         height: 20,
//                                         child: Text(
//                                           '${countryName}',
//                                           style: TextStyle(
//                                               fontSize: 15, wordSpacing: 10),
//                                         ),
//                                       ),
//                                     ),
//                                     // Icon(
//                                     //   Icons.arrow_drop_down,
//                                     //   color: Colors.black12,
//                                     //   size: 20,
//                                     // ),
//                                     Container(
//                                       color: Colors.black38,
//                                       child: SizedBox(
//                                         width: 2.0,
//                                         height: 25.0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             inputFormatters: [
//                               FilteringTextInputFormatter.digitsOnly,
//                               LengthLimitingTextInputFormatter(10),
//                               FilteringTextInputFormatter.allow(
//                                   RegExp(r'^[1-9][0-9]*$'))
//                             ],
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "A Mobile number is required";
//                               }
//                               if (value.length < 9) {
//                                 return "Mobile number should be between 8 and 14 number";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                                 child: socialButton(
//                                     "images/facebook.png", "Facebook")),
//                             Expanded(
//                                 child: socialButton("images/google.png", "Google")),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 15.0, left: 15),
//                           child: InkWell(
//                               child: Container(
//                                 width: 350,
//                                 height: 55,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Color(0xFF4B0082),
//                                 ),
//                                 child: Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       'Next',
//                                       style: TextStyle(color: Colors.white),
//                                     )),
//                               ),
//                               onTap: () {
//                                 if (_key.currentState.validate()) {
//                                   checkuser();
//                                 } else {}
//                               }),
//                         )
//                       ],
//                     ),
//                   )
//                 ])),
//           )),
//     );
//   }
//
//   Widget socialButton(String image, String title) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 13.0, left: 13),
//       child: Container(
//           height: 45,
//           width: 80,
//           decoration: BoxDecoration(
//             color: Colors.white70,
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.grey, width: 1),
//           ),
//           child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Image.asset(
//                   image,
//                   height: 20,
//                   width: 20,
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Text(
//                   title,
//                   style: TextStyle(
//                       fontSize: 15,
//                       fontStyle: FontStyle.normal,
//                       color: Colors.black87),
//                 ),
//               ])),
//     );
//   }
// }
//
