import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:molz/src/utils/custom_colors.dart';
import 'package:molz/src/utils/custom_text_styles.dart';

class ViewDetailA extends StatelessWidget {
  const ViewDetailA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.h.verticalSpace,
            Text(
              'A = Artistic',
              style: textStyleInter.copyWith(
                  fontSize: 17.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w700),
            ),
            5.h.verticalSpace,
            Text(
              'These people like to work in unstructured situations where they can use their creativity. Good career options for Artistic people are...',
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
                    'Communications',
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
                    'Cosmetology',
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
                    'Fine and Performing Arts',
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
                    'Photography',
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
                    'Radio and TV',
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
                    'Interior Design',
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
                    'Architecture',
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
                  fontWeight: FontWeight.w600),
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
                    'Law, Government, and Public Safety',
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
