import 'package:base_applications/app/modules/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/global_services.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> systemThemeMode = ThemeMode.system.obs;
  final MyAppService services = MyAppService();

  final SettingsController _settingsController = Get.put(SettingsController());

  void changeThemeMode(ThemeMode? mode) {
    systemThemeMode.value = mode!;
  }

  void saveThemeMode() {
    services.setThemeMode(systemThemeMode.value);
    _settingsController.initThemeString(
        mode: systemThemeMode.value);
    Get.back();
  }

  void initTheme() {
    final String theme = services.storage.read('systemThemeMode') ?? 'light';
    switch (theme) {
      case 'light':
        systemThemeMode.value = ThemeMode.light;
        break;
      case 'dark':
        systemThemeMode.value = ThemeMode.dark;
        break;
      case 'system':
        systemThemeMode.value = ThemeMode.system;
        break;
      default:
    }
  }

  @override
  void onInit() {
    initTheme();
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
