part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeSucess extends HomeState {
  final Homedatamodels homemodels;
  HomeSucess(this.homemodels);
}
class HomeError extends HomeState {
  final String errorMessage; // تضيف هذا السطر لتحمل رسالة الخطأ
  HomeError(this.errorMessage); // وتمرر رسالة الخطأ عند إصدار الحالة
}
class HomeLoading extends HomeState {

}