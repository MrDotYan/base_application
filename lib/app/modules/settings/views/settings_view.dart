import 'package:base_applications/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('深色模式'),
            onTap: () => Get.toNamed(Routes.THEME),
            trailing: SizedBox(
              width: 200,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() => Text(
                        controller.themeString.value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
