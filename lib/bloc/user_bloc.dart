import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:Pegassus/models/models.dart';
import 'package:Pegassus/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
      UserEvent event,
      ) async* {
    // TODO: implement mapEventToState
    if (event is LoadUser) {
      User user = await UserServices.getUser(event.id);
      yield UserLoaded(user);
    } else if (event is UserInitial) {
      yield UserInitial();
    }
  }
}