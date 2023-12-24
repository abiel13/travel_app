import 'package:equatable/equatable.dart';
import 'package:travel_app/models/data_model.dart';

abstract class CubitState extends Equatable {}

class InitialCubitState extends CubitState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitState {
  LoadedState(this.places);

  final List<DataModel> places;
  @override
  //TODO: implement props
  List<Object> get props => [places];
}


class DetailState extends CubitState {
  DetailState(this.place);

  final DataModel place;
  @override
  //TODO: implement props
  List<Object> get props => [place];
}
