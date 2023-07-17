import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_redsys_platform_interface.dart';

/// An implementation of [PluginRedsysPlatform] that uses method channels.
class MethodChannelPluginRedsys extends PluginRedsysPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_redsys');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> webPayment(Map<String,dynamic> config) async {
    final result = await methodChannel.invokeMethod<String>('webPayment',config);
    return result;
  }
}
