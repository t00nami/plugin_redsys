
import 'plugin_redsys_platform_interface.dart';

class PluginRedsys {
  Future<String?> getPlatformVersion() {
    return PluginRedsysPlatform.instance.getPlatformVersion();
  }

  Future<String?> webPayment(Map<String,dynamic> tpvvConfig) {
    return PluginRedsysPlatform.instance.webPayment(tpvvConfig);
  }
}
