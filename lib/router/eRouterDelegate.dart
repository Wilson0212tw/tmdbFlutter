import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gi_tg/router/navigationCubit.dart';
import 'package:gi_tg/router/navigationStack.dart';
import 'package:gi_tg/router/pageConfig.dart';

class ERouterDelegate extends RouterDelegate<PageConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfig> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<NavigationCubit, NavigationStack>(
        builder: (context, stack) => Navigator(
          pages: stack.pages,
          key: navigatorKey,
          onPopPage: (route, result) => _onPopPage.call(route, result, context),
        ),
      );

  ///here we handle back buttons
  bool _onPopPage(Route<dynamic> route, dynamic result, BuildContext context) {
    if (!route.didPop(result)) return false;
    if (BlocProvider.of<NavigationCubit>(context).canPop()) {
      BlocProvider.of<NavigationCubit>(context).pop();
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> setNewRoutePath(PageConfig configuration) async {
    // if (configuration.route != '/')
    //   _cubit.push(configuration.route, configuration.args);
  }

  // @override
  // PageConfig? get currentConfiguration => _cubit.state.last;

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}
