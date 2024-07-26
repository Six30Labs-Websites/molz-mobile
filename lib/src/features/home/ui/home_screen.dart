part of 'home_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: Container(
          margin: EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 40.0.h),
          alignment: Alignment.bottomCenter,
          // decoration: BoxDecoration(border: Border.all(color: option1Color)),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Flexible(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          // Text(
          //   // "Welcome ${getUserListData?.data?.username ?? ''}",
          //   'Nalini Sundaram Sundaram',
          //   style: textStyleInter.copyWith(
          //     color: option1Color,
          //     fontSize: 20.sp,
          //     fontWeight: FontWeight.w800,
          //   ),
          // ),
          //           // 7.verticalSpace,
          //           // Text(
          //           //   "Find Your test",
          //           //   style: textStyleInter.copyWith(
          //           //     color: option1Color,
          //           //     fontSize: 20.sp,
          //           //     fontWeight: FontWeight.w400,
          //           //   ),
          //           // ),
          //         ],
          //       ),
          //     ),
          //     //40.w.horizontalSpace,
          // InkWell(
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => SearchTest()));
          //   },
          //   child: Container(
          //     height: 40.h,
          //     width: 40.w,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(7.r),
          //       color: option1Color,
          //     ),
          //     child: Center(
          //       child: SvgPicture.asset(
          //         "assets/svg/carbon_search.svg",
          //         height: 21.h,
          //         width: 21.w,
          //       ),
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {
          //     Navigator.pushReplacement(context,
          //         MaterialPageRoute(builder: (context) => LogInScreen()));
          //   },
          //   child: Container(
          //     height: 40.h,
          //     width: 40.w,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(7.r),
          //       color: option1Color,
          //     ),
          //     child: Center(
          //       child: SvgPicture.asset(
          //         "assets/svg/logout.svg",
          //         height: 21.h,
          //         width: 21.w,
          //         color: whiteColor,
          //       ),
          //     ),
          //   ),
          // ),
          //   ],
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                                  child: Text(
                                    "Welcome ${getUserListData?.data?.fullName ?? ''}",
                                    style: textStyleInter.copyWith(
                                      color: option1Color,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchTest()));
                        },
                        child: Container(
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
                        child: Container(
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
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 20.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //OfferCard
                  //CarouselSlider
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
                                                horizontal: 27.w,
                                                vertical: 10.h),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        offerData![index]
                                                            .title!,
                                                        style: textStyleInter
                                                            .copyWith(
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
                                                        style: textStyleInter
                                                            .copyWith(
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
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: blackColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.r)),
                                                        child: InkWell(
                                                          onTap: () {
                                                            _launchURL(offerData![
                                                                    index]
                                                                .linkTarget!);
                                                          },
                                                          child: Text(
                                                            offerData![index]
                                                                .linkText!,
                                                            style:
                                                                textStyleInter
                                                                    .copyWith(
                                                              fontSize: 14.sp,
                                                              color: whiteColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                  //OfferCard
                  // SizedBox(
                  //   height: 178.h,
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: offerData?.length,
                  //       itemBuilder: (context, index) {
                  //         return Container(
                  //             //height: 178.h,
                  //             //width: 340.w,
                  //             padding: EdgeInsets.symmetric(
                  //                 horizontal: 27.0.w, vertical: 20.0.h),
                  //             decoration: BoxDecoration(
                  //                 color: option5Color,
                  //                 borderRadius: BorderRadius.circular(15.r)),
                  //             child: Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               children: [
                  //                 Column(
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.center,
                  //                   children: [
                  //                     Text(
                  //                       offerData![index]!.title!,
                  //                       style: textStyleInter.copyWith(
                  //                         color: blackColor,
                  //                         fontSize: 22.sp,
                  //                         fontWeight: FontWeight.w600,
                  //                       ),
                  //                     ),
                  //                     15.h.verticalSpace,
                  //                     Text(
                  //                       offerData![index].description!,
                  //                       style: textStyleInter.copyWith(
                  //                         color: blackColor,
                  //                         fontSize: 11.sp,
                  //                         fontWeight: FontWeight.w400,
                  //                       ),
                  //                     ),
                  //                     10.h.verticalSpace,
                  //                     Container(
                  //                       width: 100.w,
                  //                       height: 30.h,
                  //                       alignment: Alignment.center,
                  //                       decoration: BoxDecoration(
                  //                           color: blackColor,
                  //                           borderRadius:
                  //                               BorderRadius.circular(20.r)),
                  //                       child: InkWell(
                  //                         onTap: () {
                  //                           debug('cta1 pressed');
                  //                         },
                  //                         child: Text(
                  //                           offerData![index].linkText!,
                  //                           style: textStyleInter.copyWith(
                  //                             fontSize: 14.sp,
                  //                             color: whiteColor,
                  //                             fontWeight: FontWeight.w600,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     )
                  //                   ],
                  //                 ),
                  //                 // Image.network(
                  //                 //     "https://molzbackend.six30labs.com/public/${offerData![index].image?.url}")
                  //               ],
                  //             ));
                  //       }),
                  // ),
                  15.h.verticalSpace,
                  //TestCard
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Tests',
                        style: textStyleInter.copyWith(
                          color: blackColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // Text(
                      //   "See all",
                      //   style: textStyleInter.copyWith(
                      //     decoration: TextDecoration.underline,
                      //     color: blackColor,
                      //     fontSize: 16.sp,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
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
                                              builder: (context) => TestScreen(
                                                  item: testListData),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20.0),
                                          child: Container(
                                            //height: 178.h,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.network(
                                                  "https://molzbackend.six30labs.com/public/${testData![index].image?.url}",
                                                  height: 71.h,
                                                  width: 102.w,
                                                ),
                                                12.h.verticalSpace,
                                                Expanded(
                                                  child: AutoSizeText(
                                                      testData![index].name!,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: textStyleInter
                                                          .copyWith(
                                                              color: blackColor,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)),
                                                ),
                                                8.h.verticalSpace,
                                                Expanded(
                                                  child: Text("Read more",
                                                      style: textStyleInter
                                                          .copyWith(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              color: blackColor,
                                                              fontSize: 8.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
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
                      Text(
                        'Courses',
                        style: textStyleInter.copyWith(
                          color: blackColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // Text(
                      //   "See all",
                      //   style: textStyleInter.copyWith(
                      //     decoration: TextDecoration.underline,
                      //     color: blackColor,
                      //     fontSize: 16.sp,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
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
                                              builder: (context) =>
                                                  CourseScreen(
                                                      item: courseListData),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20.0),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
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
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: textStyleInter
                                                          .copyWith(
                                                              color: blackColor,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)),
                                                ),
                                                // 8.h.verticalSpace,
                                                Expanded(
                                                  child: Text("Read more",
                                                      style: textStyleInter
                                                          .copyWith(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              color: blackColor,
                                                              fontSize: 8.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
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
        ),
      ),
    );
  }
}

// class TesttCard extends StatelessWidget {
//   //final List<String> items = List.generate(10, (index) => 'Item $index');
//   //TesttCard({super.key,});
//   final GetCourseListModel cd;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200.h,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 2,
//         itemBuilder: (context, index) {
//           return Container(
//             margin: EdgeInsets.all(8.0),
//             width: 150.0,
//             color: Colors.blue,
//             child: Center(
//               child: Text(
//                 cd.data[index].name!,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class TopCard extends StatelessWidget {
//   const TopCard({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 155.h,
//       width: mediaQWidth(context),
//       padding: EdgeInsets.symmetric(horizontal: 27.0.w, vertical: 20.0.h),
//       decoration: BoxDecoration(
//           color: option5Color, borderRadius: BorderRadius.circular(15.r)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "60% off",
//                 style: textStyleInter.copyWith(
//                   color: blackColor,
//                   fontSize: 22.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               15.h.verticalSpace,
//               Text(
//                 "Lorem Ipsum Eoal",
//                 style: textStyleInter.copyWith(
//                   color: blackColor,
//                   fontSize: 11.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               10.h.verticalSpace,
//               Container(
//                 width: 100.w,
//                 height: 30.h,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     color: blackColor,
//                     borderRadius: BorderRadius.circular(20.r)),
//                 child: Text(
//                   "CTA",
//                   style: textStyleInter.copyWith(
//                     fontSize: 14.sp,
//                     color: whiteColor,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               )
//             ],
//           ),
//           // Image.asset(
//           //   "assets/png/bag.png",
//           //   height: 84.h,
//           //   width: 126.w,
//           // )
//         ],
//       ),
//     );
//   }
// }

// class TestCard extends StatelessWidget {
//   const TestCard({super.key, required this.headerName, required this.asset});
//   final String headerName;
//   final String asset;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               headerName,
//               style: textStyleInter.copyWith(
//                 color: blackColor,
//                 fontSize: 20.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             Text(
//               "See all",
//               style: textStyleInter.copyWith(
//                 decoration: TextDecoration.underline,
//                 color: blackColor,
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//         25.h.verticalSpace,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: 178.h,
//               width: 143.w,
//               padding: EdgeInsets.only(top: 38.h),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.r),
//                 color: option5Color,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Image.asset(
//                   //   asset,
//                   //   height: 71.h,
//                   //   width: 102.w,
//                   // ),
//                   15.h.verticalSpace,
//                   Text("RIASEC",
//                       style: textStyleInter.copyWith(
//                           color: blackColor,
//                           fontSize: 13.sp,
//                           fontWeight: FontWeight.w700)),
//                   8.h.verticalSpace,
//                   Text("Read more",
//                       style: textStyleInter.copyWith(
//                           decoration: TextDecoration.underline,
//                           color: blackColor,
//                           fontSize: 8.sp,
//                           fontWeight: FontWeight.w400)),
//                 ],
//               ),
//             ),
//             Container(
//               height: 178.h,
//               width: 143.w,
//               padding: EdgeInsets.only(top: 38.h),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.r),
//                 color: option5Color,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Image.asset(
//                   //   asset,
//                   //   height: 71.h,
//                   //   width: 102.w,
//                   // ),
//                   15.h.verticalSpace,
//                   Text("RIASEC",
//                       style: textStyleInter.copyWith(
//                           color: blackColor,
//                           fontSize: 13.sp,
//                           fontWeight: FontWeight.w700)),
//                   8.h.verticalSpace,
//                   Text("Read more",
//                       style: textStyleInter.copyWith(
//                           decoration: TextDecoration.underline,
//                           color: blackColor,
//                           fontSize: 8.sp,
//                           fontWeight: FontWeight.w400)),
//                 ],
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
