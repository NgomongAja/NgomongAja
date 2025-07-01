import 'package:get/get.dart';
import 'package:pengen_chat/common/utils/local_data_util.dart';

class AppPresenter extends GetxController {
 
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadLoginStatus();
  }

  Future<void> _loadLoginStatus() async {
    bool? storedStatus = await LocalDataUtil.readBool('isLogin');
    isLoggedIn.value = storedStatus ?? false;
  }

  Future<void> setLoginStatus(bool status) async {
    await LocalDataUtil.saveBool('isLogin', status);
    isLoggedIn.value = status;
  }

  Future<void> logout() async {
    await setLoginStatus(false);
  }
}
