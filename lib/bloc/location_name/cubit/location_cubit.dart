import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spygame/data/lists.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  addCustomLocation(String location) {
    emit(LocationCustom(location));
  }

  addRandomLocation(String location) {
    emit(LocationInitial());
  }
}
