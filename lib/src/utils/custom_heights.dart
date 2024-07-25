import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox sizeHeight10 = SizedBox(height: 10.h);
SizedBox sizeHeight20 = SizedBox(height: 20.h);

SizedBox sizeWidth10 = SizedBox(width: 10.w);
SizedBox sizeWidth20 = SizedBox(width: 20.w);

customHeightSizedBox(double height) {
  return SizedBox(height: height.h);
}

customWidthSizedBox(double width) {
  return SizedBox(width: width.w);
}

double mediaQWidth(BuildContext context) {
  return MediaQuery.of(context).size.width.w;
}

double mediaQHeight(BuildContext context) {
  return MediaQuery.of(context).size.height.h;
}

double mediaQCustomHeight(BuildContext context, {double height = 1}) {
  return MediaQuery.of(context).size.height.h * height.h;
}

double mediaQCustomWidth(BuildContext context, {double width = 1}) {
  return MediaQuery.of(context).size.width.w * width.w;
}
