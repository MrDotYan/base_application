import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RootView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
                child: Text('To Home')),
            OutlinedButton(
                onPressed: () {
                  Get.toNamed(Routes.SETTINGS);
                },
                child: Text('To Setting'))
          ],
        ),
      ),
    );
  }
}
