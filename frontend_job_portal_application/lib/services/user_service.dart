import 'package:ar_job_portal/models/user_model.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  Future<UserService> init() async {
    return this;
  }

  final _user = <UserModel>[].obs;
  UserModel get userData => _user.first;
  void updateUser(UserModel newValue) {
    _user.value = [newValue];
  }

  void clearData() {
    _user.clear();
  }
}
