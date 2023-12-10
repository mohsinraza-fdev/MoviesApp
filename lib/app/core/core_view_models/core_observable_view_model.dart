import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../mixins/core_view_model_base_mixin.dart';

abstract class CoreObservableViewModel extends ReactiveViewModel
    with WidgetsBindingObserver, CoreViewModelBase {
  @override
  initialise() async {
    WidgetsBinding.instance.addObserver(this);
    super.initialise();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
