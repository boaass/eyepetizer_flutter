import 'package:eyepetizer/core/model/topic_detail_light_model.dart';
import 'package:eyepetizer/core/services/topic_detail_light_request.dart';
import 'package:eyepetizer/core/viewmodel/base_view_model.dart';

class ZCLTopicDetailLightViewModel extends ZCLBaseViewModel {
  ZCLTopicDetailLight? _topicDetailLight;

  ZCLTopicDetailLight? get topicDetailLight => _topicDetailLight;
  set topicDetailLight(ZCLTopicDetailLight? topicDetailLight) {
    _topicDetailLight = topicDetailLight;
    notifyListeners();
  }

  ZCLTopicDetailLightViewModel(String link) {
    if (!link.startsWith("eyepetizer://lightTopic")) {
      return;
    }
    String id = link.split("?").first.split("/").last;
    ZCLTopicDetailLightRequest.getData(id).then((value) {
      topicDetailLight = value;
    }).onError((error, stackTrace) {
      print("$error \n $stackTrace");
    });
  }
}