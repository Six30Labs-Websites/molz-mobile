part of 'test_imports.dart';

class TestScreen extends StatefulWidget {
  final item;
  TestScreen({required this.item});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
    debug('TestScreen');
    _getTestDetailsApiCall();
  }

  TestListModel? getTestListData;
  TestDetailModel? testDetail;

  Status _testDetailDataStatus = Status.loading;

  _getTestDetailsApiCall() {
    debug('Test ID is\n ${{
      "testID": widget.item.id,
    }}');
    ApiCall.get('${Urls.getTest}/${widget.item.id}', success: (success) {
      debug(success.toString());

      try {
        setState(() {
          testDetail = TestDetailModel.fromJson(jsonDecode(success));
          _testDetailDataStatus = Status.successful;
        });
        debug('testDetails: ${testDetail!.data!.name!}');
      } catch (e) {
        error(e.toString());
        showToastError("Something went wrong !!");
        setState(() {
          _testDetailDataStatus = Status.error;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 20.h),
            child: _testDetailDataStatus == Status.loading
                ? const CustomLoader2(
                    color: itemColor,
                  )
                : _testDetailDataStatus == Status.error
                    ? Center(
                        child: Text('Test Detail Not Found'),
                      )
                    : _testDetailDataStatus == Status.successful
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              15.h.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        "${testDetail?.data?.name ?? ''}",
                                        style: textStyleInter.copyWith(
                                            fontSize: 22.sp,
                                            color: option1Color,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              15.h.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Image.asset("assets/png/Star Filled.png",
                                  //     width: 18.w, height: 14.h),
                                  Text(
                                    'Questions Count: ${testDetail?.data?.questionsCount ?? ''}',
                                    style: textStyleInter.copyWith(
                                        fontSize: 12.sp,
                                        color: option1Color,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              20.h.verticalSpace,
                              Text(
                                '${testDetail?.data?.description ?? ''}',
                                style: textStyleInter.copyWith(
                                    fontSize: 16.sp,
                                    color: option1Color,
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (testDetail?.data?.testTaken != 0)
                                        Text(
                                          'You Have Already Attended this Test!',
                                          style: textStyleInter.copyWith(
                                              fontSize: 12.sp,
                                              color: option1Color,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      SizedBox(height: 20.h),
                                      PrimaryButton(
                                          btnWidth: 150.w,
                                          text: testDetail?.data?.testTaken == 0
                                              ? 'Start Test'
                                              : 'View Results',
                                          press: () {
                                            if (testDetail?.data?.testTaken ==
                                                0) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      QuestionsScreen(
                                                          item: testDetail),
                                                ),
                                              );
                                            } else {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ResultScreen(
                                                          item: testDetail),
                                                ),
                                              );
                                            }
                                          }),
                                      SizedBox(height: 20.h),
                                    ],
                                  ),
                                ),
                              ),
                              20.h.verticalSpace,
                            ],
                          )
                        : SizedBox(),
          ),
        ),
      ),
    );
  }
}
