part of 'result_imports.dart';

class ResultScreen extends StatefulWidget {
  final TestDetailModel? item;
  ResultScreen({required this.item});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    debug('ResultScreen');

    _getResultApiCall();
  }

  ResultModel? result;
  ResultModel2? result2;

  Status _resultDataStatus = Status.loading;

  _getResultApiCall() {
    ApiCall.get('${Urls.getResult}/${widget.item?.data!.id!}',
        success: (success) {
      debug(success.toString());

      try {
        setState(() {
          result = ResultModel.fromJson(jsonDecode(success));
          result2 = ResultModel2.fromJson(jsonDecode(success));
          _resultDataStatus = Status.successful;
        });
        // debug('testDetails: ${result?.data!.name!}');
      } catch (e) {
        error(e.toString());
        showToastError("Something went wrong !!");
        _resultDataStatus = Status.error;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: SafeArea(
        child: Scaffold(
          body: widget.item?.data?.type == "RIASEC"
              ? _resultDataStatus == Status.loading
                  ? const CustomLoader2(
                      color: itemColor,
                    )
                  : _resultDataStatus == Status.error
                      ? Center(
                          child: Text('Result Not Found'),
                        )
                      : _resultDataStatus == Status.successful
                          ? SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'My Interest Code',
                                          style: textStyleInter.copyWith(
                                              fontSize: 20.sp,
                                              color: option1Color,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                    15.h.verticalSpace,
                                    Center(
                                      child: Container(
                                        height: 60.h,
                                        width: 150.w,
                                        decoration: BoxDecoration(
                                          color: option1Color,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: const Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'R',
                                                style: TextStyle(
                                                    color: whiteColor),
                                              ),
                                              Text(
                                                'I',
                                                style: TextStyle(
                                                    color: whiteColor),
                                              ),
                                              Text(
                                                'A',
                                                style: TextStyle(
                                                    color: whiteColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    20.h.verticalSpace,
                                    Center(
                                      child: Container(
                                        width: 320.w,
                                        child: Wrap(
                                          children: [
                                            Text(
                                              'NOTE:',
                                              style: textStyleInter.copyWith(
                                                  fontSize: 14.sp,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              'The letters with the highest scores are your Interest Code.',
                                              style: textStyleInter.copyWith(
                                                  fontSize: 14.sp,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    20.h.verticalSpace,
                                    buildRow(
                                      'R',
                                      'Realistic',
                                      '${result?.hcR}',
                                    ),
                                    buildRow(
                                      'I',
                                      'Investigative',
                                      '${result?.hcI}',
                                    ),
                                    buildRow(
                                      'A',
                                      'Artistic',
                                      '${result?.hcA}',
                                    ),
                                    buildRow(
                                      'S',
                                      'Social',
                                      '${result?.hcS}',
                                    ),
                                    buildRow(
                                      'E',
                                      'Enterprising',
                                      '${result?.hcE}',
                                    ),
                                    buildRow(
                                      'C',
                                      'Conventional',
                                      '${result?.hcC}',
                                    ),
                                    10.h.verticalSpace,
                                    Card(
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                            dividerColor: Colors.transparent),
                                        child: ExpansionTile(
                                          title: Text(
                                            'Realistic (R)',
                                            style: textStyleInter.copyWith(
                                              fontSize: 16.sp,
                                              color: blackColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          children: [
                                            DetailText(
                                                leadingText: 'Score:',
                                                titleText: '${result?.hcR}'),
                                            DetailText(
                                                leadingText: 'Grade:',
                                                titleText: '${result?.rlabel}'),
                                            DetailText(
                                                leadingText: 'Description:',
                                                titleText: '${result?.rdescr}'),
                                            InkWell(
                                              onTap: () {
                                                debug('More Details Tapped');
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewDetailR()),
                                                );
                                              },
                                              child: Container(
                                                height: 30.h,
                                                width: 130.w,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF7288CA),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "View More Detail",
                                                      style: textStyleInter
                                                          .copyWith(
                                                              color:
                                                                  whiteColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            10.h.verticalSpace,
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                            dividerColor: Colors.transparent),
                                        child: ExpansionTile(
                                          title: Text(
                                            'Investigative (I)',
                                            style: textStyleInter.copyWith(
                                              fontSize: 16.sp,
                                              color: blackColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          children: [
                                            DetailText(
                                                leadingText: 'Score:',
                                                titleText: '${result?.hcI}'),
                                            DetailText(
                                                leadingText: 'Grade:',
                                                titleText: '${result?.ilabel}'),
                                            DetailText(
                                                leadingText: 'Description:',
                                                titleText: '${result?.idescr}'),
                                            InkWell(
                                              onTap: () {
                                                debug('More Details Tapped');
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewDetailI()),
                                                );
                                              },
                                              child: Container(
                                                height: 30.h,
                                                width: 130.w,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF7288CA),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "View More Detail",
                                                      style: textStyleInter
                                                          .copyWith(
                                                              color:
                                                                  whiteColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            10.h.verticalSpace,
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                            dividerColor: Colors.transparent),
                                        child: ExpansionTile(
                                          title: Text(
                                            'Artistic (A)',
                                            style: textStyleInter.copyWith(
                                              fontSize: 16.sp,
                                              color: blackColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          children: [
                                            DetailText(
                                                leadingText: 'Score:',
                                                titleText: '${result?.hcA}'),
                                            DetailText(
                                                leadingText: 'Grade:',
                                                titleText: '${result?.alabel}'),
                                            DetailText(
                                                leadingText: 'Description:',
                                                titleText: '${result?.adescr}'),
                                            InkWell(
                                              onTap: () {
                                                debug('More Details Tapped');
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewDetailA()),
                                                );
                                              },
                                              child: Container(
                                                height: 30.h,
                                                width: 130.w,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF7288CA),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "View More Detail",
                                                      style: textStyleInter
                                                          .copyWith(
                                                              color:
                                                                  whiteColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            10.h.verticalSpace,
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                            dividerColor: Colors.transparent),
                                        child: ExpansionTile(
                                          title: Text(
                                            'Social (S)',
                                            style: textStyleInter.copyWith(
                                              fontSize: 16.sp,
                                              color: blackColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          children: [
                                            DetailText(
                                                leadingText: 'Score:',
                                                titleText: '${result?.hcS}'),
                                            DetailText(
                                                leadingText: 'Grade:',
                                                titleText: '${result?.slabel}'),
                                            DetailText(
                                                leadingText: 'Description:',
                                                titleText: '${result?.sdescr}'),
                                            InkWell(
                                              onTap: () {
                                                debug('More Details Tapped');
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewDetailS()),
                                                );
                                              },
                                              child: Container(
                                                height: 30.h,
                                                width: 130.w,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF7288CA),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "View More Detail",
                                                      style: textStyleInter
                                                          .copyWith(
                                                              color:
                                                                  whiteColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            10.h.verticalSpace,
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                            dividerColor: Colors.transparent),
                                        child: ExpansionTile(
                                          title: Text(
                                            'Enterprising (E)',
                                            style: textStyleInter.copyWith(
                                              fontSize: 16.sp,
                                              color: blackColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          children: [
                                            DetailText(
                                                leadingText: 'Score:',
                                                titleText: '${result?.hcE}'),
                                            DetailText(
                                                leadingText: 'Grade:',
                                                titleText: '${result?.elabel}'),
                                            DetailText(
                                                leadingText: 'Description:',
                                                titleText: '${result?.edescr}'),
                                            InkWell(
                                              onTap: () {
                                                debug('More Details Tapped');
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewDetailE()),
                                                );
                                              },
                                              child: Container(
                                                height: 30.h,
                                                width: 130.w,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF7288CA),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "View More Detail",
                                                      style: textStyleInter
                                                          .copyWith(
                                                              color:
                                                                  whiteColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            10.h.verticalSpace,
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                            dividerColor: Colors.transparent),
                                        child: ExpansionTile(
                                          title: Text(
                                            'Conventional (C)',
                                            style: textStyleInter.copyWith(
                                              fontSize: 16.sp,
                                              color: blackColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          children: [
                                            DetailText(
                                                leadingText: 'Score:',
                                                titleText: '${result?.hcC}'),
                                            DetailText(
                                                leadingText: 'Grade:',
                                                titleText: '${result?.clabel}'),
                                            DetailText(
                                                leadingText: 'Description:',
                                                titleText: '${result?.cdescr}'),
                                            InkWell(
                                              onTap: () {
                                                debug('More Details Tapped');
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewDetailC()),
                                                );
                                              },
                                              child: Container(
                                                height: 30.h,
                                                width: 130.w,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF7288CA),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "View More Detail",
                                                      style: textStyleInter
                                                          .copyWith(
                                                              color:
                                                                  whiteColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            10.h.verticalSpace,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : SizedBox()
              : _resultDataStatus == Status.loading
                  ? const CustomLoader2(
                      color: itemColor,
                    )
                  : _resultDataStatus == Status.error
                      ? Center(
                          child: Text('Result Not Found'),
                        )
                      : _resultDataStatus == Status.successful
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Results',
                                              style: textStyleInter.copyWith(
                                                  fontSize: 22.sp,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                        30.h.verticalSpace,
                                        Wrap(
                                          children: [
                                            Text(
                                              'Score :  ',
                                              style: textStyleInter.copyWith(
                                                  fontSize: 16.sp,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              '${result2?.score}',
                                              style: textStyleInter.copyWith(
                                                  fontSize: 16.sp,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        5.h.verticalSpace,
                                        Wrap(
                                          children: [
                                            Text(
                                              'Label :  ',
                                              style: textStyleInter.copyWith(
                                                  fontSize: 16.sp,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              '${result2?.label}',
                                              style: textStyleInter.copyWith(
                                                  fontSize: 16.sp,
                                                  color: option1Color,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        5.h.verticalSpace,
                                        Wrap(
                                          children: [
                                            Text(
                                              'Description :  ',
                                              style: textStyleInter.copyWith(
                                                  fontSize: 16.sp,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              '${result2?.description}',
                                              style: textStyleInter.copyWith(
                                                  fontSize: 16.sp,
                                                  color: option1Color,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: PrimaryButton(
                                        btnHeight: 35.h,
                                        btnWidth: 70.w,
                                        text: 'Go To HomeScreen',
                                        press: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen(),
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(),
        ),
      ),
    );
  }
}

Widget buildRow(String letter, String title, String score) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 4),
    child: Row(
      children: [
        Text(
          letter,
          style: textStyleInter.copyWith(
              fontSize: 16.sp,
              color: option1Color,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Text(
            title,
            style: textStyleInter.copyWith(
                fontSize: 16.sp,
                color: option1Color,
                fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          ':',
          style: textStyleInter.copyWith(
              fontSize: 16.sp,
              color: option1Color,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(width: 10),
        Text(
          score.toString(),
          style: textStyleInter.copyWith(
              fontSize: 16.sp,
              color: option1Color,
              fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}

class DetailText extends StatelessWidget {
  final String leadingText;
  final String? titleText;

  DetailText({required this.leadingText, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            leadingText,
            style: textStyleInter.copyWith(
                color: blackColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              titleText ?? '',
              style: textStyleInter.copyWith(
                  fontSize: 16.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w400),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
