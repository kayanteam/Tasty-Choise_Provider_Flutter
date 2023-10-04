part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingData extends HomeState {}

class SuccessData extends HomeState {}

class FailureData extends HomeState {
  final String message;
  FailureData(this.message);
}

class HomeLoadingData extends HomeState {}

class HomeSuccessData extends HomeState {}

class HomeFailureData extends HomeState {
  final String message;
  HomeFailureData(this.message);
}

class AddProductLoadingData extends HomeState {}

class AddProductSuccessData extends HomeState {
  final String message;
  AddProductSuccessData(this.message);
}

class AddProductFailureData extends HomeState {
  final String message;
  AddProductFailureData(this.message);
}

class DeleteProductLoadingData extends HomeState {}

class DeleteProductSuccessData extends HomeState {
  final String message;
  DeleteProductSuccessData(this.message);
}

class DeleteProductFailureData extends HomeState {
  final String message;
  DeleteProductFailureData(this.message);
}
