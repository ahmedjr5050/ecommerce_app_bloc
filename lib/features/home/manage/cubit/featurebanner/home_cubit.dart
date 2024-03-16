import 'package:app2/core/webservices/repo.dart';
import 'package:app2/features/home/manage/models/homemodels/datamodels.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void getHomeData() async {
    emit(HomeLoading());
    try {
      final response = await HomeRepo().getHomeData(
        'home',
      );
      final data = Homedatamodels.fromJson(response);
      emit(HomeSucess(data));
    } catch (e) {
      emit(HomeError(e.toString())); // تمرير الخطأ كنص
    }
  }

}