import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:molz/src/utils/custom_colors.dart';
import 'package:molz/src/utils/custom_heights.dart';

import '../../../utils/custom_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {super.key,
      required this.headerName,
      required this.hintText,
      required this.prefixIcon,
      this.postfixIcon,
      required this.controller,
      this.focusNode});

  final String headerName;
  final String hintText;
  final String prefixIcon;
  String? postfixIcon;
  final TextEditingController controller;
  FocusNode? focusNode;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  void initState() {
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.headerName,
            style: textStyleFranie.copyWith(fontWeight: FontWeight.w600)),
        sizeHeight10,
        SizedBox(
          //height: 55.h,
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              // fillColor: kPrimaryColor,
              // prefixIcon: SizedBox(
              //   // height: 16.h,
              //   // width: 16.w,
              //   child: SvgPicture.asset("assets/svg/mail.svg", height: 16, width: 16,),
              // ),
              prefixIcon: widget.prefixIcon.isNotEmpty
                  ? SizedBox(
                      height: 16.h,
                      width: 16.w,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 3, left: 14, right: 14),
                        child: SvgPicture.asset(widget.prefixIcon,
                            height: 16.h, width: 16.w),
                      ),
                    )
                  : const SizedBox(),
              suffixIcon: widget.postfixIcon != null
                  ? SizedBox(
                      height: 16.h,
                      width: 16.w,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 14, right: 14),
                        child: SvgPicture.asset(widget.postfixIcon!,
                            height: 16.h, width: 16.w),
                      ),
                    )
                  : const SizedBox(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                    //color: option1Color,
                    ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                    //color: option1Color,
                    ),
              ),
              hintStyle: textStyleFranie.copyWith(
                fontSize: 10,
              ),
              hintText: widget.hintText,
            ),
          ),
        ),
      ],
    );
  }
}
