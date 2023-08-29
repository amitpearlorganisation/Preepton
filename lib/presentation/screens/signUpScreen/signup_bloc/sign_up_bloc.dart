import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpInitial> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SingupTextInputEvent>((event, emit) {
      emit(state.copyWith(Status.loading));
      print("program is starting");
      if (event.name == "Amit" &&
          event.email == "amit@gmail.com" &&
          event.phone == "123456789"&&
          event.password == event.confirmPassword &&
      event.Gender == "male"&&
      event.privacypolicy == true&&
      event.notifaction == true
                
      ) {
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
