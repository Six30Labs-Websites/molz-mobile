import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_molz/src/commons/ui/primary_button.dart';
import 'package:project_molz/src/features/home/ui/home_app_bar.dart';
import 'package:project_molz/src/features/login/ui/login_imports.dart';
import 'package:flutter/material.dart';
import 'package:project_molz/src/features/questions/data/models/fail_model.dart';
import 'package:project_molz/src/features/questions/data/models/test_answer_model.dart';
import 'package:project_molz/src/features/questions/data/models/test_question_model.dart';
import 'package:project_molz/src/features/questions/ui/result_imports.dart';
import 'package:project_molz/src/features/test/data/models/test_detail_model.dart';
import 'package:project_molz/src/services/api_services.dart';
import 'package:project_molz/src/services/urls.dart';
import 'package:project_molz/src/utils/custom_heights.dart';
import 'package:project_molz/src/utils/custom_navigation.dart';
import 'package:project_molz/src/utils/custom_toasts.dart';
import 'package:project_molz/src/utils/logger.dart';

import '../../../commons/ui/custom_loader.dart';
import '../../../utils/custom_colors.dart';
import '../../../utils/custom_text_styles.dart';

part 'questions_screen.dart';
