import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ddd_state.dart';

class DddCubit extends Cubit<DddState> {
  DddCubit() : super(DddInitial());
}
