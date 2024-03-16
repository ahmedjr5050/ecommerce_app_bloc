import 'package:app2/core/webservices/repo.dart';
import 'package:app2/features/auth/signup/manage/models/signupmodels.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  Future<void> signup(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    emit(SignupLoading());
    try {
      final response =
          await HomeRepo().signup('register', name, email, password, phone);
      final signmodels = SignupModels.fromJson(response);
      emit(SignupSuccess(signmodels));
    } catch (e) {
      emit(
          SignupError('Failed to sign in: $e', error: 'Failed to sign in: $e'));
    }
  }
}
