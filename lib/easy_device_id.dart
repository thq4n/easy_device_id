library easy_device_id;

import 'dart:async';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';

export 'package:platform_device_id/platform_device_id.dart';

import 'src/utils/keychain_utils.dart';

Future<String?> getDeviceId([bool enableKeyChainStorage = true]) async {
  final pInfo = await PackageInfo.fromPlatform();
  final packageName = pInfo.packageName;

  final storageDeviceId = await KeyChainUtil.getStorageDeviceId(
    packageName: packageName,
    enableKeyChainStorage: enableKeyChainStorage,
  );

  if (storageDeviceId != null) {
    return storageDeviceId;
  }

  String? deviceId = await PlatformDeviceId.getDeviceId;

  if (deviceId != null) {
    unawaited(
      KeyChainUtil.storageDeviceId(
        packageName: packageName,
        enableKeyChainStorage: enableKeyChainStorage,
        deviceId: deviceId,
      ),
    );
  }

  return deviceId;
}
