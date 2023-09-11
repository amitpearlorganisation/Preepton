import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/database/hive.dart';
import '../../../../app/database/models/signup_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginUIEvent, LoginInitial> {
  final HiveMethods hiveMethods = HiveMethods();

  LoginBloc() : super(LoginInitial()) {
    on<LoginUIEvent>((event, emit) async {
      print("email ${event.email}");
      emit(state.copyWith(Status.loading));

      await Future.delayed(Duration(seconds: 2));
      final userList = await hiveMethods.geUserList();

      if (userList.isEmpty) {
        print("Users list is empty.");
        emit(state.copyWith(Status.failed));
        return;
      }

      for (var user in userList) {
        print("for loop is running");
        if (event.email == user.email && event.password == user.password) {
          print("Match found:");
          print("hive user list email ${user.email}");
          print("hive user list password ${user.password}");
          print("program is success");
          emit(state.copyWith(Status.success));
          return; // Match found, exit the loop.
        }
      }

      print("No matching user found.");
      print("program is failed");
      emit(state.copyWith(Status.failed));

      print("program is finish");
    });
  }
}







//
// on<LoginUIEvent>((event, emit) async {
// print("email ${event.email}");
// emit(state.copyWith(Status.loading));
// await Future.delayed(Duration(seconds: 2));
//
// for(var user in users) {
// print("for loop is running");
// if (event.email == user.email && event.password == user.password) {
// print("hive user list email ${user.email}");
// print("hive user list password ${user.password}");
//
// print("program is success");
// emit(state.copyWith(Status.success));
// }
// else {
// print("hive is not working");
// print("program is failed");
// emit(state.copyWith(Status.failed));
// }
// }
//
//
//
//
// print("program is finish");
//
//
// });
