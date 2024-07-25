import 'dart:convert';

import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:project_molz/src/commons/ui/primary_button.dart';
import 'package:project_molz/src/features/forgot_pwd/ui/req_pass_screen.dart';
import 'package:project_molz/src/features/home/ui/home_imports.dart';
import 'package:project_molz/src/features/login/ui/login_imports.dart';
import 'package:project_molz/src/features/signup/data/models/signup_with_email_model.dart';
import 'package:project_molz/src/features/signup/ui/custom_pwd_form_field.dart';
import 'package:project_molz/src/features/signup/ui/custom_text_form_field.dart';
import 'package:project_molz/src/features/walk_through/ui/swipable_page.dart';
import 'package:project_molz/src/features/walk_through/ui/walk_through_imports.dart';
import 'package:project_molz/src/services/api_services.dart';
import 'package:project_molz/src/services/urls.dart';
import 'package:project_molz/src/utils/custom_colors.dart';
import 'package:project_molz/src/utils/custom_heights.dart';
import 'package:project_molz/src/utils/custom_navigation.dart';
import 'package:project_molz/src/utils/custom_spaces.dart';
import 'package:project_molz/src/utils/custom_text_styles.dart';
import 'package:project_molz/src/utils/custom_toasts.dart';

import '../../../utils/logger.dart';
part 'signup_screen.dart';
