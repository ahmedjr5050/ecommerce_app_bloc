import 'package:app2/core/webservices/repo.dart';
import 'package:app2/features/home/manage/models/category/categorieshome.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'parapp_state.dart';

class ParappCubit extends Cubit<ParappState> {
  ParappCubit() : super(ParappInitial());

  void getParappData() async {
    emit(ParappLoading());
    try {
      final response = await HomeRepo().getHomeData(
        'categories',
      );
      final data = CategoryModels.fromJson(response);
      emit(ParappSucess(data));
    } catch (e) {
      emit(ParappError(e.toString())); // تمرر الخطأ كنص
    }
  }
}
