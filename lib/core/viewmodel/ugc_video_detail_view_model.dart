import 'package:eyepetizer/core/model/ugc_video_detail_model.dart';
import 'package:eyepetizer/core/services/ugc_video_detail_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class ZCLUgcVideoDetailNotifier extends ChangeNotifier {
  String _id = "";
  String get id => _id;
  set id(String id) {
    _id = id;
    notifyListeners();
  }
}

class ZCLUgcVideoDetailViewModel extends ZCLBaseViewModel {
  ZCLUgcVideoDetailModel? _ugcVideoDetailModel;

  ZCLUgcVideoDetailModel? get ugcVideoDetailModel => _ugcVideoDetailModel;
  set ugcVideoDetailModel(ZCLUgcVideoDetailModel? ugcVideoDetailModel) {
    _ugcVideoDetailModel = ugcVideoDetailModel;
    notifyListeners();
  }

  ZCLUgcVideoDetailViewModel(String id) {
    Map<String, dynamic> dataMap = {
      "resource_id": id,
      "resource_type": "ugc_video"
    };
    ZCLUgcVideoDetailRequest.getData(dataMap).then((value) {
      ugcVideoDetailModel = value;
    }).catchError((error, stackTrace) {
      print("$error \n $stackTrace");
    });
  }
}