import 'package:flutter/material.dart';
import 'package:gi_tg/router/pageConfig.dart';
import 'package:gi_tg/view/home/home.dart';
import 'package:gi_tg/view/login.dart';

// typedef TransitionAnimationBuilder = Widget Function(
//   BuildContext,
//   Animation<double>,
//   Animation<double>,
//   Widget,
// );

typedef PageBuilder = Widget Function(BuildContext ctx);

// class EPage extends Page {
//   final PageBuilder pageBuilder;
//   final int transitionDuration, reverseTransitionDuration;

//   final TransitionAnimationBuilder? animationBuilder;

//   const EPage({
//     required this.pageBuilder,
//     this.transitionDuration = 400,
//     this.reverseTransitionDuration = 400,
//     this.animationBuilder,
//   });

//   Widget build(BuildContext context) => pageBuilder(context);

//   @override
//   Route createRoute(BuildContext context) => PageRouteBuilder<dynamic>(
//         transitionDuration: Duration(milliseconds: transitionDuration),
//         reverseTransitionDuration:
//             Duration(milliseconds: reverseTransitionDuration),
//         transitionsBuilder: (
//           context,
//           animation,
//           secondaryAnimation,
//           child,
//         ) =>
//             _defaultAnimationBuilder(
//           context,
//           animation,
//           secondaryAnimation,
//           child,
//         ),
//         pageBuilder: (
//           BuildContext context,
//           Animation<double> animation,
//           Animation<double> animation2,
//         ) =>
//             build(context),
//       );

//   Widget _defaultAnimationBuilder(
//           BuildContext context,
//           Animation<double> animation,
//           Animation<double> secondaryAnimation,
//           Widget child) =>
//       animationBuilder?.call(
//         context,
//         animation,
//         secondaryAnimation,
//         child,
//       ) ??
//       SlideTransition(
//         position: animation.drive(
//             Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
//                 .chain(CurveTween(curve: Curves.elasticIn))),
//         child: child,
//       );
// }

class EPage extends Page {
  final PageBuilder pageBuilder;

  const EPage(this.pageBuilder);

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => pageBuilder(context),
    );
  }
}
