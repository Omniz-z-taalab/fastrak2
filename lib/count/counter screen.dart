
import 'package:fastrak2/count/string/string_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

            BlocBuilder<StringBloc, Statee>(
              builder: (context, state) {
                print(state.count.toString()+ " " + state.name.toString());
                // if(state is UpdatedNameState){
                //
                // }else if(state is UpdatedCountState){
                //
                // }else if(state is UpdatedCountState){
                //
                // }
                return Column(
                  children: [
                    Text(
                      state.name.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(height: 15),
                    Text(
                      state.count.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
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
              BlocProvider.of<StringBloc>(context).add(NameCounterEvent());
            },
            tooltip: 'Increment',
            child: Icon(Icons.chair),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'IncrementButton',
            onPressed: () {
              BlocProvider.of<StringBloc>(context).add(CountEvent());
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
              BlocProvider.of<StringBloc>(context).add(CountsubEvent());
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods
    );}}