import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/database/models/signup_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginUIEvent, LoginInitial> {
  List<SignUpModel> users = [];
  LoginBloc() : super(LoginInitial()) {
    on<LoginUIEvent>((event, emit) async {
          print("email ${event.email}");
      emit(state.copyWith(Status.loading));
      await Future.delayed(Duration(seconds: 2));


  for(var user in users){
    if(event.email == user.email && event.password == user.password){
      print("program is success");
      emit(state.copyWith( Status.success));
    }
    else{
      print("program is failed");
      emit(state.copyWith(Status.failed));
    }
  }



      print("program is finish");


    });
  }
}
