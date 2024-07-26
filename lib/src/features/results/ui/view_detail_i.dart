import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:molz/src/utils/custom_colors.dart';
import 'package:molz/src/utils/custom_text_styles.dart';

class ViewDetailI extends StatelessWidget {
  const ViewDetailI({super.key});

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
              'I = Investigative',
              style: textStyleInter.copyWith(
                  fontSize: 16.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w700),
            ),
            5.h.verticalSpace,
            Text(
              'These people like to watch, learn, analyze and solve problems. Good career options for Investigative people are...',
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
                    'Marine Biology',
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
                    'Chemistry',
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
                    'Zoology',
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
                    'Medicine/Surgery',
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
                    'Consumer Economics',
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
                    'Psychology',
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
                    'Business',
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
                    'Law, Government, and Public Safety',
                    style: textStyleInter.copyWith(
                        fontSize: 16.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            5.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
