import 'package:device_preview/device_preview.dart';
import 'package:flowa/core/config/constants.dart';
import 'package:flowa/core/config/function.dart';
import 'package:flowa/core/config/router.dart';
import 'package:flowa/core/config/theme.dart';
import 'package:flowa/core/config/translation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(MyApp());
  // runApp(DevicePreview(
  //     enabled: kReleaseMode,
  //     tools: const [
  //       ...DevicePreview.defaultTools,
  //     ],
  //     builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, _, __) {
        return GetMaterialApp.router(
          onInit: () {
            registerControllers();
          },
          useInheritedMediaQuery: true,
          title: APP_NAME,
          debugShowCheckedModeBanner: false,
          // darkTheme: darkTheme,
          theme: lightTheme.copyWith(
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }),
          ),
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
          translations: AppTranslation(),
          routeInformationParser: routes.routeInformationParser,
          routerDelegate: routes.routerDelegate,
          routeInformationProvider: routes.routeInformationProvider,
        );
      },
    );
  }
}
