part of 'walk_through_imports.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _loadPreference();
  }

  Future<void> _loadPreference() async {
    await AccountManager.initAccountData();
    await AccountManager.setFirstTime();
  }

  List<Widget> listItems = [
    const WalkThroughPage(
      image: "assets/svg/walk_img_4.svg",
      title: "Welcome to Molz!",
      description:
          "Welcome to Molz, your personal guide to discovering your strengths, interests, and future career paths. We're here to help you make informed choices for Grades 10-12 and beyond.",
    ),
    const WalkThroughPage(
      image: "assets/svg/walk_img_5.svg",
      title: "Why Choose Molz?",
      description:
          "Choosing the right subjects and career path can be challenging. Molz makes it easier by offering three insightful tests: \n \u2022 Skills Test: Discover your unique abilities. \n \u2022 Jung Personality Test: Understand your personality type. \n \u2022 RIASEC Test: Explore careers that match your interests.",
    ),
    const WalkThroughPage(
      image: "assets/svg/wal_svg_img.svg",
      title: "How It Works",
      description:
          "Our tests are divided into manageable chunks, so you can complete them at your own pace. Here's how to get started: \n \u2022 Sign Up: Create your Molz account. \n \u2022 Take the Tests: Complete the Skills Test, Jung Personality Test, and RIASEC Test.",
    ),
    const WalkThroughPage(
      image: "assets/svg/walk_img_1.svg",
      title: "Explore Your Results",
      description:
          "After completing the tests, you'll receive personalized insights and recommendations based on your answers. This will help you understand your strengths, personality, and the careers that suit you best.",
    ),
    const WalkThroughPage(
      image: "assets/svg/walk_img_3.svg",
      title: "Plan Your Future",
      description:
          "Use your results to make informed decisions about your subjects and career paths. Your journey to a successful future starts here with Molz!",
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: listItems,
            ),
            Positioned(
              top: 700.h,
              child: SizedBox(
                width: mediaQWidth(context),
                child: Center(
                  child: PrimaryButton(
                      text: "Login",
                      press: () {
                        //navigateCupertino(context, const HomeTabsScreen());
                        navigateRemoveAll(context, const LogInScreen());
                      },
                      btnWidth: mediaQCustomWidth(context, width: 0.35)),
                ),
              ),
            ),
            Positioned(
              top: 650.h,
              child: SizedBox(
                width: mediaQWidth(context),
                child: Center(
                  child: SmoothPageIndicator(
                      controller: _pageController,
                      count: listItems.length,
                      effect: WormEffect(
                        activeDotColor: option2Color,
                        dotColor: option4Color,
                        dotHeight: 10.h,
                        dotWidth: 10.w,
                      ),
                      onDotClicked: (index) {}),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
