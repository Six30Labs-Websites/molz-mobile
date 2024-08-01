import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:molz/src/commons/ui/secondary_button.dart';
import 'package:molz/src/features/forgot_pwd/ui/set_pass_screen.dart';
import 'package:molz/src/services/api_services.dart';
import 'package:molz/src/services/urls.dart';
import 'package:molz/src/utils/custom_colors.dart';
import 'package:molz/src/utils/custom_heights.dart';
import 'package:molz/src/utils/custom_navigation.dart';
import 'package:molz/src/utils/custom_text_styles.dart';
import 'package:molz/src/utils/custom_toasts.dart';
import 'package:molz/src/utils/logger.dart';

import '../../../commons/ui/primary_button.dart';
import '../../home/ui/home_imports.dart';
import '../data/models/req_pass_model.dart';

class ReqPwdScreen extends StatefulWidget {
  ReqPwdScreen({super.key});

  @override
  State<ReqPwdScreen> createState() => _ReqPwdScreenState();
}

class _ReqPwdScreenState extends State<ReqPwdScreen> {
  TextEditingController _emailController = TextEditingController();

  _reqPwdApiCall() {
    if (_emailController.text.isEmpty) {
      showToastError('Please fill e-mail');
    } else {
      ApiCall.post(
        Urls.resetRequest,
        body: {
          "email": _emailController.text,
        },
        success: (success) async {
          //debug(success);
          debug('_reqPwdApiCall success');

          try {
            ReqPwdModel reqPwdModel = ReqPwdModel.fromJson(jsonDecode(success));

            if (reqPwdModel.success == true) {
              navigateCupertino(context, SetPwdScreen());
              showToastSuccess("OTP has been send to the Registered email");
            } else {
              showToastError("InCorrect Email ID");
            }
          } catch (e) {
            error(e.toString());
            showToastError("Something went wrong !!");
          }
        },
        failure: (fail) {
          debug("_reqPwdApiCall fail ----->>>>>>>>>$fail");
          try {
            ReqPwdModel reqPwdModel = ReqPwdModel.fromJson(jsonDecode(fail));
          } catch (e) {
            error(e.toString());
            showToastError("Something went Wrong !!");
          }
        },
        error400: (e4) {
          debug("_nonColliersLoginApiCall e4");
          showToastError("User UnAuthorized !!");
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Please Enter your email address:',
                style: textStyleFranie.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: blackColor)),
            sizeHeight20,
            SizedBox(
              height: 55.h,
              child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: option1Color,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: option1Color,
                        ),
                      ),
                      hintStyle: textStyleFranie.copyWith(
                        fontSize: 10,
                      ),
                      hintText: 'Enter your email address')),
            ),
            sizeHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryButton(
                    press: () {
                      _reqPwdApiCall();
                    },
                    text: 'Submit',
                    btnWidth: mediaQCustomWidth(context, width: 0.20)),
                // SecondaryButton(
                //     text: 'Back',
                //     press: () {
                //       Navigator.pop(context);
                //     },
                //     btnWidth: mediaQCustomWidth(context, width: 0.20))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
