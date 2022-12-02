import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_brain/screens/splash_page.dart';
import 'package:kids_brain/screens/app_routes.dart';

import 'local_data/storage_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  StorageRepository.getInstance();

  runApp(
    EasyLocalization(
      startLocale: const Locale('uz', 'UZ'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('uz', 'UZ'),
      ],
      path: 'assets/translation',
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: RoutName.splash,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Kids Brain',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
