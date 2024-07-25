import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_molz/src/utils/custom_heights.dart';
import 'package:project_molz/src/utils/custom_text_styles.dart';

class WalkThroughPage extends StatelessWidget {
  const WalkThroughPage(
      {required this.image,
      required this.title,
      required this.description,
      super.key});

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    // assets/png/walk_through.png
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: mediaQWidth(context),
        height: mediaQHeight(context),
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
                  // height: 341.h,
                  // width: 604.w,
                  height: 300.h,
                  width: 501.w,
                  //fit: BoxFit.cover,
                ),
              ),
              20.h.verticalSpace,
              AutoSizeText(title,
                  style: textStyleInter.copyWith(
                      fontSize: 34.sp, fontWeight: FontWeight.w700)),
              20.h.verticalSpace,
              AutoSizeText(description,
                  textAlign: TextAlign.center,
                  style: textStyleInter.copyWith(
                      fontSize: 15.sp, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    ));
  }
}
