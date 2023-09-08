import 'package:peerp_toon/app/models/usersModel.dart';

class SignUpModel{
int id;
String user_name;
String email;
String phone_number;
String password;
String gender;
bool accept_policy;

SignUpModel({required this.id, required this.user_name, required this.email, required this.phone_number, required this.gender, required this.accept_policy, required this.password});

Map<String, dynamic> toMap(SignUpModel signUpModel) {
  Map<String, dynamic> signupModelMap = Map();

  signupModelMap["token"] = signUpModel.id;
  signupModelMap['username'] = signUpModel.user_name;
  signupModelMap['email'] = signUpModel.email;
  signupModelMap['phoneNumber']= signUpModel.phone_number;
  signupModelMap['gender'] = signUpModel.gender;
  signupModelMap['privacypolicy'] = signUpModel.accept_policy;
  signupModelMap['password'] = signUpModel.password;
  return signupModelMap;

}

factory SignUpModel.fromMap(Map<String, dynamic> json) => SignUpModel(
  id: json['id'] ?? 0,
  user_name: json['username'] ?? '',
  email: json['email'] ?? '',
  phone_number: json['phoneNumber'] ?? "",
  gender: json['gender'] ?? "",
  accept_policy: json['privacypolicy'] ?? "",
  password: json['password'] ?? ""
);



}