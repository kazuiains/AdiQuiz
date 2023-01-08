import 'package:adi_quiz/app/config/app_colors.dart';
import 'package:adi_quiz/app/config/app_config.dart';
import 'package:adi_quiz/app/config/routes/app_pages.dart';
import 'package:adi_quiz/app/config/routes/app_routes.dart';
import 'package:adi_quiz/presentation/get/bindings/home/home_binding.dart';
import 'package:adi_quiz/presentation/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class MyAppPage extends StatelessWidget {
  const MyAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.instance!.appName,
      initialRoute: AppRoutes.root,
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: AppColors.primary,
        primaryColor: AppColors.primary,
        primaryColorLight: AppColors.primaryLight,
        primaryColorDark: AppColors.primaryDark,
        scaffoldBackgroundColor: AppColors.bodyColor,
      ),
      home: HomePage(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}
