import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:molz/src/commons/ui/primary_button.dart';
import 'package:molz/src/commons/ui/primary_button_dark.dart';
import 'package:molz/src/features/home/ui/home_app_bar.dart';
import 'package:molz/src/features/login/ui/login_imports.dart';
import 'package:flutter/material.dart';
import 'package:molz/src/features/questions/data/models/fail_model.dart';
import 'package:molz/src/features/questions/data/models/test_answer_model.dart';
import 'package:molz/src/features/questions/data/models/test_question_model.dart';
import 'package:molz/src/features/questions/ui/result_imports.dart';
import 'package:molz/src/features/test/data/models/test_detail_model.dart';
import 'package:molz/src/services/api_services.dart';
import 'package:molz/src/services/urls.dart';
import 'package:molz/src/utils/custom_heights.dart';
import 'package:molz/src/utils/custom_navigation.dart';
import 'package:molz/src/utils/custom_toasts.dart';
import 'package:molz/src/utils/logger.dart';

import '../../../commons/ui/custom_loader.dart';
import '../../../utils/custom_colors.dart';
import '../../../utils/custom_text_styles.dart';

part 'questions_screen.dart';
