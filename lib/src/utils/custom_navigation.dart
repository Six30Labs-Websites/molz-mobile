import 'package:flutter/cupertino.dart';

navigate(context, page) {
  return Navigator.push(
      context, CupertinoPageRoute(builder: (context) => page));
}
// navigate(context, page) {
//   return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
// }

navigateCupertino(context, page) {
  return Navigator.push(
      context, CupertinoPageRoute(builder: (context) => page));
}

navigateReplace(context, page) {
  return Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => page));
}
// navigateReplace(context, page) {
//   return Navigator.pushReplacement(
//       context, MaterialPageRoute(builder: (context) => page));
// }

navigatePagePop(context, page) {
  return Navigator.pop(context, CupertinoPageRoute(builder: (context) => page));
}

navigatePop(context) {
  // return Navigator.of(context).pop();
  return Navigator.maybePop(context);
}
// navigatePop(context, page) {
//   return Navigator.pop(context, MaterialPageRoute(builder: (context) => page));
// }

navigateRemoveAll(context, page) {
  return Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false);
}

navigateOutTab(context, page) {
  return Navigator.of(context, rootNavigator: true)
      .push(CupertinoPageRoute(builder: (context) => page));
}
