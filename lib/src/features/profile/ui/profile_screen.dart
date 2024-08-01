part of 'profile_imports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: Container(
          margin: EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 60.0.h),
          alignment: Alignment.bottomCenter,
          // decoration: BoxDecoration(border: Border.all(color: option1Color)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Roy!",
                    style: textStyleInter.copyWith(
                      color: option1Color,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  7.verticalSpace,
                  Text(
                    "Find Your test",
                    style: textStyleInter.copyWith(
                      color: option1Color,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  color: option1Color,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/carbon_search.svg",
                    height: 21.h,
                    width: 21.w,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ClipRRect(
              child: Icon(Icons.person, size: 200,),
            ),
            30.h.verticalSpace,
            PrimaryButton(
                text: "Log out",
                press: () {
                  navigateRemoveAll(context, const LogInScreen());
                },
                btnWidth: 150.w,
                btnHeight: 48.h,
                color: option1Color),
          ],
        ),
      )),
    );
  }
}
