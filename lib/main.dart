// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:atomic_notes/authentication/auth_pages/login_page.dart';
import 'package:atomic_notes/authentication/auth_pages/reset_password_page.dart';
import 'package:atomic_notes/authentication/auth_services/cred.dart';
import 'package:atomic_notes/database/sync_status.dart';
import 'package:atomic_notes/page/endpage/about_us_page.dart';
import 'package:atomic_notes/page/endpage/bio_auth_page.dart';
import 'package:atomic_notes/page/endpage/cloud_sync_page.dart';
import 'package:atomic_notes/page/endpage/dev_page.dart';
import 'package:atomic_notes/page/endpage/t_and_c_page.dart';
import 'package:atomic_notes/page/home_page.dart';
import 'package:atomic_notes/page/loading_screen.dart';
import 'package:atomic_notes/page/endpage/lock_screen.dart';
import 'package:atomic_notes/page/main_page.dart';
import 'package:atomic_notes/page/endpage/notes_database_page.dart';
import 'package:atomic_notes/page/settings_page.dart';
import 'package:atomic_notes/page/splash_screen.dart';
import 'package:atomic_notes/utility/intropages/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  final CredService cred = CredService();
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Supabase.initialize(
      url: cred.PROJECT_URL,
      anonKey: cred.API_KEY,
    );
  } catch (error) {
    exit(0);
  }

  await Hive.initFlutter();
  // open the Hive Box
  await Hive.openBox('myBox');
  await Hive.openBox<bool>('authBox');
  await Hive.openBox<bool>('syncBox');
  await SyncStatusHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashpage',
      routes: {
        '/loginpage': (context) => const LoginPage(),
        '/homepage': (context) => const HomePage(),
        '/splashpage': (context) => const SplashPage(),
        '/mainpage': (context) => const MainPage(),
        '/settingspage': (context) => const SettingsPage(),
        '/resetpage': (context) => const ResetPassword(),
        '/loadingscreen': (context) => const LoadingScreen(),
        '/onboardingscreen': (context) => const OnBoardingScreen(),
        '/appinfo': (context) => const AppInfo(),
        '/lockscreen': (context) => const LockScreen(),
        '/devoption': (context) => const DevPage(),
        '/databasepage': (context) => const DatabasePage(),
        '/cloudsyncpage': (context) => const CloudSyncPage(),
        '/biompage': (context) => const BiomPage(),
        '/tcpage': (context) => const TCPage(),
      },
    );
  }
}
