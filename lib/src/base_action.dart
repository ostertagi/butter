import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';

import 'app_state.dart';
import 'base_dispatcher.dart';
import 'base_navigator.dart';
import 'base_store_utils.dart';
import 'base_ui_model.dart';

class BaseAction extends ReduxAction<AppState> implements BaseDispatcher, BaseNavigator, BaseStoreUtils {
  var _data = {};

  BaseAction();
  BaseAction.build(Map<String, dynamic> data) :
    _data = data
  ;

  @override
  AppState reduce() => state.copyAll(this._data);

  @override
  Model read<Model extends BaseUIModel>(Model defaultModel) =>
    this.store.state.read(defaultModel.$key, defaultModel);

  @override
  Model mutate<Model extends BaseUIModel>(Model defaultModel,
    void Function(Model m) f, [bool overwrite = false]) {
    var d = overwrite ? defaultModel : read(defaultModel).clone();
    f(d);

    return d;
  }
  
  @override
  AppState write<Model extends BaseUIModel>(Model defaultModel, 
    void Function(Model m) f, [bool overwrite = false]) =>
    this.state.copy(
      key: defaultModel.$key,
      value: mutate(defaultModel, f, overwrite),
    );
  
  @deprecated
  dispatchAttribs(Map<String, dynamic> data) => super.dispatch(BaseAction.build(data));

  @override
  dispatchModel<Model extends BaseUIModel>(Model defaultModel, 
    void Function(Model m) f, [bool overwrite = false]) => 
    super.dispatch(BaseAction.build({
      defaultModel.$key: mutate(defaultModel, f, overwrite),
    }));

  @override
  void pop() => dispatch(NavigateAction.pop());

  @override
  void pushNamed(String route, {
    Object arguments,
  }) => dispatch(NavigateAction.pushNamed(route, arguments: arguments));

  @override
  void pushReplacementNamed(String route, {
    Object arguments,
  }) => dispatch(NavigateAction.pushReplacementNamed(route, arguments: arguments));

  @override
  void pushNamedAndRemoveAll(String route, {
    Object arguments,
  }) => dispatch(NavigateAction.pushNamedAndRemoveAll(route, arguments: arguments));

  @override
  void pushNamedAndRemoveUntil(String route, {
    Object arguments,
    RoutePredicate predicate,
  }) => dispatch(NavigateAction.pushNamedAndRemoveUntil(route, 
    arguments: arguments,
    predicate: predicate,
  ));

  @override
  void popUntil(String route) => dispatch(NavigateAction.popUntil(route));

  @override
  void push(Route route, {
    Object arguments,
  }) => dispatch(NavigateAction.push(route, arguments: arguments));
}