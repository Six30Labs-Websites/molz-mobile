import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/custom_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key, this.size = 55.0, this.color = option1Color})
      : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 1),(){
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content:
    //         Text("title",
    //             style: TextStyle(
    //               // fontFamily: "Constantia",
    //               fontSize: 14,
    //               fontWeight: FontWeight.w400,
    //             )
    //         ),
    //         backgroundColor: kContentColorLightTheme,
    //       ));
    // });

    return Center(
      child: SpinKitThreeInOut(
          size: size,
          // duration: const Duration(milliseconds: 500),
          delay: const Duration(milliseconds: 100),
          itemBuilder: (_, index) {
            return DecoratedBox(
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: index == 0
                  ? option1Color
                  : index == 1
                      ? option2Color
                      : index == 3
                          ? option3Color
                          : option1Color,
            ));
          }),
    );
  }
}

class CustomLoader2 extends StatelessWidget {
  const CustomLoader2({Key? key, this.size = 55.0, this.color = option1Color})
      : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 1),(){
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content:
    //         Text("title",
    //             style: TextStyle(
    //               // fontFamily: "Constantia",
    //               fontSize: 14,
    //               fontWeight: FontWeight.w400,
    //             )
    //         ),
    //         backgroundColor: kContentColorLightTheme,
    //       ));
    // });

    return Center(
      child: SpinKitChasingDots(
          size: size,
          // duration: const Duration(milliseconds: 500),
          // delay: const Duration(milliseconds: 100),
          itemBuilder: (_, index) {
            return DecoratedBox(
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: color,
              // color: index == 0
              //     ? option1Color
              //     : index == 1
              //     ? option2Color
              //     : index == 3
              //     ? option3Color
              //     : option1Color,
            ));
          }),
    );
  }
}
