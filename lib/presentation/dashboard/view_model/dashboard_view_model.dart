import 'package:ten_twenty_test/app/core/core_view_models/core_view_model.dart';

class DashboardViewModel extends CoreViewModel {
  int currentIndex = 1;

  updateNavIndex(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
