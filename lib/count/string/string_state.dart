part of 'string_bloc.dart';

@immutable
abstract class Statee {
  var name;
  var count;
  Statee(this.name,{this.count});

  @override
  List<Object> get props => [];

}

class StringInitial extends Statee {
  StringInitial(String name,int count ) : super(name,count:count) ;
  String toString() => "InitialCounterState with count:${name.toString()}${count.toString()}";
}


class UpdatedNameState extends Statee {
  UpdatedNameState(String name, count) : super(name,count: count);

  @override
  String toString() =>
      "UpdatedCounterState with count:${name.toString()}"; // For testing
}


class UpdatedCountState extends Statee {
  UpdatedCountState(int count,String name) : super(name,count:count);

  @override
  String toString() =>
      "UpdatedCounterState with count:${count.toString()}"; // For testing
}
