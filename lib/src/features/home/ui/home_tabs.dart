part of 'home_tab_imports.dart';

class HomeTabsScreen extends StatefulWidget {
  const HomeTabsScreen({super.key});

  @override
  State<HomeTabsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeTabsScreen> {
  @override
  void initState() {
    super.initState();

    // _navigateToLoginScreen();
  }

  _navigateToLoginScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      navigateRemoveAll(context, const LogInScreen());
    });
  }

  int currentIndex = 0;

  List<Widget> screensList = [
    const HomeScreen(),
    //const CourseScreen(),
    //const QuestionsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // elevation: 250,
        iconSize: 26.w,
        currentIndex: 0,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: option1Color,
        // unselectedItemColor: option3Color,
        items: [
          BottomNavigationBarItem(
              // icon: SvgPicture.asset("assets/icons/home_tab.png", width: 18.w, height: 20.h,),
              icon: Icon(
                Icons.home_filled,
                color: currentIndex == 0 ? option1Color : option4Color,
              ),
              label: "a"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.text_snippet_rounded,
                color: currentIndex == 1 ? option1Color : option4Color,
              ),
              label: "b"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.details,
                color: currentIndex == 2 ? option1Color : option4Color,
              ),
              label: "c"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
                color: currentIndex == 3 ? option1Color : option4Color,
              ),
              label: "d"),
        ],
      ),
    );
  }
}
