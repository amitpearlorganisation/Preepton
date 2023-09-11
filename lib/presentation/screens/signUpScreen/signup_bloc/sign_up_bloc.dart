import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:peerp_toon/app/database/models/signup_model.dart';

import '../../../../app/database/hive.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpInitial> {
  final HiveMethods hiveMethods = HiveMethods();

  SignUpBloc() : super(SignUpInitial()) {
    on<SingupTextInputEvent>((event, emit) async {
      emit(state.copyWith(Status.loading));
      await Future.delayed(Duration(seconds: 2));
      print("program is starting");
      if (event.name == event.name &&
          event.email == event.email &&
          event.phone == event.phone&&
          event.password == event.confirmPassword &&
      event.Gender == "male"|| event.Gender=="female"  || event.Gender =="others"&&
      event.privacypolicy == true&&
      event.notifaction == true
                
      ) {

        hiveMethods.addUser(SignUpModel(id:1, user_name: event.name, email: event.email, phone_number: event.phone, gender: event.Gender, accept_policy: event.privacypolicy, password:event.password));
        final userList = await hiveMethods.geUserList();
        for (final user in userList) {
          print("User ID: ${user.id}");
          print("User Name: ${user.user_name}");
          print("User Email: ${user.email}");
          // Add more properties as needed...
        }

           emit(state.copyWith(Status.success));
      } else {
        print("failed program");
        emit(state.copyWith(Status.failed));
      }
      print("event is finish");
    });

    on<GenderEvent>((event, emit) {
      emit(state.copyWith(Status.loading));

      if (event.Gender == "Male") {
        emit(state.copyWith(Status.success));
      } else {
        emit(state.copyWith(Status.failed));
      }
    });

    on<CheckBox>((event, emit) {
      emit(state.copyWith(Status.loading));
      if (event.privacyPolicy == true) {
        emit(state.copyWith(Status.success));
      } else {
        emit(state.copyWith(Status.failed));
      }
    });

    on<SendNotification>((event, emit) {
      emit(state.copyWith(Status.loading));

      if (event.notification == true) {
        emit(state.copyWith(Status.success));
      } else {
        emit(state.copyWith(Status.failed));
      }

    });
  }
}
