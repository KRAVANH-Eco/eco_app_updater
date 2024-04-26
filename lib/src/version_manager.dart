part of '../eco_app_updater.dart';

class VersionManager {
  VersionManager._();

  static VersionManager? _instance;

  static VersionManager getInstance() {
    _instance ??= VersionManager._();
    return _instance!;
  }

  PackageInfo? packageInfo;
  ShorebirdCodePush? shorebirdCodePush;

  Future<void> ensureInitailize() async {
    packageInfo = await PackageInfo.fromPlatform();
    shorebirdCodePush = ShorebirdCodePush();
  }

  String get versionString {
    if (packageInfo == null) {
      return '';
    }
    String version = packageInfo?.version ?? '';
    String buildNumber = packageInfo?.buildNumber ?? '';
    return 'Version : $version($buildNumber)';
  }

  String get versionNumber {
    if (packageInfo == null) {
      return '';
    }
    String version = packageInfo?.version ?? '';
    String buildNumber = packageInfo?.buildNumber ?? '';
    return '$version($buildNumber)';
  }

  Future<String> get patchNumber async {
    if (shorebirdCodePush == null) {
      return '';
    }
    int patch = await shorebirdCodePush?.currentPatchNumber() ?? 0;
    if (patch == 0) {
      return '';
    }
    return 'Patch : $patch';
  }
}
