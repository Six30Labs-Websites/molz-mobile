part of 'home_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get the current brightness
    final brightness = MediaQuery.of(context).platformBrightness;

    // Perform any action based on the theme change if needed
    if (brightness == Brightness.dark) {
      // Do something when in dark mode
      print('Dark mode is active');
    } else {
      // Do something when in light mode
      print('Light mode is active');
    }

    // Call setState to refresh UI if necessary
    setState(() {
      // Refresh UI components if necessary
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
    fetchOfferList();
    fetchTestList();
    fetchCourseList();
  }

  TestListModel? getTestListData;
  UserListModel? getUserListData;
  CourseListModel? getCourseListData;
  OfferListModel? getOfferListData;

  Status _fetchUserDataStatus = Status.loading;
  Status _fetchOfferListDataStatus = Status.loading;
  Status _fetchTestListDataStatus = Status.loading;
  Status _fetchCourseListDataStatus = Status.loading;

  fetchUser() async {
    ApiCall.get(
      Urls.getUser,
      success: (success) async {
        debug(success);
        try {
          setState(() {
            getUserListData = UserListModel.fromJson(jsonDecode(success));
            _fetchUserDataStatus = Status.successful;
          });
          debug("getUserListData ${getUserListData!.data!.username}");
          // await AccountManager.setUserData(LogInWithEmailModelData);
          // await AccountManager.setToken(
          //     LogInWithEmailModelData.data!.accessToken!);
        } catch (e) {
          error(e.toString());
          showToastError("Something went wrong !!");
          setState(() {
            _fetchUserDataStatus = Status.error;
          });
        }
      },
      failure: (fail) {
        debug("fetchUser fail ----->>>>>>>>>$fail");
        try {
          UserListModel getUserListData =
              UserListModel.fromJson(jsonDecode(fail));

          showToastError(getUserListData.error);
          setState(() {
            _fetchUserDataStatus = Status.error;
          });
        } catch (e) {
          error(e.toString());
          showToastError("Something went Wrong !!");
          setState(() {
            _fetchUserDataStatus = Status.error;
          });
        }
      },
      error400: (e4) {
        debug("fetchUser e4");
        showToastError("User UnAuthorized !!");
        setState(() {
          _fetchUserDataStatus = Status.error;
        });
      },
    );
  }

  fetchOfferList() async {
    ApiCall.get(Urls.getOfferList, success: (success) async {
      debug(success);
      try {
        var getOfferListData = OfferListModel.fromJson(jsonDecode(success));
        setState(() {
          offerData = getOfferListData.data!;
          _fetchOfferListDataStatus = Status.successful;
        });

        // await AccountManager.setUserData(LogInWithEmailModelData);
        // await AccountManager.setToken(
        //     LogInWithEmailModelData.data!.accessToken!);
      } catch (e) {
        error(e.toString());
        showToastError("Something went wrong !!");
        setState(() {
          _fetchOfferListDataStatus = Status.error;
        });
      }
    });
  }

  fetchCourseList() async {
    ApiCall.get(Urls.getCourseList, success: (success) async {
      debug(success);
      try {
        var CourseListData = CourseListModel.fromJson(jsonDecode(success));
        setState(() {
          courseData = CourseListData.data!;
          _fetchCourseListDataStatus = Status.successful;
        });

        // await AccountManager.setUserData(LogInWithEmailModelData);
        // await AccountManager.setToken(
        //     LogInWithEmailModelData.data!.accessToken!);
      } catch (e) {
        error(e.toString());
        showToastError("Something went wrong !!");
        setState(() {
          _fetchCourseListDataStatus = Status.error;
        });
      }
    });
  }

  fetchTestList() async {
    ApiCall.get(Urls.getTestList, success: (success) async {
      debug(success);
      try {
        var getTestListData = TestListModel.fromJson(jsonDecode(success));
        setState(() {
          testData = getTestListData.data!;
          _fetchTestListDataStatus = Status.successful;
        });
        //courseData = getCourseListData.data!;
        // await AccountManager.setUserData(LogInWithEmailModelData);
        // await AccountManager.setToken(
        //     LogInWithEmailModelData.data!.accessToken!);
      } catch (e) {
        error(e.toString());
        showToastError("Something went wrong !!");
        setState(() {
          _fetchTestListDataStatus = Status.error;
        });
      }
    });
  }

  _launchURL(url) async {
    Uri myUri = Uri.parse(url);
    // const url = 'https://example.com'; // Replace this URL with your desired URL

    if (await canLaunchUrl(myUri)) {
      await launchUrl(myUri);
    } else {
      throw 'Could not launch $myUri';
    }
  }

  List<CourseData> courseData = [];
  List<OfferData>? offerData = [];
  List<TestData>? testData = [];

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 15.0.w),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _fetchUserDataStatus == Status.loading
                    ? const CustomLoader2(
                        color: itemColor,
                      )
                    : _fetchUserDataStatus == Status.error
                        ? Center(
                            child: Text('User Not Found'),
                          )
                        : _fetchUserDataStatus == Status.successful
                            ? Flexible(
                                child: isDarkMode
                                    ? Text(
                                        "Welcome ${getUserListData?.data?.fullName ?? ''}",
                                        style: textStyleInter.copyWith(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w800,
                                            color: whiteColor),
                                      )
                                    : Text(
                                        "Welcome ${getUserListData?.data?.fullName ?? ''}",
                                        style: textStyleInter.copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ))
                            : SizedBox(),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchTest()));
                      },
                      child: isDarkMode
                          ? Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                color: whiteColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/svg/carbon_search.svg",
                                  height: 21.h,
                                  width: 21.w,
                                  color: blackColor,
                                ),
                              ),
                            )
                          : Container(
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
                            ),
                    ),
                    10.h.horizontalSpace,
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogInScreen()));
                      },
                      child: isDarkMode
                          ? Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                color: whiteColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/svg/logout.svg",
                                  height: 21.h,
                                  width: 21.w,
                                  color: blackColor,
                                ),
                              ),
                            )
                          : Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                color: option1Color,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/svg/logout.svg",
                                  height: 21.h,
                                  width: 21.w,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              _fetchOfferListDataStatus == Status.loading
                  ? const CustomLoader2(
                      color: itemColor,
                    )
                  : _fetchUserDataStatus == Status.error
                      ? Center(
                          child: Text('Offer Not Found'),
                        )
                      : _fetchUserDataStatus == Status.successful
                          ? CarouselSlider.builder(
                              itemCount: offerData?.length,
                              options: CarouselOptions(
                                height: 200,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                viewportFraction: 0.8,
                              ),
                              itemBuilder: (context, index, realIndex) {
                                // print('item length is ${offerData?.length}');
                                // print('item index is ${index}');

                                return offerData!.isEmpty
                                    ? Container()
                                    : Container(
                                        height: 155.h,
                                        width: mediaQWidth(context),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 27.w, vertical: 10.h),
                                        decoration: BoxDecoration(
                                          color: option5Color,
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          // image: DecorationImage(
                                          //   image: NetworkImage(
                                          //       "https://molzbackend.six30labs.com/public/${offerData?[index].image?.url}"),
                                          //   fit: BoxFit.cover,
                                          // ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    offerData![index].title!,
                                                    style:
                                                        textStyleInter.copyWith(
                                                      color: blackColor,
                                                      fontSize: 22.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  15.h.verticalSpace,
                                                  Text(
                                                    offerData![index]
                                                        .description!,
                                                    style:
                                                        textStyleInter.copyWith(
                                                      color: blackColor,
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  10.h.verticalSpace,
                                                  Container(
                                                    width: 100.w,
                                                    height: 30.h,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: blackColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.r)),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _launchURL(
                                                            offerData![index]
                                                                .linkTarget!);
                                                      },
                                                      child: Text(
                                                        offerData![index]
                                                            .linkText!,
                                                        style: textStyleInter
                                                            .copyWith(
                                                          fontSize: 14.sp,
                                                          color: whiteColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Image.network(
                                              "https://molzbackend.six30labs.com/public/${offerData![index].image?.url}",
                                              height: 100.h,
                                              width: 100.w,
                                            )
                                          ],
                                        ),
                                      );
                              },
                            )
                          : SizedBox(),

              15.h.verticalSpace,
              //TestCard
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isDarkMode
                      ? Text(
                          'Tests',
                          style: textStyleInter.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: whiteColor),
                        )
                      : Text(
                          'Tests',
                          style: textStyleInter.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewAllTests()));
                    },
                    child: isDarkMode
                        ? Text(
                            "See all",
                            style: textStyleInter.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: whiteColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                            ),
                          )
                        : Text(
                            "See all",
                            style: textStyleInter.copyWith(
                              decoration: TextDecoration.underline,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ],
              ),
              15.h.verticalSpace,
              _fetchTestListDataStatus == Status.loading
                  ? const CustomLoader2(
                      color: itemColor,
                    )
                  : _fetchTestListDataStatus == Status.error
                      ? Center(
                          child: Text('Test List Not Found'),
                        )
                      : _fetchTestListDataStatus == Status.successful
                          ? SizedBox(
                              height: 178.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: testData?.length,
                                itemBuilder: (context, index) {
                                  final testListData = testData![index];
                                  return GestureDetector(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TestScreen(item: testListData),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: Container(
                                        width: 143.w,
                                        padding: EdgeInsets.only(top: 25.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: option5Color,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              "https://molzbackend.six30labs.com/public/${testData![index].image?.url}",
                                              height: 71.h,
                                              width: 102.w,
                                              //fit: BoxFit.cover,
                                            ),
                                            12.h.verticalSpace,
                                            Flexible(
                                              child: Text(
                                                testData![index].name!,
                                                textAlign: TextAlign.center,
                                                style: textStyleInter.copyWith(
                                                    color: blackColor,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                            8.h.verticalSpace,
                                            Flexible(
                                              child: Text(
                                                "Read more",
                                                style: textStyleInter.copyWith(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: blackColor,
                                                    fontSize: 8.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : SizedBox(),
              15.h.verticalSpace,
              //CoursesCard
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isDarkMode
                      ? Text(
                          'Courses',
                          style: textStyleInter.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: whiteColor),
                        )
                      : Text(
                          'Courses',
                          style: textStyleInter.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewAllCourses()));
                    },
                    child: isDarkMode
                        ? Text("See all",
                            style: textStyleInter.copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                                decorationColor: whiteColor))
                        : Text(
                            "See all",
                            style: textStyleInter.copyWith(
                              decoration: TextDecoration.underline,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ],
              ),
              25.h.verticalSpace,
              _fetchCourseListDataStatus == Status.loading
                  ? const CustomLoader2(
                      color: itemColor,
                    )
                  : _fetchCourseListDataStatus == Status.error
                      ? Center(
                          child: Text('Course List Not Found'),
                        )
                      : _fetchUserDataStatus == Status.successful
                          ? SizedBox(
                              height: 178.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: courseData?.length,
                                itemBuilder: (context, index) {
                                  final courseListData = courseData![index];
                                  return GestureDetector(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CourseScreen(
                                              item: courseListData),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: Container(
                                        //height: 178.h,
                                        width: 143.w,
                                        padding: EdgeInsets.only(top: 38.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: option5Color,
                                        ),
                                        child: Column(
                                          children: [
                                            Image.network(
                                              "https://molzbackend.six30labs.com/public/${courseData![index].image?.url}",
                                              height: 71.h,
                                              width: 102.w,
                                            ),
                                            12.h.verticalSpace,
                                            Expanded(
                                              child: AutoSizeText(
                                                  courseData[index].name!,
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      textStyleInter.copyWith(
                                                          color: blackColor,
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                            ),
                                            // 8.h.verticalSpace,
                                            Expanded(
                                              child: Text("Read more",
                                                  style:
                                                      textStyleInter.copyWith(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          color: blackColor,
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : SizedBox(),
              25.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
