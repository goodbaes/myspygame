part of 'gametype_cubit.dart';

abstract class GametypeState extends Equatable {
  @override
  List<Object> get props => [];
}

class GametypeInitial extends GametypeState {
  GametypeInitial();
}

class GametypeCustom extends GametypeState {
  GametypeCustom();
}
