import 'dart:convert';

import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:project_molz/src/commons/ui/custom_loader_btn.dart';
import 'package:project_molz/src/features/forgot_pwd/ui/req_pass_screen.dart';
import 'package:project_molz/src/features/home/ui/home_imports.dart';
import 'package:project_molz/src/features/login/data/models/login_with_email_model.dart';
import 'package:project_molz/src/features/login/ui/custom_pwd_form_field.dart';
import 'package:project_molz/src/features/login/ui/custom_text_form_field.dart';
import 'package:project_molz/src/features/signup/ui/signup_imports.dart';
import 'package:project_molz/src/features/walk_through/ui/walk_through_imports.dart';
import 'package:project_molz/src/local_storage/auth_tokens_prefs/shared_prefs.dart';
import 'package:project_molz/src/services/api_services.dart';
import 'package:project_molz/src/services/urls.dart';
import 'package:project_molz/src/utils/constants.dart';
import 'package:project_molz/src/utils/custom_colors.dart';
import 'package:project_molz/src/utils/custom_heights.dart';
import 'package:project_molz/src/utils/custom_navigation.dart';
import 'package:project_molz/src/utils/custom_spaces.dart';
import 'package:project_molz/src/utils/custom_text_styles.dart';
import 'package:project_molz/src/utils/custom_toasts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../commons/ui/primary_button.dart';
import '../../../utils/logger.dart';
part 'login_screen.dart';
