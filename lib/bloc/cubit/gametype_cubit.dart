import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gametype_state.dart';

class GametypeCubit extends Cubit<GametypeState> {
  GametypeCubit() : super(GametypeInitial());

  void changeGameType(bool v) {
    v ? emit(GametypeCustom()) : emit(GametypeInitial());
  }
}
