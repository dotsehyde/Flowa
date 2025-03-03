import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class AppController extends GetxController {
  static final to = Get.find<AppController>();
  var currentIndex = 0.obs;
  final List<String> _routes = ['/home', '/wallet', '/profile'];
  String changeBottomNav(int index) {
    currentIndex.value = index;
    return _routes[index];
  }

  bool isAuthenticated = false;
  bool hasOnboarded = getBoolAsync("hasOnboarded", defaultValue: false);
}
