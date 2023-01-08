import 'package:adi_quiz/app/config/app_config.dart';
import 'package:adi_quiz/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/ui/pages/my_app_page.dart';
import 'presentation/ui/widgets/base_loading_view.dart';

void main() async {
  await _initMyApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyAppPage());
  });
}

Future _initMyApp() async {
  //ensureInitialized for initialize device orientation
  WidgetsFlutterBinding.ensureInitialized();

  //flavor
  AppConfig(
    flavor: Flavor.development,
  );

  //firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //easy loading
  BaseLoadingView.init();
}
