import 'dart:convert';

import 'package:eyepetizer/core/model/ugc_pic_detail_model.dart';
import 'package:eyepetizer/core/services/ugc_pic_detail_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class ZCLUgcPicDetailNotifier extends ChangeNotifier {
  String _id = "";
  String get id => _id;
  set id(String id) {
    _id = id;
    notifyListeners();
  }
}

class ZCLUgcPicDetailViewModel extends ZCLBaseViewModel {
  ZCLUgcPicDetailModel? _ugcPicDetailModel;

  ZCLUgcPicDetailModel? get ugcPicDetailModel => _ugcPicDetailModel;
  set ugcPicDetailModel(ZCLUgcPicDetailModel? ugcPicDetailModel) {
    _ugcPicDetailModel = ugcPicDetailModel;
    notifyListeners();
  }

  ZCLUgcPicDetailViewModel(String id) {
    Map<String, dynamic> dataMap = {
      "resource_id": id,
      "resource_type": "ugc_picture"
    };
    ZCLUgcPicDetailRequest.getData(dataMap).then((value) {
      ugcPicDetailModel = value;
    }).catchError((error, stackTrace) {
      print("$error \n $stackTrace");
    });
  }
}