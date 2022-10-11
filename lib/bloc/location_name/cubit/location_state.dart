part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState(this.location);
  final String location;
  @override
  List<Object> get props => [location];
}

class LocationInitial extends LocationState {
  LocationInitial() : super(LocationsList().getRandomLocation());
}

class LocationCustom extends LocationState {
  LocationCustom(location) : super(location);
}
