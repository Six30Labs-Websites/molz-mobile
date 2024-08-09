part of 'splash_imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadPreference();
  }

  Future<void> _loadPreference() async {
    await AccountManager.initAccountData();
    bool? isFirstTime = await AccountManager.isFirstTime();
    debug("First : $isFirstTime");
    if (isFirstTime == true) {
      _navigateToWelcomeScreen();
    } else {
      _navigateToLoginScreen();
    }
  }

  _navigateToWelcomeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      navigateRemoveAll(context, const WalkThroughScreen());
    });
  }

  _navigateToLoginScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      navigateRemoveAll(context, const LogInScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      debug("Dark Mode");
    } else {
      debug("Light Mode");
    }
    return Scaffold(
      body: SizedBox.expand(
        child: isDarkMode
            ? Image.asset(
                "assets/png/Splash_dark.png",
                fit: BoxFit.cover,
              )
            : Image.asset(
                "assets/png/Splash_white.png",
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
