import 'package:bloc/bloc.dart';

class PasswordCubit extends Cubit<bool> {
  PasswordCubit(bool initialState) : super(initialState);

  void changeVisibilty(bool visibilty) {
    emit(visibilty);
  }
}
