import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:base_applications/app/routes/app_pages.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/root_controller.dart';
import '../widget/root_drawer.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  ButtonStyle fBthStyle(context) {
    return ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.cyan),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
        backgroundColor: MaterialStateProperty.all(Colors.cyan));
  }

  TextStyle fBtnBadgeFTStyle() {
    return const TextStyle(color: Colors.white, fontSize: 12.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Material(
            color: Colors.transparent,
            child: CupertinoSearchTextField(
              onSubmitted: (value) =>
                  Get.toNamed(Routes.SEARCH, arguments: value),
            )),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.NOTIFICATIONS),
              icon: const badges.Badge(
                showBadge: false,
                child: Icon(Icons.notifications),
              )),
        ],
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        animatedIconData: AnimatedIcons.menu_close,
        fabButtons: [
          SizedBox(
            width: 52,
            height: 52,
            child: IconButton(
                style: fBthStyle(context),
                onPressed: () => Get.toNamed(Routes.CATEGORY),
                icon: const Icon(
                  Icons.category,
                  color: Colors.white,
                )),
          ),
          badges.Badge(
            badgeContent: Text(
              '3',
              style: fBtnBadgeFTStyle(),
            ),
            child: SizedBox(
              width: 52,
              height: 52,
              child: IconButton(
                  style: fBthStyle(context),
                  onPressed: () => Get.toNamed(Routes.CART),
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  )),
            ),
          ),
          badges.Badge(
            badgeContent: Text(
              '53',
              style: fBtnBadgeFTStyle(),
            ),
            child: SizedBox(
              width: 52,
              height: 52,
              child: IconButton(
                  style: fBthStyle(context),
                  onPressed: () => Get.toNamed(Routes.PERSONAL),
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        child: RootDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
              child: Card(
                child: SizedBox(
                  height: 60,
                ),
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 12,
                itemBuilder: (context, int index) {
                  return Card(
                    child: SizedBox(
                      height: 60,
                      child: Container(
                        color: index == 11 ? Colors.red : null,
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
