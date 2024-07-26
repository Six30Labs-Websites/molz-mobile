import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:molz/src/commons/ui/primary_button.dart';
import 'package:molz/src/features/home/data/models/test_list_model.dart';
import 'package:molz/src/features/questions/ui/questions_imports.dart';
import 'package:molz/src/features/questions/ui/result_imports.dart';
import 'package:molz/src/features/test/data/models/test_detail_model.dart';
import 'package:molz/src/services/api_services.dart';
import 'package:molz/src/services/urls.dart';
import 'package:molz/src/utils/custom_colors.dart';
import 'package:molz/src/utils/custom_heights.dart';
import 'package:molz/src/utils/custom_navigation.dart';
import 'package:molz/src/utils/custom_text_styles.dart';
import 'package:molz/src/utils/custom_toasts.dart';
import 'package:molz/src/utils/logger.dart';

import '../../../commons/ui/custom_loader.dart';

part 'test_screen.dart';
