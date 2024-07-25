import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_molz/src/utils/custom_colors.dart';
import 'package:project_molz/src/utils/custom_text_styles.dart';

class ViewDetailC extends StatelessWidget {
  const ViewDetailC({super.key});

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
              'C = Conventional',
              style: textStyleInter.copyWith(
                  fontSize: 16.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w700),
            ),
            5.h.verticalSpace,
            Text(
              'These people are very detail oriented,organized and like to work with data. Good career options for Conventional people are...',
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
                    'Accounting',
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
                    'Court Reporting',
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
                    'Insurance',
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
                    'Administration',
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
                    'Medical Records',
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
                    'Banking',
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
                    'Data Processing',
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
          ],
        ),
      ),
    );
  }
}
