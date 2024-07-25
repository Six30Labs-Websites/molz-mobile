import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_molz/src/commons/ui/primary_button.dart';
import 'package:project_molz/src/commons/ui/secondary_button.dart';
import 'package:project_molz/src/features/home/ui/home_imports.dart';
import 'package:project_molz/src/features/questions/data/models/result_model.dart';
import 'package:project_molz/src/features/questions/data/models/result_model_2.dart';
import 'package:project_molz/src/features/results/ui/view_detail_a.dart';
import 'package:project_molz/src/features/results/ui/view_detail_c.dart';
import 'package:project_molz/src/features/results/ui/view_detail_e.dart';
import 'package:project_molz/src/features/results/ui/view_detail_i.dart';
import 'package:project_molz/src/features/results/ui/view_detail_r.dart';
import 'package:project_molz/src/features/results/ui/view_detail_s.dart';
import 'package:project_molz/src/features/test/data/models/test_detail_model.dart';
import 'package:project_molz/src/services/api_services.dart';
import 'package:project_molz/src/services/urls.dart';
import 'package:project_molz/src/utils/custom_colors.dart';
import 'package:project_molz/src/utils/custom_heights.dart';
import 'package:project_molz/src/utils/custom_navigation.dart';
import 'package:project_molz/src/utils/custom_text_styles.dart';
import 'package:project_molz/src/utils/custom_toasts.dart';
import 'package:project_molz/src/utils/logger.dart';

import '../../../commons/ui/custom_loader.dart';

part 'result_screen.dart';
