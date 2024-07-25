part of 'signup_imports.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _confEmailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _confPassController = TextEditingController();
  TextEditingController _gradeController = TextEditingController();
  TextEditingController _provinceController = TextEditingController();
  TextEditingController _schoolController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _molzSignUpApiCall() {
    debug('molz signup Btn Pressed!! ');
    if (_fullNameController.text.isEmpty) {
      showToastError('Please fill fullname');
    } else if (_emailController.text.isEmpty) {
      showToastError('Please fill e-mail');
    } else if (_passController.text.isEmpty) {
      showToastError('Please fill password');
    } else if (_confPassController.text.isEmpty) {
      showToastError('Please fill confirm password');
    } else if (_passController.text != _confPassController.text) {
      showToastError('The password you entered is mismatch');
    } else if (_gradeController.text.isEmpty) {
      showToastError('Please enter your Grade');
    } else if (_provinceController.text.isEmpty) {
      showToastError('Please enter Province');
    } else if (_schoolController.text.isEmpty) {
      showToastError('Please enter School');
    } else {
      ApiCall.post(
        Urls.signUpWithEmail,
        body: {
          "username": _userNameController.text,
          "email": _emailController.text,
          "password": _passController.text,
          "fullName": _fullNameController.text,
        },
        success: (success) async {
          debug(success);

          try {
            SignUpWithEmailModel signUpWithEmailModel =
                SignUpWithEmailModel.fromJson(jsonDecode(success));

            if (signUpWithEmailModel.success == true) {
              //navigateCupertino(context, WalkThroughScreen());
              navigateCupertino(context, LogInScreen());
              showToastSuccess("New Account Created Successfully");
              showToastSuccess(
                  "Kindly Verify Your Email Id,To Get Logged In!!");
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
          debug("_molzSignUpApiCall fail ----->>>>>>>>>$fail");
          try {
            SignUpWithEmailModel SignUpWithEmailModelData =
                SignUpWithEmailModel.fromJson(jsonDecode(fail));

            showToastError(SignUpWithEmailModelData.error);
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
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    if (isDarkMode) {
      debug("Dark Mode");
    } else {
      debug("Light Mode");
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: customPadding(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //customHeightSizedBox(mediaQCustomHeight(context, height: 0.10)),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                    height: 59.h,
                    width: 194.w,
                    child: Image.asset(
                      "assets/logos/Asset11.png",
                    )),
                sizeHeight20,
                // CustomTextFormField(
                //   headerName: "UserName",
                //   hintText: "Enter your UserName",
                //   prefixIcon: null,
                //   postfixIcon: null,
                //   controller: _userNameController,
                //   focusNode: null,
                // ),
                // customHeightSizedBox(15),
                CustomTextFormField(
                  headerName: "FullName",
                  hintText: "Enter your FullName",
                  prefixIcon: null,
                  postfixIcon: null,
                  controller: _fullNameController,
                  focusNode: null,
                ),
                customHeightSizedBox(15),
                CustomTextFormField(
                  headerName: "E-mail",
                  hintText: "Enter your email address",
                  prefixIcon: null,
                  postfixIcon: null,
                  controller: _emailController,
                  focusNode: null,
                ),
                customHeightSizedBox(15),
                // CustomTextFormField(
                //   headerName: "Confirm E-mail",
                //   hintText: "Re-enter your email address",
                //   prefixIcon: null,
                //   postfixIcon: null,
                //   controller: _confEmailController,
                //   focusNode: null,
                // ),
                // customHeightSizedBox(15),
                CustomPwdFormField(
                  headerName: "Password",
                  hintText: "Enter your Password",
                  prefixIcon: 'assets/svg/lock.svg',
                  postfixIcon: "assets/svg/eye-off.svg",
                  controller: _passController,
                  focusNode: null,
                ),
                customHeightSizedBox(15),
                CustomPwdFormField(
                  headerName: "Confirm Password",
                  hintText: "Re-enter your Password",
                  prefixIcon: 'assets/svg/lock.svg',
                  postfixIcon: "assets/svg/eye-off.svg",
                  controller: _confPassController,
                  focusNode: null,
                ),
                customHeightSizedBox(15),
                CustomTextFormField(
                  headerName: "Grade",
                  hintText: "Enter your Grade",
                  prefixIcon: null,
                  postfixIcon: null,
                  controller: _gradeController,
                  focusNode: null,
                ),
                customHeightSizedBox(15),
                CustomTextFormField(
                  headerName: "School",
                  hintText: "Enter your School",
                  prefixIcon: null,
                  postfixIcon: null,
                  controller: _schoolController,
                  focusNode: null,
                ),
                customHeightSizedBox(15),
                CustomTextFormField(
                  headerName: "Province",
                  hintText: "Enter your Province",
                  prefixIcon: null,
                  postfixIcon: null,
                  controller: _provinceController,
                  focusNode: null,
                ),
                customHeightSizedBox(30),

                PrimaryButton(
                    text: "SignUp",
                    press: () {
                      _molzSignUpApiCall();
                    },
                    btnWidth: mediaQCustomWidth(context, width: 0.55)),
                // customHeightSizedBox(mediaQCustomHeight(context, height: 0.2)),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Don’t have an account?",
                //       style: textStyleFranie.copyWith(
                //           fontSize: 12, color: option4Color),
                //     ),
                //     Text(
                //       "SignUp",
                //       style: textStyleFranie.copyWith(
                //           color: option2Color,
                //           fontSize: 12,
                //           fontWeight: FontWeight.w600,
                //           decoration: TextDecoration.underline),
                //     )
                //   ],
                // ),
                // customHeightSizedBox(mediaQCustomHeight(context, height: 0.1)),
                customHeightSizedBox(15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
