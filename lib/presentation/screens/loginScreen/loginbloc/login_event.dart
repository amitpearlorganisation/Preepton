part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}
class LoginUIEvent extends LoginEvent{
  String email;
  String password;
  LoginUIEvent({required String this.email, required String this.password});
  @override
  List<Object?> get props =>[email, password];

}

