import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginUIEvent, LoginInitial> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUIEvent>((event, emit) {
          print("email ${event.email}");
      emit(state.copyWith(status: Status.loading));

      if(event.email == "amit@gmail.com" && event.password =="123"){
        print("program is success");
        emit(state.copyWith(status: Status.success));
      }
      else{
        print("program is failed");
        emit(state.copyWith(status: Status.failed));
      }

      print("program is finish");


    });
  }
}
