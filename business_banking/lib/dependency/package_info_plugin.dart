import 'package:clean_framework/clean_framework.dart';
import 'package:package_info/package_info.dart';

class PackageInfoPlugin extends ExternalDependency {
  Future<dynamic> getAppInfo() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return AppInfo(
        packageInfo.appName,
        packageInfo.packageName,
        packageInfo.version,
        packageInfo.buildNumber,
      );
    } catch (e) {
      return 'Error Unable to fetch app info';
    }
  }
}

class AppInfo {
  final String appName;
  final String packageName;
  final String version;
  final String buildNumber;

  AppInfo(this.appName, this.packageName, this.version, this.buildNumber);
}
