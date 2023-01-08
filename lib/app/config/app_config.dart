
import 'package:adi_quiz/app/config/constants/link_page_constants.dart';

enum Flavor {
  production,
  development,
}

extension FlavorItem on Flavor {
  String get appName {
    switch (this) {
      case Flavor.production:
        return "Adi Quiz";
      case Flavor.development:
        return "Adi Quiz DEV";
    }
  }

  String get appVersion {
    switch (this) {
      case Flavor.production:
        return "v1";
      case Flavor.development:
        return "v1";
    }
  }

  String get downloadUrl {
    switch (this) {
      case Flavor.production:
        return downloadUrlProd;
      case Flavor.development:
        return downloadUrlDev;
    }
  }
}

class AppConfig {
  final Flavor flavor;
  final String appName;
  final String appVersion;
  final String downloadUrl;

  static AppConfig? _instance;

  AppConfig._internal(
    this.flavor,
    this.appName,
    this.appVersion,
    this.downloadUrl,
  );

  factory AppConfig({
    required Flavor flavor,
  }) =>
      _instance ??= AppConfig._internal(
        flavor,
        flavor.appName,
        flavor.appVersion,
        flavor.downloadUrl,
      );

  static AppConfig? get instance => _instance;
}
