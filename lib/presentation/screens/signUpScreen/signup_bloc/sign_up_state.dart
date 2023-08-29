part of 'sign_up_bloc.dart';
enum Status {initial, loading, success, failed}

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  Status status;
  SignUpInitial({this.status = Status.initial});
  SignUpInitial copyWith(Status?status){
    return SignUpInitial(status: status ?? this.status);
  }
  @override
  List<Object> get props => [status];
}
