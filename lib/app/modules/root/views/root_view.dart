import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/root_controller.dart';
import '../widget/root_drawer.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RootView'),
        centerTitle: true,
      ),
      drawer: const Drawer(
        child: RootDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
