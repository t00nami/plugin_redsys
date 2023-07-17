import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_redsys/plugin_redsys.dart';
import 'package:plugin_redsys/plugin_redsys_platform_interface.dart';
import 'package:plugin_redsys/plugin_redsys_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginRedsysPlatform
    with MockPlatformInterfaceMixin
    implements PluginRedsysPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> webPayment(Map<String, dynamic> config) {
   return Future(() => "");
  }
}

void main() {
  final PluginRedsysPlatform initialPlatform = PluginRedsysPlatform.instance;

  test('$MethodChannelPluginRedsys is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginRedsys>());
  });

  test('getPlatformVersion', () async {
    PluginRedsys pluginRedsysPlugin = PluginRedsys();
    MockPluginRedsysPlatform fakePlatform = MockPluginRedsysPlatform();
    PluginRedsysPlatform.instance = fakePlatform;

    expect(await pluginRedsysPlugin.getPlatformVersion(), '42');
  });
}
