import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_molz/src/utils/custom_colors.dart';
import 'package:project_molz/src/utils/custom_text_styles.dart';

class ViewDetailR extends StatelessWidget {
  const ViewDetailR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.h.verticalSpace,
            Text(
              'R = Realistic',
              style: textStyleInter.copyWith(
                  fontSize: 16.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w700),
            ),
            5.h.verticalSpace,
            Text(
              'These people are often good at mechanical or athletic jobs. Good career options for Realistic people are...',
              style: textStyleInter.copyWith(
                  fontSize: 16.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w400),
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text("\u2022"),
                5.w.horizontalSpace,
                Expanded(
                  child: Text(
                    'Agriculture',
                    style: textStyleInter.copyWith(
                        fontSize: 16.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text("\u2022"),
                5.w.horizontalSpace,
                Expanded(
                  child: Text(
                    'Health Assistant',
                    style: textStyleInter.copyWith(
                        fontSize: 16.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text("\u2022"),
                5.w.horizontalSpace,
                Expanded(
                  child: Text(
                    'Computers',
                    style: textStyleInter.copyWith(
                        fontSize: 16.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text("\u2022"),
                5.w.horizontalSpace,
                Expanded(
                  child: Text(
                    'Construction',
                    style: textStyleInter.copyWith(
                        fontSize: 16.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text("\u2022"),
                5.w.horizontalSpace,
                Expanded(
                  child: Text(
                    'Mechanic/Machinist',
                    style: textStyleInter.copyWith(
                        fontSize: 16.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text("\u2022"),
                5.w.horizontalSpace,
                Expanded(
                  child: Text(
                    'Engineering',
                    style: textStyleInter.copyWith(
                        fontSize: 16.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text("\u2022"),
                5.w.horizontalSpace,
                Expanded(
                  child: Text(
                    'Food and Hospitality',
                    style: textStyleInter.copyWith(
                        fontSize: 16.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            20.h.verticalSpace,
            Text(
              'Related Pathways',
              style: textStyleInter.copyWith(
                  fontSize: 16.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w500),
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text("\u2022"),
                5.w.horizontalSpace,
                Expanded(
                  child: Text(
                    'Arts, Creative Media, and Communication',
                    style: textStyleInter.copyWith(
                        fontSize: 16.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text("\u2022"),
                5.w.horizontalSpace,
                Expanded(
                  child: Text(
                    'Information Technology',
                    style: textStyleInter.copyWith(
                        fontSize: 16.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text("\u2022"),
                5.w.horizontalSpace,
                Expanded(
                  child: Text(
                    'Health Sciences and Human Services',
                    style: textStyleInter.copyWith(
                        fontSize: 16.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text("\u2022"),
                5.w.horizontalSpace,
                Expanded(
                  child: Text(
                    'Industrial and Engineering Technology',
                    style: textStyleInter.copyWith(
                        fontSize: 16.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            5.h.verticalSpace,
            Row(
              children: [
                Text("\u2022"),
                5.w.horizontalSpace,
                Expanded(
                  child: Text(
                    'Agriculture, Food Innovation, and Natural Resources',
                    style: textStyleInter.copyWith(
                        fontSize: 16.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
