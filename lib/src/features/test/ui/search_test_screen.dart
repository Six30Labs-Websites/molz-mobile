import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:molz/src/features/home/data/models/test_list_model.dart';
import 'package:molz/src/features/test/ui/test_imports.dart';
import 'package:molz/src/services/api_services.dart';
import 'package:molz/src/services/urls.dart';
import 'package:molz/src/utils/custom_colors.dart';
import 'package:molz/src/utils/custom_text_styles.dart';
import 'package:molz/src/utils/custom_toasts.dart';
import 'package:molz/src/utils/logger.dart';

class SearchTest extends StatefulWidget {
  const SearchTest({super.key});

  @override
  State<SearchTest> createState() => _SearchTestState();
}

class _SearchTestState extends State<SearchTest> {
  @override
  void initState() {
    super.initState();
    fetchTestList();
  }

  TestListModel? getTestListData;
  List<TestData>? testData = [];
  List<TestData>? apiTestData = [];

  runFilter(String enteredKeyword) {
    print("enteredKeyword = $enteredKeyword");
    List<TestData> results = [];
    if (enteredKeyword.isEmpty) {
      results = apiTestData!;
    } else {
      results = apiTestData!
          .where((user) =>
              user.name!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    print("results = ${results.length}");
    setState(() {
      testData = results;
    });
  }

  fetchTestList() async {
    ApiCall.get(Urls.getTestList, success: (success) async {
      debug(success);
      try {
        var getTestListData = TestListModel.fromJson(jsonDecode(success));
        apiTestData = getTestListData.data!;
        setState(() {
          testData = apiTestData;
        });
        //courseData = getCourseListData.data!;
        // await AccountManager.setUserData(LogInWithEmailModelData);
        // await AccountManager.setToken(
        //     LogInWithEmailModelData.data!.accessToken!);
      } catch (e) {
        error(e.toString());
        showToastError("Something went wrong !!");
      }
    });
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                runFilter(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search Test',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: testData?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final testListData = testData![index];
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TestScreen(item: testListData)));
                      },
                      child: GridTile(
                        child: Container(
                          padding: EdgeInsets.only(top: 25.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: option5Color,
                          ),
                          child: Column(
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
                                  textAlign: TextAlign.center,
                                  style: textStyleInter.copyWith(
                                      color: blackColor,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              // 8.h.verticalSpace,
                              Expanded(
                                child: Text("Read more",
                                    style: textStyleInter.copyWith(
                                        decoration: TextDecoration.underline,
                                        color: blackColor,
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            10.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
