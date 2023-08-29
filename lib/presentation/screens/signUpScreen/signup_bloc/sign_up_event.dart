part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}
class SingupTextInputEvent extends SignUpEvent{
  String name;
  String email;
  String phone;
  String password;
  String confirmPassword;
  String Gender;
  bool notifaction;
  bool privacypolicy;
  SingupTextInputEvent({required String this.name, required String this.email,required String this.phone,required String this.password,required String this.confirmPassword, required this.Gender, required this.notifaction, required this.privacypolicy});
  @override
  // TODO: implement props
  List<Object?> get props => [name, email, phone, password, confirmPassword];

}
class GenderEvent extends SignUpEvent{
  String Gender;

  GenderEvent({required String this.Gender});
  @override
  // TODO: implement props
  List<Object?> get props => [Gender];

}
class SendNotification extends SignUpEvent{
  bool notification;
  SendNotification({required bool this.notification});
  @override
  // TODO: implement props
  List<Object?> get props => [notification];

}
class CheckBox extends SignUpEvent{
  bool privacyPolicy;

  CheckBox({required this.privacyPolicy});

  @override
  // TODO: implement props
  List<Object?> get props => [privacyPolicy];
}
