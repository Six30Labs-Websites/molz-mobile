import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:molz/src/utils/custom_heights.dart';
import 'package:molz/src/utils/custom_text_styles.dart';

class WalkThroughPage extends StatelessWidget {
  const WalkThroughPage({
    required this.image,
    required this.title,
    required this.description,
    super.key,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                70.h.verticalSpace,
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: SvgPicture.asset(
                    image,
                    height: 300.h,
                    width: 501.w,
                  ),
                ),
                20.h.verticalSpace,
                Text(
                  title,
                  style: textStyleInter.copyWith(
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                20.h.verticalSpace,
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: textStyleInter.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
