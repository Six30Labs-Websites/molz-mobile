import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:molz/src/utils/custom_colors.dart';
import 'package:molz/src/utils/custom_text_styles.dart';

class ViewDetailS extends StatelessWidget {
  const ViewDetailS({super.key});

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
              'S = Social',
              style: textStyleInter.copyWith(
                  fontSize: 16.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w700),
            ),
            5.h.verticalSpace,
            Text(
              'These people like to work with other people, rather than things. Good career options for Social people are...',
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
                    'Counseling',
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
                    'Nursing',
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
                    'Physical Therapy',
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
                    'Travel',
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
                    'Advertising',
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
                    'Public Relations',
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
                    'Education',
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
                    'Education',
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
            Row(
              children: [
                Text("\u2022"),
                5.w.horizontalSpace,
                Expanded(
                  child: Text(
                    'Culinary, Hospitality, and Tourism',
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
