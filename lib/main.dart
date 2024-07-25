import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_molz/src/custom_themes/theme.dart';
import 'package:project_molz/src/features/splash/ui/splash_imports.dart';

import 'src/local_storage/auth_tokens_prefs/shared_prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await AccountManager.initAccountData();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  final String appTitle = "Molz";

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusManager.instance.primaryFocus!.unfocus();
            },
            child: MaterialApp(
              title: appTitle,
              debugShowCheckedModeBanner: false,
              theme: lightThemeData(context),
              darkTheme: darkThemeData(context),
              home: const SplashScreen(),
            ),
          );
        });
  }
}
