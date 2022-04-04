import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'string_event.dart';
part 'string_state.dart';

class StringBloc extends Bloc<Event, Statee> {
  String name ;
  var count;
  StringBloc({this.name= 'odd',this.count = 0}) : super(StringInitial(name,count));
  @override
  Stream<Statee> mapEventToState(Event event) async* {
  if (event is NameCounterEvent) {
    this.name = 'Taalab';
    print(this.name);
  yield UpdatedNameState(this.name);
  }
  if(event is CountEvent){
    this.count = this.count + 1;
    print(this.count);
    yield UpdatedCountState(this.count);
  }else if (event is CountsubEvent){
    this.count = this.count - 1 ;
    yield UpdatedCountState(this.count);
  }

  }}
