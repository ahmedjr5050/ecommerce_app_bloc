part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}
class SignupLoading extends SignupState {}
class SignupSuccess extends SignupState {
  final SignupModels data;
  SignupSuccess( this.data);
}
class SignupError extends SignupState {
  final String error;
  SignupError(String s, {required this.error});
}
