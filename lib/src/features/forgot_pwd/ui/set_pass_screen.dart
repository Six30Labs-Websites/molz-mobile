import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_molz/src/features/forgot_pwd/data/models/set_pass_model.dart';
import 'package:project_molz/src/features/login/ui/login_imports.dart';
import 'package:project_molz/src/services/api_services.dart';
import 'package:project_molz/src/services/urls.dart';
import 'package:project_molz/src/utils/custom_navigation.dart';
import 'package:project_molz/src/utils/custom_toasts.dart';
import 'package:project_molz/src/utils/logger.dart';

import '../../../commons/ui/primary_button.dart';
import '../../../utils/custom_colors.dart';
import '../../../utils/custom_heights.dart';
import '../../../utils/custom_text_styles.dart';

class SetPwdScreen extends StatefulWidget {
  const SetPwdScreen({super.key});

  @override
  State<SetPwdScreen> createState() => _SetPwdScreenState();
}

class _SetPwdScreenState extends State<SetPwdScreen> {
  late bool _passwordVisible;
  late String prefixIcon;
  String? postfixIcon;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    //
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _updatePwdController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  _setPwdApiCall() {
    debug('update Btn Pressed!! ');
    if (_emailController.text.isEmpty) {
      showToastError('Please fill email');
    } else if (_updatePwdController.text.isEmpty) {
      showToastError('Please fill password');
    } else if (_otpController.text.isEmpty) {
      showToastError('Please enter otp');
    } else {
      ApiCall.post(
        Urls.resetPassword,
        body: {
          "email": _emailController.text,
          "password": _updatePwdController.text,
          "token": _otpController.text,
        },
        success: (success) async {
          debug(success);

          try {
            SetPwdModel signUpWithEmailModel =
                SetPwdModel.fromJson(jsonDecode(success));

            if (signUpWithEmailModel.success == true) {
              navigateCupertino(context, LogInScreen());
              showToastSuccess("Password Updated Successfully");
            } else {
              showToastError(signUpWithEmailModel.error);
            }
            //   //navigateCupertino(context, const HomeScreen());

            // await AccountManager.setUserData(LogInWithEmailModelData);
            // await AccountManager.setToken(
            //     LogInWithEmailModelData.data!.accessToken!);
          } catch (e) {
            error(e.toString());
            showToastError("Something went wrong !!");
          }
        },
        failure: (fail) {
          debug("_setPwdApiCall fail ----->>>>>>>>>$fail");
          try {
            SetPwdModel signUpWithEmailModel =
                SetPwdModel.fromJson(jsonDecode(fail));

            showToastError(signUpWithEmailModel.error);
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
            sizeHeight10,
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
            Text('Update your Password',
                style: textStyleFranie.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: blackColor)),
            sizeHeight10,
            SizedBox(
              height: 55.h,
              child: TextFormField(
                controller: _updatePwdController,
                keyboardType: TextInputType.text,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  // fillColor: kPrimaryColor,
                  // prefixIcon: SizedBox(
                  //   // height: 16.h,
                  //   // width: 16.w,
                  //   child: SvgPicture.asset("assets/svg/mail.svg", height: 16, width: 16,),
                  // ),
                  // prefixIcon: prefixIcon.isNotEmpty
                  //     ? SizedBox(
                  //         height: 16.h,
                  //         width: 16.w,
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(
                  //               top: 8, left: 14, right: 14),
                  //           child: SvgPicture.asset(prefixIcon,
                  //               height: 16.h, width: 16.w),
                  //         ),
                  //       )
                  //     : const SizedBox(),
                  suffixIcon: "assets/svg/eye-off.svg" != null
                      // ? SizedBox(
                      //     height: 16.h,
                      //     width: 16.w,
                      //     child: Padding(
                      //       padding:
                      //           const EdgeInsets.only(top: 8, left: 14, right: 14),
                      //       child: SvgPicture.asset(widget.postfixIcon!,
                      //           height: 16.h, width: 16.w),
                      //     ),
                      //   )
                      // : const SizedBox(),
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        )
                      : SizedBox(),
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
                  hintText: 'Enter Password',
                ),
              ),
            ),
            sizeHeight20,
            Text('Please Enter your One Time Password:',
                style: textStyleFranie.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: blackColor)),
            sizeHeight10,
            SizedBox(
              height: 55.h,
              child: TextFormField(
                  controller: _otpController,
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
                      hintText: 'Enter your OTP!')),
            ),
            sizeHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryButton(
                    press: () {
                      _setPwdApiCall();
                    },
                    text: 'Update',
                    btnWidth: mediaQCustomWidth(context, width: 0.20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}