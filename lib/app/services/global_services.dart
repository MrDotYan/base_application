import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyAppService extends GetxService {
  final storage = GetStorage();

  Future<MyAppService> init() async {
    if (kDebugMode) {
      print('services init start');
    }
    if (kDebugMode) {
      print('services init end');
    }
    initTheme();
    return this;
  }

  void initTheme() {
    final String theme = storage.read('systemThemeMode') ?? 'light';
    switch (theme) {
      case 'light':
        Get.changeThemeMode(ThemeMode.light);
        break;
      case 'dark':
        Get.changeThemeMode(ThemeMode.dark);
        break;
      case 'system':
        Get.changeThemeMode(ThemeMode.system);
        break;
      default:
    }
  }

  void setThemeMode(ThemeMode modeValue) {
    switch (modeValue) {
      case ThemeMode.system:
        storage.write('systemThemeMode', 'system');
        break;
      case ThemeMode.light:
        storage.write('systemThemeMode', 'light');
        break;
      case ThemeMode.dark:
        storage.write('systemThemeMode', 'dark');
        break;
      default:
        storage.write('systemThemeMode', 'system');
    }
    Get.changeThemeMode(modeValue);
  }
}
