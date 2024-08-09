part of 'course_imports.dart';

class CourseScreen extends StatefulWidget {
  final item;
  CourseScreen({required this.item});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void initState() {
    super.initState();
    debug('courseScreen');
    _getCourseDetailsApiCall();
  }

  CourseListModel? getCourseListData;
  CourseDetailData? courseDetails;
  //List<CourseData> courseData = [];
  Status _courseListDataStatus = Status.loading;

  _getCourseDetailsApiCall() {
    debug('Course ID is\n ${{
      "courseID": widget.item.id,
    }}');
    ApiCall.get(
      '${Urls.getCourseDetail}/${widget.item.id}',
      success: (success) {
        debug(success.toString());

        try {
          setState(() {
            courseDetails = CourseDetailData.fromJson(jsonDecode(success));
            _courseListDataStatus = Status.successful;
          });
          debug('courseDetails: ${courseDetails!.data!.name!}');
        } catch (e) {
          error(e.toString());
          showToastError("Something went wrong !!");
          setState(() {
            _courseListDataStatus = Status.error;
          });
        }
      },
      failure: (fail) {
        debug("_getCourseDetailsApiCall fail$fail");
        try {
          if (fail.toString() == 'token_not_valid') {
            navigateRemoveAll(context, LogInScreen());
          } else if (fail.toString() == 'No Internet') {
            showToastError('No Internet !!');
            setState(() {
              _courseListDataStatus = Status.networkError;
            });
          } else {
            CourseDetailData courseDetails =
                CourseDetailData.fromJson(jsonDecode(fail));

            setState(() {
              _courseListDataStatus = Status.error;
            });
          }
        } catch (e) {
          error(e.toString());
          showToastError("Something went Wrong !!");
          setState(() {
            _courseListDataStatus = Status.error;
          });
        }
      },
      error400: (e4) {
        debug("getEventsListApiCall e4");
        showToastError("error 400 !!");
        setState(() {
          _courseListDataStatus = Status.error;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 25.w),
                    InkWell(
                      onTap: () {
                        navigatePop(context);
                      },
                      child: SvgPicture.asset("assets/svg/back.svg",
                          width: 35.w, height: 20.h),
                    ),
                  ],
                ),
                Text("Details",
                    style: textStyleInter.copyWith(
                        color: option1Color,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SvgPicture.asset(
                    //   "assets/svg/system-uicons_heart.svg",
                    //   height: 28.h,
                    //   width: 28.w,
                    // ),
                    SizedBox(width: 25.w),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      body: _courseListDataStatus == Status.loading
          ? const CustomLoader2(
              color: itemColor,
            )
          : _courseListDataStatus == Status.error
              ? Center(
                  child: Text('Courses Not Found'),
                )
              : _courseListDataStatus == Status.successful
                  ? Container(
                      padding: EdgeInsets.only(
                          left: 25.0.w, right: 25.0.w, top: 20.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          15.h.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${courseDetails?.data?.name ?? ''}",
                                    style: textStyleInter.copyWith(
                                        fontSize: 23.sp,
                                        color: option1Color,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  8.h.verticalSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${courseDetails?.data?.rating}(${courseDetails?.data?.reviewCount} reviews)",
                                        style: textStyleInter.copyWith(
                                            fontSize: 12.sp,
                                            color: option1Color,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: 51.h,
                                width: 58.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: option1Color,
                                ),
                                child: Center(
                                  child: Text(
                                    "Fee\n${courseDetails?.data?.fee} \$",
                                    style: textStyleInter.copyWith(
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          40.h.verticalSpace,
                          Image.network(
                            "https://molzbackend.six30labs.com/public/${courseDetails?.data?.image?.url}",
                            height: 160.h,
                            width: 160.w,
                          ),
                          40.h.verticalSpace,
                          courseDetails?.data?.courseoutlineitems != null
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Course Outline',
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
                                    SizedBox(
                                      //height: mediaQHeight(context),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: courseDetails!
                                            .data!.courseoutlineitems!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.h),
                                            child: Container(
                                              height: 62.h,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                  vertical: 10.h),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                color: option1Color,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      // Image.network(
                                                      //   "https://molzbackend.six30labs.com/public/${courseDetails?.data?.image?.url}",
                                                      //   height: 41.h,
                                                      //   width: 43.w,
                                                      // ),
                                                      10.w.horizontalSpace,
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            courseDetails!
                                                                    .data!
                                                                    .courseoutlineitems![
                                                                        index]
                                                                    .title ??
                                                                '',
                                                            style: textStyleInter
                                                                .copyWith(
                                                                    color:
                                                                        whiteColor,
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                          Text(
                                                            courseDetails!
                                                                    .data!
                                                                    .courseoutlineitems![
                                                                        index]
                                                                    .description ??
                                                                '',
                                                            style: textStyleInter
                                                                .copyWith(
                                                                    color:
                                                                        whiteColor,
                                                                    fontSize:
                                                                        9.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  // Image.asset(
                                                  //   "assets/png/gridicons_play.png",
                                                  //   height: 36.h,
                                                  //   width: 36.w,
                                                  // )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    10.h.verticalSpace,
                                    Container(
                                      height: 62.h,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        color: option5Color,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/png/Group 33634.png",
                                                height: 41.h,
                                                width: 43.w,
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Unlock Course Now",
                                                style: textStyleInter.copyWith(
                                                    color: option1Color,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                          Image.asset(
                                            "assets/png/Group 33630.png",
                                            height: 21.h,
                                            width: 42.w,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  child: Center(
                                      child: Text('No Course Available')),
                                )
                        ],
                      ),
                    )
                  : SizedBox(),
    );
  }
}
