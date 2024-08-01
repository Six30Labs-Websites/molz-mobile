// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mithram_app/src/utils/custom_colors.dart';
// import 'package:mithram_app/src/utils/custom_navigation.dart';
//
// class CommonAppbar extends StatelessWidget with PreferredSizeWidget{
//   const CommonAppbar({required this.title, Key? key}) : super(key: key);
//
//   @override
//   final Size preferredSize = const Size.fromHeight(55.0);
//
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: InkWell(
//         onTap: (){
//           navigatePop(context);
//         },
//         child: Padding(
//           padding: const EdgeInsets.only(left: 15.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SvgPicture.asset("assets/svgs/appbar_left_vector.svg", fit: BoxFit.fill),
//               SvgPicture.asset("assets/svgs/appbar_right_vector.svg", fit: BoxFit.fill),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: kBlackColor,
//       centerTitle: true,
//       title: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
//     );
//   }
// }
