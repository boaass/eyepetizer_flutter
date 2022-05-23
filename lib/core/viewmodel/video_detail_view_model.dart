import 'package:eyepetizer/core/model/video_bean_model.dart';
import 'package:eyepetizer/core/model/video_related_model.dart';
import 'package:eyepetizer/core/model/video_replies_model.dart';
import 'package:eyepetizer/core/services/video_bean_request.dart';
import 'package:eyepetizer/core/services/video_related_request.dart';
import 'package:eyepetizer/core/services/video_reply_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';
import 'package:flutter/material.dart';

class ZCLVideoDetailNotifier extends ChangeNotifier {
  String _videoId = "0";

  String get videoId => _videoId;

  set videoId(String id) {
    _videoId = id;
    notifyListeners();
  }

  updateVideoId(String id) {
    videoId = id;
  }
}

class ZCLVideoDetailViewModel extends ZCLBaseViewModel {
  ZCLVideoBean? _videoBeanModel;
  ZCLVideoBean? get videoBeanModel => _videoBeanModel;
  set videoBeanModel(ZCLVideoBean? model) {
    _videoBeanModel = model;
    notifyListeners();
  }

  ZCLVideoReply? _videoReplyModel;
  ZCLVideoReply? get videoReplyModel => _videoReplyModel;
  set videoReplyModel(ZCLVideoReply? model) {
    _videoReplyModel = model;
    notifyListeners();
  }

  ZCLVideoRelated? _videoRelatedModel;
  ZCLVideoRelated? get videoRelatedModel => _videoRelatedModel;
  set videoRelatedModel(ZCLVideoRelated? model) {
    _videoRelatedModel = model;
    notifyListeners();
  }

  updateVideoReply(String url) {
    ZCLVideoReplyRequest.updateData(url).then((value) {
      videoReplyModel!.itemList!.addAll(value.itemList!);
      videoReplyModel!.nextPageUrl = value.nextPageUrl;
      notifyListeners();
    }).catchError((error, stackTrace) {
      print("$error \n $stackTrace");
    });
  }

  ZCLVideoDetailViewModel(String videoId) {
    ZCLVideoBeanRequest.getData(videoId).then((value) {
      // print("zcl --- videoBeanModel: ${value.toJson()}");
      videoBeanModel = value;
      return videoBeanModel;
    }).catchError((error, stackTrace) {
      print("$error \n $stackTrace");
      return videoBeanModel;
    });

    ZCLVideoReplyRequest.getData(videoId).then((value) {
      // print("zcl --- videoReplyModel: ${value.toJson()}");
      videoReplyModel = value;
      return videoReplyModel;
    }).catchError((error, stackTrace) {
      print("$error \n $stackTrace");
      return videoReplyModel;
    });

    ZCLVideoRelatedRequest.getData(videoId).then((value) {
      // print("zcl --- videoRelatedModel: ${value.toJson()}");
      videoRelatedModel = value;
      return videoRelatedModel;
    }).catchError((error, stackTrace) {
      print("$error \n $stackTrace");
      return videoRelatedModel;
    });
  }
}