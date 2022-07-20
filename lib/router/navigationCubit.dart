import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gi_tg/router/navigationStack.dart';
import 'package:gi_tg/router/pageConfig.dart';
import 'package:gi_tg/view/ePage.dart';

class NavigationCubit extends Cubit<NavigationStack> {
  NavigationCubit(List<PageConfig> initialPages)
      : super(NavigationStack(initialPages));

  void push(String path, [Map<String, dynamic>? args]) {
    print('push called with $path and $args');
    PageConfig config = PageConfig(location: path, args: args);
    emit(state.push(config));
  }

  void pushPage(PageConfig config) {
    emit(state.push(config));
  }

  void clearAndPush(String path, [Map<String, dynamic>? args]) {
    PageConfig config = PageConfig(location: path, args: args);
    emit(state.clearAndPush(config));
  }

  void pop() {
    emit(state.pop());
  }

  bool canPop() {
    return state.canPop();
  }

  void pushBeneathCurrent(String path, [Map<String, dynamic>? args]) {
    final PageConfig config = PageConfig(location: path, args: args);
    emit(state.pushBeneathCurrent(config));
  }
}
