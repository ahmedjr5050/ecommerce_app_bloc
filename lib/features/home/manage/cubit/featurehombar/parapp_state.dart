part of 'parapp_cubit.dart';

@immutable
abstract class ParappState {}

 class ParappInitial extends ParappState {}

class ParappSucess extends ParappState {
  final CategoryModels categories;
  ParappSucess(this.categories);
}
class ParappError extends ParappState {
  final String errorMessage; // تضيف هذا السطر لتحمل رسالة الخطأ
  ParappError(this.errorMessage); // وتمرر رسالة الخطأ عند إصدار الحالة
}
class ParappLoading extends ParappState {
}
