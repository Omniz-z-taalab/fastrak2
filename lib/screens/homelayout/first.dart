// import 'package:dio/dio.dart' as Dio;
// import 'package:dio/dio.dart';
// import 'package:fastrak2/Chash/cashHelper.dart';
// import 'package:fastrak2/Dio/Diohelper.dart';
// import 'package:fastrak2/Models/Api/OrderList.dart';
// import 'package:fastrak2/network/endpoint.dart';
// import 'package:fastrak2/screens/homelayout/secound.dart';
// import 'package:flutter/material.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
//
// class Homeorder extends StatefulWidget {
//   const Homeorder({Key key}) : super(key: key);
//
//   @override
//   _HomeorderState createState() => _HomeorderState();
// }
//
// class _HomeorderState extends State<Homeorder>
//     with SingleTickerProviderStateMixin {
//   String FirstName = 'user';
//   TabController _tabController;
//   int _currentIndex = 0;
//   int pageSize = 15;
//   ScrollController scrollController = ScrollController();
//   bool isLoading = false, allLoaded = false;
//   Data orders;
//   var page = 1;
//   var lastPage;
//   List<Order> items = [];
//   String firstName = CacheHelper.getData(key: 'firstName');
//
//   Future<List<Order>> fetchData() async {
//     if (allLoaded) {
//       return null;
//     }
//     setState(() {
//       isLoading = true;
//     });
//     print("kkkk");
//     try {
//       print(page);
//       Dio.Response response = await DioHelper.postData(GETORDER, queryParameters: {
//         'page': page,
//       });
//       print('flgkgggg');
//       Data list = Data.fromJson(response.data['data']);
//       print("order id ${list.data.first.id}");
//
//       final datad = list.data;
//       if (datad.isNotEmpty) {
//         items.addAll(datad);
//       }
//
//       orders = list;
//       // a3654716-5240-4f5f-b573-456372f77319
//       print('dddd');
//       return items;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         print(e.message);
//         print('1');
//         print(e.response.data);
//       }
//     }
//   }
//
//   void pagination() {
//     if ((scrollController.position.pixels ==
//             scrollController.position.maxScrollExtent) &&
//         (orders.data.length < orders.pagination.total)) {
//       setState(() {
//         isLoading = true;
//         page += 1;
//         fetchData();
//       });
//     }
//   }
//
//   String Sizeitem = '0.5 Kg';
//   var item = [
//     '0.5 Kg',
//     '1 Kg',
//     '1.5 Kg',
//     '2 Kg',
//     '2.5 Kg',
//     '3 Kg',
//   ];
//
//   @override
//   void initState() {
//     if (firstName != null) {
//       FirstName = firstName;
//     }
//     print('omnia:${FirstName}');
//     scrollController.addListener(pagination);
//     super.initState();
//
//     _tabController =
//         new TabController(length: 2, initialIndex: _currentIndex, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             new Container(
//               padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
//               child: Text(
//                 'Hello $firstName !',
//                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15.0, top: 10),
//                   child: SizedBox(
//                     width: 70.0,
//                     height: 5.0,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Color(0xFF4B0082),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10, top: 10),
//                   child: SizedBox(
//                     width: 23.0,
//                     height: 5.0,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Color(0xFFD5C7E5),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//         new Padding(
//           padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
//           child: new Container(
//             decoration: new BoxDecoration(
//                 border: new Border.all(
//                   color: Color(0xFFF9FAFF),
//                 ),
//                 borderRadius: BorderRadius.circular(10)),
//             child: Container(
//               width: 380,
//               height: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0xFF6B778D80).withOpacity(0.1),
//                     spreadRadius: 1,
//                     blurRadius: 7,
//                     offset: Offset(0, 1),
//                   ),
//                 ],
//                 color: Colors.white,
//               ),
//               child: new Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.max,
//                 children: <Widget>[
//                   // Sign In Button
//                   Container(
//                     width: 184,
//                     height: 40,
//                     child: new FlatButton(
//                       shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                               color: Color(0xFFF9FAFF),
//                               width: 1,
//                               style: BorderStyle.none),
//                           borderRadius: BorderRadius.circular(7),),
//                       color:
//                           _currentIndex == 0 ? Color(0xFF4B0082) : Colors.white,
//                       onPressed: () {
//                         _tabController.animateTo(0);
//                         setState(() {
//                           _currentIndex = 0;
//                         });
//                       },
//                       child: new Text(
//                         "New Shipment",
//                         style: TextStyle(fontSize: 12,
//                           color: _currentIndex == 1
//                               ? Color(0xFF4B0082)
//                               : Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   // Sign Up Button
//                   Container(
//                     padding: EdgeInsets.only(left: 1, right: 1),
//                     width: 184,
//                     height: 40,
//                     child: new FlatButton(
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                               color: Color(0xFFF9FAFF),
//                               width: 1,
//                               style: BorderStyle.solid),
//                           borderRadius: BorderRadius.circular(7),
//
//                         ),
//                         color: _currentIndex == 1
//                             ? Color(0xFF4B0082)
//                             : Colors.white,
//                         onPressed: () {
//                           _tabController.animateTo(1);
//                           setState(() {
//                             _currentIndex = 1;
//                           });
//                         },
//                         child: new Text(
//                           "shipments History",
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: _currentIndex == 1
//                                 ? Colors.white
//                                 : Color(0xFF4B0082),
//                             // Color(0xFF6B778D)),
//                           ),
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         new Expanded(
//           child: new TabBarView(
//               controller: _tabController,
//               // Restrict scroll by user
//               physics: const NeverScrollableScrollPhysics(),
//               children: [
//                 // Sign In View
//                 Column(children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(left: 15.0, right: 215),
//                     child: Text(
//                       'Shipment Average Weight',
//                       style: TextStyle(
//                           color: Color(0xFF6B778D),
//                           fontSize: 14,fontWeight: FontWeight.w500
//                       ),                    ),
//                   ),
//                   new Padding(
//                       padding: EdgeInsets.only(
//                           left: 15, right: 15, top: 50, bottom: 50),
//                       child: Image.asset(
//                         'images/weight.png',
//                         width: 200,
//                         height: 200,
//                       )),
//                   Padding(
//                     padding: EdgeInsets.only(right: 15, left: 15),
//                     child: Container(
//                       width: 380,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Color(0xFF6B778D80)),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10.0,right: 10),
//                         child: DropdownButton(
//                           isExpanded: true,
//                             style: TextStyle(fontSize: 12,color: Colors.black),
//                           value: Sizeitem,
//                           // Array list of items
//                           items: item.map((String items) {
//                             return DropdownMenuItem(
//                               value: items,
//                               child: Text(items),
//                             );
//                           }).toList(),
//                           onChanged: (String newValue) {
//                             setState(() {
//                               Sizeitem = newValue;
//                             });
//                           },
//                           underline: SizedBox(),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       width: 380,
//                       height: 50,
//                       child: TextButton(
//                         style: TextButton.styleFrom(
//                           padding: EdgeInsets.only(left: 15.0, right: 15.0),
//                           primary: Colors.black,
//                           textStyle: const TextStyle(fontSize: 20),
//                           backgroundColor: Color(0xFF4B0082),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                         child: Text("Continue",
//                             style:
//                                 TextStyle(fontSize: 13.0, color: Colors.white)),
//                         onPressed: () {
//                           fetchData();
//                         },
//                       ),
//                     ),
//                   )
//                 ]),
//
//                 new Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       padding: EdgeInsets.only(
//                         left: 10,
//                         right: 10,
//                       ),
//                       decoration: BoxDecoration(boxShadow: [
//                         BoxShadow(
//                           color: Color(0xFFF9FAFF).withOpacity(0.2),
//                           spreadRadius: 2,
//                           blurRadius: 6,
//                           offset: Offset(0, 2),
//                         ),
//                       ]),
//                       child: FutureBuilder<List<Order>>(
//                         future: fetchData(),
//                         builder: (context, snapshot) {
//                           if (snapshot.hasData) {
//                             return Stack(children: [
//                               ListView.builder(
//                                 controller: scrollController,
//                                 itemCount: snapshot.data.length,
//                                 itemBuilder: (_, index) => Container(
//                                   child: Container(
//                                     margin: EdgeInsets.symmetric(
//                                         horizontal: 10, vertical: 10),
//                                     padding: EdgeInsets.all(7.0),
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius:
//                                             BorderRadius.circular(15.0),
//                                         border:
//                                             Border.all(color: Colors.white12),
//                                         boxShadow: [
//                                           BoxShadow(
//                                               color: Colors.purple.shade100
//                                                   .withOpacity(.02),
//                                               spreadRadius: 5),
//                                         ]),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Container(
//                                               child: Image.asset(
//                                                 'images/Car.png',
//                                                 width: 65,
//                                                 height: 120,
//                                               ),
//                                               padding: EdgeInsets.only(
//                                                 right: 10,
//                                                 top: 5
//                                               ),
//                                             ),
//                                             Column(
//                                               children: [
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           right: 2.0),
//                                                   child: Container(
//                                                     width: 260,
//                                                     height: 35,
//                                                     decoration: BoxDecoration(
//                                                         color: Colors
//                                                             .grey.shade50,
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(7.0),
//                                                         border: Border.all(
//                                                             color:
//                                                                 Colors.white12),
//                                                         boxShadow: [
//                                                           BoxShadow(
//                                                               color: Colors
//                                                                   .purple
//                                                                   .shade100
//                                                                   .withOpacity(
//                                                                       .02),
//                                                               spreadRadius: 5),
//                                                         ]),
//                                                     padding: EdgeInsets.only(
//                                                         top: 7,
//                                                         bottom: 5,
//                                                         left: 10,
//                                                     ),
//                                                     child: Text(
//                                                       "${'Shipment ID:' + snapshot.data[index].orderId}",
//                                                       style: TextStyle(
//                                                         fontSize: 14.0,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           right: 2.0),
//                                                   child: Container(
//                                                     width: 260,
//                                                     height: 35,
//                                                     padding: EdgeInsets.only(
//                                                         top: 9,
//                                                         bottom: 5,
//                                                         left: 50,
//                                                     right: 50),
//                                                     decoration: BoxDecoration(
//                                                       color:
//                                                           Colors.grey.shade50,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               7.0),
//                                                       border: Border.all(
//                                                           color:
//                                                               Colors.white12),
//                                                     ),
//                                                     child: Text(
//                                                       "At the hub",
//                                                       style: TextStyle(
//                                                         fontSize: 14.0,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(height: 10),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ]);
//                           } else {
//                             return Center(
//                                 child: Text('No Orders',
//                                     style: TextStyle(
//                                         color: Color(0xFF4B0082),
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20)));
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//                 )
//               ]),
//         )
//       ],
//     );
//   }
// }
