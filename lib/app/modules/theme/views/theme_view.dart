import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class ThemeView extends GetView<ThemeController> {
  const ThemeView({Key? key}) : super(key: key);

  Widget render() {
    return Column(
      children: [
        const ListTile(
          title: Text(
            '手动选择',
            style: TextStyle(fontSize: 14),
          ),
        ),
        SwitchListTile(
            title: const Text('系统模式'),
            subtitle: const Text('跟随系统'),
            value: controller.systemThemeMode.value == ThemeMode.system,
            onChanged: (value) => controller.changeThemeMode(ThemeMode.system)),
        SwitchListTile(
            title: const Text('普通模式'),
            subtitle: const Text('浅色模式'),
            value: controller.systemThemeMode.value == ThemeMode.light,
            onChanged: (value) => controller.changeThemeMode(ThemeMode.light)),
        SwitchListTile(
            title: const Text('暗黑模式'),
            subtitle: const Text('深色模式'),
            value: controller.systemThemeMode.value == ThemeMode.dark,
            onChanged: (value) => controller.changeThemeMode(ThemeMode.dark))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('主题模式'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: controller.saveThemeMode, child: const Text('完成'))
        ],
      ),
      body: Column(
        children: [Obx(() => render())],
      ),
    );
  }
}

/***
 * Widget renderDialog() {
    return Center(
    child: SizedBox(
    width: 340,
    height: 150,
    child: Card(
    child: Column(
    children: [
    const SizedBox(
    height: 80,
    child: Center(
    child: Text(
    '确定修改？',
    style: TextStyle(fontSize: 14.0),
    ),
    ),
    ),
    Expanded(
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
    children: [
    Expanded(
    child: OutlinedButton(
    onPressed: () => Get.back(),
    child: const Text('取消'))),
    const SizedBox(
    width: 16.0,
    ),
    Expanded(
    child: OutlinedButton(
    onPressed: controller.restart,
    child: const Text('确定')))
    ],
    ),
    ),
    )
    ],
    ),
    ),
    ),
    );
    }
 */
