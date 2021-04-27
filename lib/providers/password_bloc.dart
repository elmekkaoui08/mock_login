import 'package:bloc/bloc.dart';

enum PasswordEvents { SHOW, HIDE }

class PasswordBloc extends Bloc<PasswordEvents, bool> {
  PasswordBloc(bool initialState) : super(initialState);

  @override
  Stream<bool> mapEventToState(PasswordEvents event) async* {
    switch (event) {
      case PasswordEvents.SHOW:
        yield true;
        break;
      case PasswordEvents.HIDE:
        yield false;
    }
  }
}
