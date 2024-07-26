import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:molz/src/utils/custom_colors.dart';
import 'package:molz/src/utils/custom_text_styles.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50.h),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Roy!",
                  style: textStyleInter.copyWith(
                    color: option1Color,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                10.verticalSpace,
                Text(
                  "Find Your test",
                  style: textStyleInter.copyWith(
                    color: option1Color,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: option1Color,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svg/carbon_search.svg",
                  height: 21.h,
                  width: 21.w,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
