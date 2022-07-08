import 'package:eyepetizer/core/services/privacy_protection_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';

class ZCLInitialViewModel extends ZCLBaseViewModel {

  String? _data;

  set data(String? data) {
    _data = data;
    notifyListeners();
  }
  String? get data => _data;

  ZCLInitialViewModel() {
    ZCLPrivacyProtectionRequest.getData().then((value) {
      data = value;
    }).onError((error, stackTrace) {
      print("$error \n $stackTrace");
    });
  }
}