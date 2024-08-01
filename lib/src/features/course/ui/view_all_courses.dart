import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:molz/src/features/course/ui/course_imports.dart';
import 'package:molz/src/features/home/data/models/test_list_model.dart';
import 'package:molz/src/features/test/ui/test_imports.dart';
import 'package:molz/src/services/api_services.dart';
import 'package:molz/src/services/urls.dart';
import 'package:molz/src/utils/custom_colors.dart';
import 'package:molz/src/utils/custom_text_styles.dart';
import 'package:molz/src/utils/custom_toasts.dart';
import 'package:molz/src/utils/logger.dart';

import '../../home/data/models/course_list_model.dart';

class ViewAllCourses extends StatefulWidget {
  const ViewAllCourses({super.key});

  @override
  State<ViewAllCourses> createState() => _ViewAllCoursesState();
}

class _ViewAllCoursesState extends State<ViewAllCourses> {
  @override
  void initState() {
    super.initState();
    fetchCourseList();
  }

  CourseListModel? getCourseListData;
  // List<TestData>? testData = [];
  // List<TestData>? apiTestData = [];
  List<CourseData>? apiCourseData = [];
  List<CourseData>? courseData = [];

  fetchCourseList() async {
    ApiCall.get(Urls.getCourseList, success: (success) async {
      debug(success);
      try {
        var getCourseListData = CourseListModel.fromJson(jsonDecode(success));
        apiCourseData = getCourseListData.data!;
        setState(() {
          courseData = apiCourseData;
        });
      } catch (e) {
        error(e.toString());
        showToastError("Something went wrong !!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final courseListData = courseData![index];
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CourseScreen(item: courseListData),
                        ),
                      );
                    },
                    child: GridTile(
                      child: Container(
                        width: 143.w,
                        padding: EdgeInsets.only(top: 25.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
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
                                courseData![index].name!,
                                textAlign: TextAlign.center,
                                style: textStyleInter.copyWith(
                                    color: blackColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
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
                },
                childCount: courseData?.length ?? 0,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
        ],
      ),
    );
  }
}
