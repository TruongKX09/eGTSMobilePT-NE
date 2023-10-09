import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zego_zimkit/services/services.dart';
import 'app.dart';
import 'firebase_options.dart';

void main() async {
  Intl.defaultLocale = 'vi_VN';
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// 1/5: define a navigator key
  final navigatorKey = GlobalKey<NavigatorState>();

  ZIMKit().init(
    appID: 2075265905,
    appSign: '3993712e4ba61997e5386ac86bd55c1c0f16bdce605551d661ac1e40ebde8271',
  );

  /// 2/5: set navigator key to ZegoUIKitPrebuiltCallInvitationServiceS
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  ZegoUIKit().initLog().then((value) {
    ///  Call the `useSystemCallingUI` method
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );
    initializeDateFormatting().then((_) => runApp(MyApp(
          navigatorKey: navigatorKey,
        )));
  });
}
