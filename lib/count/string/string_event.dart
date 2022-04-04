part of 'string_bloc.dart';

@immutable
abstract class Event {}
class NameCounterEvent extends Event{}

class CountEvent extends Event{}

class CountsubEvent extends Event{}