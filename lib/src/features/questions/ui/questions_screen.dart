part of 'questions_imports.dart';

class QuestionsScreen extends StatefulWidget {
  final TestDetailModel? item;
  QuestionsScreen({required this.item});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  void initState() {
    super.initState();
    _getTestQuestionsApiCall();
  }

  TestQuestionsData? testQuestions;
  TestAnswerModel? testAnswer;
  int currentQuestion = 0;
  var optionsVal;

  Status _questionsListDataStatus = Status.loading;

  _getTestQuestionsApiCall() {
    optionsVal = [
      false,
      false,
      false,
      false,
      false,
    ];
    ApiCall.get(
        '${Urls.getTest}/${widget.item?.data?.id}/questions?current=$currentQuestion',
        success: (success) {
      debug(success.toString());

      try {
        setState(() {
          testQuestions = TestQuestionsData.fromJson(jsonDecode(success));
          _questionsListDataStatus = Status.successful;
        });
        debug('testDetails: ${testQuestions!.data!.questionText!}');
      } catch (e) {
        error(e.toString());
        showToastError("Something went wrong !!");
        _questionsListDataStatus = Status.error;
      }
    });
  }

  updateAnswer(int? qid, Choices? choic) {
    HttpCall.post(
      '${Urls.getTest}/${widget.item?.data?.id}/questions/$qid/responses',
      jsonData: {
        "answerId": choic?.id,
      },
      success: (success) async {
        debug(success);

        try {
          TestAnswerModel testAnswer =
              TestAnswerModel.fromJson(jsonDecode(success));
          if (widget.item!.data!.questionsCount! > currentQuestion + 1) {
            // increment and call next question
            currentQuestion++;
            _getTestQuestionsApiCall();
          } else {
            // go to result page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(item: widget.item),
              ),
            );
          }
        } catch (e) {
          error(e.toString());
          showToastError("Something went wrong !!");
        }
      },
      failure: (fail) {
        debug("_updateAnswerApiCall fail ----->>>>>>>>>$fail");
        try {
          FailModel failModel = FailModel.fromJson(jsonDecode(fail));
          //showToastError(failModel.error);
          showToastError("Already Test Attended");
        } catch (e) {
          error(e.toString());
          showToastError("Something went Wrong !!");
        }
      },
      error400: (e4) {
        debug("_nonColliersLoginApiCall e4");
        showToastError("User UnAuthorized !!");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return false to prevent back navigation
        if (currentQuestion == 0) {
          return true;
        } else {
          showToastNormal("Can't go back to the previous question!!");
          return false;
        }
      },
      child: Scaffold(
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
                  // Text("Details",
                  //     style: textStyleInter.copyWith(
                  //         color: option1Color,
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 20.sp)),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     SvgPicture.asset(
                  //       "assets/svg/system-uicons_heart.svg",
                  //       height: 28.h,
                  //       width: 28.w,
                  //     ),
                  //     SizedBox(width: 25.w),
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: _questionsListDataStatus == Status.loading
                  ? const Center(
                      child: CustomLoader2(
                        color: itemColor,
                      ),
                    )
                  : _questionsListDataStatus == Status.error
                      ? const Center(
                          child: Text('Questions Not Found'),
                        )
                      : _questionsListDataStatus == Status.successful
                          ? SizedBox(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          20.h.verticalSpace,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Question",
                                                style: textStyleInter.copyWith(
                                                  color: option1Color,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17.sp,
                                                ),
                                              ),
                                              4.w.horizontalSpace,
                                              Text(
                                                "${currentQuestion + 1}",
                                                style: textStyleInter.copyWith(
                                                  color: option1Color,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 36.sp,
                                                ),
                                              ),
                                              // 6.w.horizontalSpace,
                                              Text(
                                                "/${widget.item?.data!.questionsCount}",
                                                style: textStyleInter.copyWith(
                                                  color: option1Color,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17.sp,
                                                ),
                                              )
                                            ],
                                          ),
                                          4.h.verticalSpace,
                                          Container(
                                            height: 1.h,
                                            color: option1Color,
                                            width: 144.w,
                                          ),
                                          75.h.verticalSpace,
                                          AutoSizeText(
                                            "${testQuestions?.data?.questionText ?? ''}",
                                            style: textStyleInter.copyWith(
                                              color: option1Color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20.sp,
                                            ),
                                          ),
                                          30.h.verticalSpace,
                                          Container(
                                            //padding: const EdgeInsets.all(0.0),
                                            //height: mediaQCustomHeight(context, height: 0.40.h),
                                            child: ListView.separated(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder: (c, i) {
                                                  return InkWell(
                                                    onTap: () {
                                                      debug("message");
                                                      for (int i = 0;
                                                          i < optionsVal.length;
                                                          i++) {
                                                        optionsVal[i] = false;
                                                      }
                                                      optionsVal[i] = true;
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20.w,
                                                              vertical: 10.h),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.r),
                                                        border: Border.all(
                                                          color: option1Color,
                                                          width: 1.w,
                                                        ),
                                                        color: optionsVal[i]
                                                            ? option1Color
                                                            : whiteColor,
                                                      ),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        testQuestions
                                                                ?.data
                                                                ?.choices?[i]
                                                                ?.label ??
                                                            '',
                                                        style: textStyleInter
                                                            .copyWith(
                                                          color: !optionsVal[i]
                                                              ? option1Color
                                                              : whiteColor,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                separatorBuilder: (c2, i2) {
                                                  return 15.h.verticalSpace;
                                                },
                                                itemCount: testQuestions?.data
                                                        ?.choices?.length ??
                                                    0),
                                          ),
                                          20.h.verticalSpace,
                                          Center(
                                              child: PrimaryButton(
                                            text: widget.item!.data!
                                                        .questionsCount! >
                                                    currentQuestion + 1
                                                ? "Next"
                                                : "Submit",
                                            press: () {
                                              var isAnswer = false;
                                              optionsVal
                                                  .asMap()
                                                  .forEach((index, item) {
                                                if (item == true) {
                                                  isAnswer = true;
                                                  updateAnswer(
                                                      testQuestions?.data?.id,
                                                      testQuestions?.data
                                                          ?.choices?[index]);
                                                  debug(
                                                      "selected value : $index");
                                                }
                                              });
                                              if (isAnswer == false) {
                                                showToastError(
                                                    'Please Select One Option!');
                                              }
                                            },
                                            color: option1Color,
                                            btnWidth: 150.w,
                                          )),
                                          20.h.verticalSpace,
                                        ],
                                      )),
                                  Positioned(
                                      top: 0.h,
                                      right: -35.w,
                                      child: Image.asset(
                                        "assets/png/elip7.png",
                                        height: 112.h,
                                        width: 112.w,
                                      )),
                                  Positioned(
                                      top: 22.h,
                                      right: 45.w,
                                      child: Image.asset(
                                        "assets/png/elip9.png",
                                        height: 86.h,
                                        width: 86.w,
                                      )),
                                  Positioned(
                                      top: 100.h,
                                      right: 23.w,
                                      child: Image.asset(
                                        "assets/png/elip8.png",
                                        height: 39.h,
                                        width: 39.w,
                                      )),
                                ],
                              ),
                            )
                          : SizedBox(),
            ),
          ),
        ),
      ),
    );
  }

  void emptyAnswerToast() {
    Fluttertoast.showToast(
        msg: 'Select One',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.black);
  }
}
