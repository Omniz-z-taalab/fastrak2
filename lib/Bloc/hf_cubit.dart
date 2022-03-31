import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hf_state.dart';

class HfCubit extends Cubit<HfState> {
  HfCubit() : super(HfInitial());
}
