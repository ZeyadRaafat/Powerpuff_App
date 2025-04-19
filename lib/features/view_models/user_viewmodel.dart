import 'package:get/get.dart';
import '../models/log_model.dart';
import '../../core/services/local_storage_service.dart';

class UserViewModel extends GetxController {
  final Rx<User?> currentUser = Rx<User?>(null);
  final RxString username = RxString("");

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final savedUsername = await LocalStorageService.getString('username');
    if (savedUsername != null && savedUsername.isNotEmpty) {
      username.value = savedUsername;
    }
  }

  void setCurrentUser(User user) {
    currentUser.value = user;
    username.value = user.name;
  }

  String get getUserName => username.value;

  void clearUserData() {
    currentUser.value = null;
    username.value = "";
    LocalStorageService.removeKey('username');
  }
}
