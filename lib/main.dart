import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/services/global_services.dart';
import 'color_schemes.g.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => MyAppService().init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  MyApp({super.key});
  final MyAppService services = MyAppService();

  void onDetached() {
    if (kDebugMode) {
      print('onDetached');
    }
  }

  void onPaused() {
    if (kDebugMode) {
      print('onPaused');
    }
  }

  void onShow() {
    if (kDebugMode) {
      print('onShow');
    }
    Get.snackbar('欢迎回来', '欢迎回来');
  }

  void onActive() {
    if (kDebugMode) {
      print('onActive');
    }
  }

  void onInit() {
    WidgetsBinding.instance.addObserver(this);

    if (kDebugMode) {
      print('onInit');
    }
  }

  void onDispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (kDebugMode) {
      print('onDispose');
    }
  }

  void onReady() {
    if (kDebugMode) {
      print('onReady');
    }
  }

  void onGlobalTap() {
    if (kDebugMode) {
      print('onGlobalTap');
    }
    if (keyboardVisible) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }

  Future<bool> onWillPop() async {
    if (kDebugMode) {
      print('onWillPop');
    }
    return true;
  }

  void onNavigator(Routing? routing) {
    if (kDebugMode) {
      print('onNavigator');
    }
    if (keyboardVisible) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
    if (routing != null) {
      if (routing.isBack == true) {
        // ignore: todo
        // TODO: handler back routers
      }
    }
  }

  ThemeMode initTheme() {
    final String theme = services.storage.read('systemThemeMode') ?? 'system';
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: GestureDetector(
          onTap: onGlobalTap,
          child: GetMaterialApp(
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            themeMode: initTheme(),
            debugShowCheckedModeBanner: kDebugMode,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            supportedLocales: const [Locale('zh', 'CH')],
            onInit: onInit,
            onDispose: onDispose,
            onReady: onReady,
            routingCallback: onNavigator,
            theme: ThemeData(
                useMaterial3: true,
                colorScheme: lightColorScheme,
                appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent))),
            darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: darkColorScheme,
                appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent))),
          ),
        ));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        onDetached();
        break;
      case AppLifecycleState.inactive:
        onActive();
        break;
      case AppLifecycleState.resumed:
        onShow();
        break;
      case AppLifecycleState.paused:
        onPaused();
        break;
      default:
        break;
    }

    super.didChangeAppLifecycleState(state);
  }

  bool get keyboardVisible =>
      EdgeInsets.fromWindowPadding(
        WidgetsBinding.instance.window.viewInsets,
        WidgetsBinding.instance.window.devicePixelRatio,
      ).bottom >
      100;
}
