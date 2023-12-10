import 'package:stacked/stacked.dart';

import '../mixins/core_view_model_base_mixin.dart';

abstract class CoreView<T extends CoreViewModelBase> extends StackedView<T> {
  const CoreView({super.key});

  @override
  void onViewModelReady(T viewModel) {
    viewModel.initialise();
    super.onViewModelReady(viewModel);
  }
}
