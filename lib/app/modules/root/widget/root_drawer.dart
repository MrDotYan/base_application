import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class RootDrawer extends StatelessWidget {
  const RootDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        SizedBox(
          height: 188,
          child: DrawerHeader(
              child: Container(
            color: Colors.transparent,
          )),
        ),
        Expanded(
            child: ListView(
          children: [
            ListTile(
              title: const Text('分类信息'),
              leading: const Icon(Icons.category),
              trailing: const Icon(Icons.chevron_right_sharp),
              onTap: () => Get.toNamed(Routes.CATEGORY),
            ),
            ListTile(
              title: const Text('购物袋/购物车'),
              leading: const Icon(Icons.shopping_cart),
              trailing: const Icon(Icons.chevron_right_sharp),
              onTap: () => Get.toNamed(Routes.CART),
            ),
            ListTile(
              title: const Text('个人中心'),
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.chevron_right_sharp),
              onTap: () => Get.toNamed(Routes.PERSONAL),
            ),
            ListTile(
              title: const Text('运用设置'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.chevron_right_sharp),
              onTap: () => Get.toNamed(Routes.SETTINGS),
            ),ListTile(
              title: const Text('关于运用'),
              leading: const Icon(Icons.error_outline),
              trailing: const Icon(Icons.chevron_right_sharp),
              onTap: () => Get.toNamed(Routes.ABOUT),
            ),
          ],
        ))
      ],
    ));
  }
}
