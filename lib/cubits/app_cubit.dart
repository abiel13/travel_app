import 'package:bloc/bloc.dart';
import 'package:travel_app/cubits/app_cubit_states.dart';
import 'package:travel_app/models/data_model.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubit extends Cubit<CubitState> {
  AppCubit({required this.data}) : super(InitialCubitState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());

      places = await data.getInfo();
      print(places);
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  details(DataModel data) {
    emit(DetailState(data));
  }
  goHome(){
    emit(LoadedState(places));
  }
}
