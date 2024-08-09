part of 'login_imports.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Status _logInWithEmailStatus = Status.idle;
  ButtonState loginBtnState = ButtonState.idle;

  @override
  void initState() {
    super.initState();
    _loadRememberMeStatus();
  }

  Future<void> _loadRememberMeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = prefs.getBool('rememberMe') ?? false;
      if (_rememberMe) {
        _emailController.text = prefs.getString('email') ?? '';
        _passwordController.text = prefs.getString('password') ?? '';
      }
    });
  }

  Future<void> _saveRememberMeStatus() async {
    debug("_saveRememberMeStatus ${_rememberMe}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', _rememberMe);
    if (_rememberMe) {
      await prefs.setString('email', _emailController.text);
      await prefs.setString('password', _passwordController.text);
    } else {
      await prefs.remove('email');
      await prefs.remove('password');
    }
  }

  _molzloginApiCall() {
    debug('molz login Btn Pressed!! ');
    if (_emailController.text.isEmpty) {
      showToastError('Please fill e-mail');
      setState(() {
        _logInWithEmailStatus = Status.error;
      });
    } else if (!emailChecker(_emailController.text)) {
      showToastError('Please enter valid email id!!');
      setState(() {
        _logInWithEmailStatus = Status.error;
      });
    } else if (_passwordController.text.isEmpty) {
      showToastError("Please fill Password !!");
      setState(() {
        _logInWithEmailStatus = Status.error;
      });
    } else {
      ApiCall.post(
        Urls.logInWithEmail,
        body: {
          "login": _emailController.text,
          "password": _passwordController.text,
        },
        success: (success) async {
          //debug(success);
          debug('_molzloginApiCall success');

          try {
            LogInWithEmailModel logInWithEmailModel =
                LogInWithEmailModel.fromJson(jsonDecode(success));

            if (logInWithEmailModel.success == true) {
              await AccountManager.initAccountData();
              await AccountManager.setUserData(logInWithEmailModel);
              await AccountManager.setToken(
                  logInWithEmailModel.data!.accessToken!);
              //navigateCupertino(context, const HomeScreen());
              navigateRemoveAll(context, HomeScreen());

              //navigateRemoveAll(context, HomeScreen());
            } else {
              showToastError(logInWithEmailModel.error);
            }
            //   //navigateCupertino(context, const HomeScreen());
          } catch (e) {
            error(e.toString());
            showToastError("Something went wrong !!");
            setState(() {
              _logInWithEmailStatus = Status.error;
            });
          }
        },
        failure: (fail) {
          debug("_molzloginApiCall fail ----->>>>>>>>>$fail");
          try {
            LogInWithEmailModel logInWithEmailModelData =
                LogInWithEmailModel.fromJson(jsonDecode(fail));

            showToastError(logInWithEmailModelData.error);

            setState(() {
              _logInWithEmailStatus = Status.error;
            });
          } catch (e) {
            error(e.toString());
            showToastError("Something went Wrong !!");
            setState(() {
              _logInWithEmailStatus = Status.error;
            });
          }
        },
        error400: (e4) {
          debug("_nonColliersLoginApiCall e4");
          showToastError("User UnAuthorized !!");
          setState(() {
            _logInWithEmailStatus = Status.error;
          });
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

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: customPadding(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customHeightSizedBox(mediaQCustomHeight(context, height: 0.12)),
              isDarkMode
                  ? SizedBox(
                      height: 59.h,
                      width: 194.w,
                      child: Image.asset(
                        "assets/logos/molz_white.png",
                      ))
                  : SizedBox(
                      height: 59.h,
                      width: 194.w,
                      child: Image.asset(
                        "assets/logos/Asset11.png",
                      )),
              sizeHeight20,
              isDarkMode
                  ? CustomLoginTextFormFieldDark(
                      headerName: "E-mail",
                      hintText: "Your E-mail",
                      prefixIcon: "assets/svg/mail.svg",
                      postfixIcon: null,
                      controller: _emailController,
                      focusNode: null,
                    )
                  : CustomTextFormField(
                      headerName: "E-mail",
                      hintText: "Your E-mail",
                      prefixIcon: "assets/svg/mail.svg",
                      postfixIcon: null,
                      controller: _emailController,
                      focusNode: null,
                    ),
              customHeightSizedBox(20),
              isDarkMode
                  ? CustomPwdFormFieldDark(
                      headerName: "Password",
                      hintText: "Your Password",
                      prefixIcon: "assets/svg/lock.svg",
                      postfixIcon: "assets/svg/eye-off.svg",
                      controller: _passwordController,
                      focusNode: null,
                    )
                  : CustomPwdFormField(
                      headerName: "Password",
                      hintText: "Your Password",
                      prefixIcon: "assets/svg/lock.svg",
                      postfixIcon: "assets/svg/eye-off.svg",
                      controller: _passwordController,
                      focusNode: null,
                    ),
              sizeHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isDarkMode
                          ? Checkbox(
                              activeColor: whiteColor,
                              value: _rememberMe,
                              onChanged: (bool? value) {
                                setState(() {
                                  _rememberMe = value!;
                                  _saveRememberMeStatus();
                                });
                              },
                            )
                          : Checkbox(
                              value: _rememberMe,
                              onChanged: (bool? value) {
                                setState(() {
                                  _rememberMe = value!;
                                  _saveRememberMeStatus();
                                });
                              },
                            ),
                      customWidthSizedBox(4),
                      Text(
                        "Remember Me",
                        style: textStyleFranie.copyWith(
                          fontSize: 10.sp,
                          color: option4Color,
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      navigateCupertino(context, ReqPwdScreen());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: textStyleFranie.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: option6Color,
                      ),
                    ),
                  )
                ],
              ),
              customHeightSizedBox(40),
              isDarkMode
                  ? PrimaryDarkButton(
                      text: "Login",
                      press: () {
                        //navigateCupertino(context, const SignUpScreen());
                        _molzloginApiCall();
                      },
                      btnWidth: mediaQCustomWidth(context, width: 0.55),
                    )
                  : PrimaryButton(
                      text: "Login",
                      press: () {
                        //navigateCupertino(context, const SignUpScreen());
                        _molzloginApiCall();
                      },
                      btnWidth: mediaQCustomWidth(context, width: 0.55),
                    ),
              customHeightSizedBox(mediaQCustomHeight(context, height: 0.1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: textStyleFranie.copyWith(
                      fontSize: 12.sp,
                      color: option4Color,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      navigateCupertino(context, const SignUpScreen());
                    },
                    child: Text(
                      "SignUp",
                      style: textStyleFranie.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: option6Color,
                      ),
                    ),
                  )
                ],
              ),
              customHeightSizedBox(mediaQCustomHeight(context, height: 0.1)),
            ],
          ),
        ),
      ),
    );
  }
}
