// ignore_for_file: deprecated_member_use, unused_import

import 'package:big_cart/core/constants/hive_keys.dart';
import 'package:big_cart/core/resources/routes/app_router.dart';
import 'package:big_cart/core/resources/style/theme/app_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(HiveKeys.mainBox);

  //runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        theme: AppTheme.themeLight(),
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        //  builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
