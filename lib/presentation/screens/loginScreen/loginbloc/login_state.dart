part of 'login_bloc.dart';
enum Status { initial, loading, success, failed}
abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {

  Status status;
  LoginInitial({this.status= Status.initial});

  LoginInitial copyWith({Status? status}){
    return LoginInitial(status: status?? this.status);
  }
  @override
  List<Object> get props => [status];
}
