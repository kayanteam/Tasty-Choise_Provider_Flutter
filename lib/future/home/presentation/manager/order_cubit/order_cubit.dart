import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  int indexTap = 0;
  changeIndex(int status) {
    indexTap = status;
    emit(OrderInitial());
  }
}
