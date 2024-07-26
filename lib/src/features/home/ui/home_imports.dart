import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:molz/src/features/course/data/models/course_detail_model.dart';
import 'package:molz/src/features/course/ui/course_imports.dart';
import 'package:molz/src/features/home/data/models/course_list_model.dart';
import 'package:molz/src/features/home/data/models/offer_list_model.dart';
import 'package:molz/src/features/home/data/models/test_list_model.dart';

import 'package:molz/src/features/home/data/models/user_list_model.dart';

import 'package:molz/src/features/home/ui/home_app_bar.dart';
import 'package:molz/src/features/login/ui/login_imports.dart';
import 'package:flutter/material.dart';
import 'package:molz/src/features/profile/ui/profile_imports.dart';
import 'package:molz/src/features/questions/ui/questions_imports.dart';
import 'package:molz/src/features/test/ui/search_test_screen.dart';
import 'package:molz/src/features/test/ui/test_imports.dart';
import 'package:molz/src/services/api_services.dart';
import 'package:molz/src/services/urls.dart';
import 'package:molz/src/utils/custom_heights.dart';
import 'package:molz/src/utils/custom_navigation.dart';
import 'package:molz/src/utils/custom_toasts.dart';
import 'package:molz/src/utils/logger.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../commons/ui/custom_loader.dart';
import '../../../utils/custom_colors.dart';
import '../../../utils/custom_text_styles.dart';
//import '../data/models/offer_list_model.dart';

part 'home_screen.dart';
