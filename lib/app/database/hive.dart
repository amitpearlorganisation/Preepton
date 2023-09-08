import 'package:hive/hive.dart';
import 'package:peerp_toon/app/database/models/signup_model.dart';
import 'package:peerp_toon/app/models/usersModel.dart';

class HiveMethods {
  String hiveBox = 'hive_local_db';


  addUser(SignUpModel signUpModel) async {
    var box = await Hive.openBox(hiveBox);
    var mapSignupData = signUpModel.toMap(signUpModel);
    await box.add(mapSignupData);
    Hive.close();

  }

  // Reading all the users from signup

Future<List<SignUpModel>> geUserList() async {
    var box = await Hive.openBox(hiveBox);
    List<SignUpModel> users = [];

    for(int i = box.length - 1; i>=0; i--){

      var signupMap = box.getAt(i);
      users.add(SignUpModel.fromMap(Map.from(signupMap)));

    }
    return users;

}

// Deleting one data frin hive DB
// reagain check delete by name
deleteUser(int id) async {
  var box = await Hive.openBox(hiveBox);

  await box.deleteAt(id);

}
deleteAllUsers() async{
    var box = await Hive.openBox(hiveBox);

    await box.clear();
}



}