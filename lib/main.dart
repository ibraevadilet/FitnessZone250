import 'package:active_ally_fitness_zone_250/firebase_options.dart'; // <-- Need this import
import 'package:active_ally_fitness_zone_250/screens/notifications/data/notification_hive_model.dart';
import 'package:active_ally_fitness_zone_250/screens/notifications/get_notification_cubit/get_notification_cubit.dart';
import 'package:active_ally_fitness_zone_250/screens/notifications/widgets/services/notification_handler.dart';
import 'package:active_ally_fitness_zone_250/screens/notifications/widgets/services/notification_service.dart';
import 'package:active_ally_fitness_zone_250/screens/splash_screen.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/model/caloriy_model.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/model/steps_model.dart';
import 'package:active_ally_fitness_zone_250/utils/app_urls.dart';
import 'package:apphud/apphud.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Apphud.start(apiKey: AppUrlsFitnessZone.aphKey);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService().init(); //
  await NotificationService().requestIOSPermissions(); //
  await NotificationServiceFb().activate();
  await Hive.initFlutter();
  Hive.registerAdapter(NotificationHiveModelAdapter());
  Hive.registerAdapter(CaloryModelAdapter());
  Hive.registerAdapter(StepsModelAdapter());
  runApp(BlocProvider(
    create: (context) => GetNotificationCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fitness Zone',
        home: child,
        theme: ThemeData.light().copyWith(
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
      ),
      child: const SplashScreen(),
    );
  }
}
