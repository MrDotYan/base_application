import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/global_services.dart';

class SettingsController extends GetxController {
  final MyAppService services = MyAppService();

  final RxString themeString = '跟随系统'.obs;

  void initThemeString({ThemeMode? mode,}) {
    if (mode == null) {
      final String theme = services.storage.read('systemThemeMode') ?? 'light';
      switch (theme) {
        case 'light':
          themeString.value = '普通模式';
          break;
        case 'dark':
          themeString.value = '暗黑模式';
          break;
        case 'system':
          themeString.value = '跟随系统';
          break;
        default:
      }
    } else {
      switch(mode) {
        case ThemeMode.system:
          themeString.value = '跟随系统';
          break;
        case ThemeMode.light:
          themeString.value = '普通模式';
          break;
        case ThemeMode.dark:
          themeString.value = '暗黑模式';
          break;
      }
    }
  }

  @override
  void onInit() {
    initThemeString();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
