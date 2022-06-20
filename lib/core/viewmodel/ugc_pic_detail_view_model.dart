import 'dart:convert';

import 'package:eyepetizer/core/model/ugc_pic_detail_model.dart';
import 'package:eyepetizer/core/services/ugc_pic_detail_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';


class ZCLUgcPicDetailViewModel extends ZCLBaseViewModel {
  ZCLUgcPicDetailModel? _ugcPicDetailModel;

  ZCLUgcPicDetailModel? get ugcPicDetailModel => _ugcPicDetailModel;
  set ugcPicDetailModel(ZCLUgcPicDetailModel? ugcPicDetailModel) {
    _ugcPicDetailModel = ugcPicDetailModel;
    notifyListeners();
  }

  ZCLUgcPicDetailViewModel(String link) {
    if (!link.contains("ugc/detail?")) {
      return;
    }
    String str = link.split("ugc/detail?").last;
    Map<String, dynamic> dataMap = new Map.fromIterable(str.split("&"), key: (item) => item.split("=").first, value: (item) => item.split("=").last);
    ZCLUgcPicDetailRequest.getData(dataMap).then((value) {
      ugcPicDetailModel = value;
    }).catchError((error, stackTrace) {
      print("$error \n $stackTrace");
    });
  }
}