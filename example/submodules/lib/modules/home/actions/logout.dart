import 'package:butter/butter.dart';

import 'package:submodules/modules/init/models/init_model.dart';

import '../models/home_model.dart';

class LogoutAction extends BaseAction {
  // Make sure to strictly follow the guidelines found here:
  // https://pub.dev/packages/async_redux/#async-reducer
  @override
  AppState reduce() {
    dispatchModel<HomeModel>(HomeModel(), (m) {
      m.initialized = false;
    });

    dispatchModel<InitModel>(InitModel(), (m) {
      m.hasInitialized = false;
    });

    pushNamedAndRemoveAll('/init');
    return null;
  }
}
