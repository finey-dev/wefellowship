import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wefellowship/firebase_options.dart';
import 'package:wefellowship/theme.dart';
import 'package:wefellowship/src/configs/configs.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await Hive.initFlutter();
    await Hive.openBox('wefellowship');

    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    }

    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    runApp(
      const ProviderScope(
        child: WefellowshipApp(),
      ),
    );
  }, (error, stack) async {
    await FirebaseCrashlytics.instance.recordError(error, stack);
  });
}

class WefellowshipApp extends StatelessWidget {
  const WefellowshipApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: Container(),
    );
  }
}
