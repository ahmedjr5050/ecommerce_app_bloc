part of 'signin_cubit.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}
class SigninLoading extends SigninState {
}
class SigninSuccess extends SigninState {
  final Signmodels message;
  SigninSuccess(this.message);
}
class SigninError extends SigninState {
  final String error;
  SigninError(this.error);
}
