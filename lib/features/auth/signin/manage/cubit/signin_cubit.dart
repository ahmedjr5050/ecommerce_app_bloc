import 'package:app2/core/webservices/repo.dart';
import 'package:app2/features/auth/signin/models/signinmodels.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {

  SigninCubit() : super(SigninInitial());
  Future<void> signIn({required String email, required String password}) async {
    emit(SigninLoading());
    try {
      final response = await HomeRepo().signin('login', email, password);
      final signmodels = Signmodels.fromJson(response);
      emit(SigninSuccess(signmodels));
    } catch (e) {
      emit(SigninError('Failed to sign in: $e'));
    }
  }
}
