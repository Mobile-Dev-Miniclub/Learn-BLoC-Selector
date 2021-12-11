import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter_bloc_selector/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is ChangeNameEvent) {
      //user baru yg da di event dan umurnya itu sama dgn state sebelumnya
      yield UserLoaded(User(name: event.name, age: state.user.age));
    } else if (event is BirthdayEvent) {
      //usernya sama dgn sebelumnya, umurnya yg diubah
      yield UserLoaded(User(name: state.user.name, age: state.user.age + 1));
    }
  }
}
