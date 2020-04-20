import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:rokpak_mobile/core/base_dispatcher.dart';
import 'package:rokpak_mobile/core/base_navigator.dart';

import 'app_state.dart';

class BaseAction extends ReduxAction<AppState> implements BaseDispatcher, BaseNavigator {
  Map<String, dynamic> data = {};

  BaseAction();
  BaseAction.build(this.data);

  @override
  reduce() {
    return state.copyAll(data);
  }

  dispatchAttribs(Map<String, dynamic> data) => super.dispatch(BaseAction.build(data));

  void pop() => dispatch(NavigateAction.pop());

  void pushNamed(String route, {
    Object arguments,
  }) => dispatch(NavigateAction.pushNamed(route, arguments: arguments));

  void pushReplacementNamed(String route, {
    Object arguments,
  }) => dispatch(NavigateAction.pushReplacementNamed(route, arguments: arguments));

  void pushNamedAndRemoveAll(String route, {
    Object arguments,
  }) => dispatch(NavigateAction.pushNamedAndRemoveAll(route, arguments: arguments));

  void pushNamedAndRemoveUntil(String route, {
    Object arguments,
    RoutePredicate predicate,
  }) => dispatch(NavigateAction.pushNamedAndRemoveUntil(route, 
    arguments: arguments,
    predicate: predicate,
  ));

  void popUntil(String route) => dispatch(NavigateAction.popUntil(route));

  void push(Route route, {
    Object arguments,
  }) => dispatch(NavigateAction.push(route, arguments: arguments));
}