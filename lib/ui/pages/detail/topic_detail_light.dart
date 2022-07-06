import 'package:eyepetizer/core/model/topic_detail_light_model.dart';
import 'package:eyepetizer/core/model/topic_detail_tag_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_light_view_model.dart';
import 'package:eyepetizer/ui/shared/KeepAliveWrapper.dart';
import 'package:eyepetizer/ui/shared/app_theme.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:eyepetizer/ui/widgets/detail_widgets/ugc_picture_bean_widget.dart';
import 'package:eyepetizer/ui/widgets/detail_widgets/ugc_video_bean_widget.dart';
import 'package:eyepetizer/ui/widgets/detail_widgets/auto_play_video_bean_for_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLTopicDetailLightPage extends StatefulWidget {
  const ZCLTopicDetailLightPage({Key? key}) : super(key: key);
  static const String routeName = "/topic_detail_light";

  @override
  _ZCLTopicDetailLightPageState createState() => _ZCLTopicDetailLightPageState();
}

class _ZCLTopicDetailLightPageState extends State<ZCLTopicDetailLightPage> {

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ZCLTopicDetailLightViewModel>(
      builder: (ctx, lightVM, widget) {
        return Scaffold(
          appBar: _buildAppbar(),
          body: lightVM.topicDetailLight == null ? Container() :
          ListView.builder(
            controller: _scrollController,
            itemCount: lightVM.topicDetailLight!.itemList!.length + 1 + 1,
            itemBuilder: (ctx, index) {
              if (index == 0) {
                return KeepAliveWrapper(
                  keepAlive: true,
                  child: _buildHeader(lightVM.topicDetailLight!)
                );
              } else if (index == lightVM.topicDetailLight!.itemList!.length + 1) {
                return _buildFooter();
              }
              return _buildPageItem(lightVM.topicDetailLight!.itemList![index-1]);
            }
          ),
        );
      }
    );
  }

  _buildAppbar() {
    return AppBar(
      title: Text("eyepetizer", style: Theme.of(context).textTheme.headline3!.copyWith(fontFamily: ZCLAppTheme.fontFamily), textAlign: TextAlign.center),
      centerTitle: true,
      actions: [
        Icon(Icons.favorite_border_outlined, size: 30.px),
        SizedBox(width: 10.px),
        Icon(Icons.upload_sharp, size: 30.px)
      ],
    );
  }

  _buildHeader(ZCLTopicDetailLight topicDetailLight) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.network(topicDetailLight.headerImage!),
            Positioned(
              bottom: -20.px,
              child: Container(
                width: ZCLSizeFit.screenWidth! - 40.px,
                margin: EdgeInsets.only(left: 20.px),
                color: Colors.white,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10.px),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12)
                  ),
                  child: Text(topicDetailLight.brief!, style: Theme.of(context).textTheme.headline3,)
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.px, 40.px, 20.px, 20.px),
          child: Text(topicDetailLight.text!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black54),),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.px),
          child: Container(height: 5.px, color: Colors.black12),
        )
      ],
    );
  }

  _buildPageItem(ItemList item) {
    Widget widget = Container();
    if (item.type == ItemListType.PICTURE_FOLLOW_CARD || item.type == ItemListType.AUTO_PLAY_FOLLOW_CARD) {
      if (item.data!.dataType == ItemListDataType.FOLLOW_CARD) {
        if (item.data!.content!.type == ContentType.UGC_PICTURE || item.data!.content!.type == ContentType.VIDEO) {
          if (item.data!.content!.data!.dataType ==
              ContentDataType.UGC_PICTURE_BEAN) {
            widget = ZCLUGCPictureBeanWidget(item: item);
          } else if (item.data!.content!.data!.dataType == ContentDataType.UGC_VIDEO_BEAN) {
            widget = ZCLUGCVideoBeanWidget(item: item);
          } else if (item.data!.content!.data!.dataType == ContentDataType.VIDEO_BEAN_FOR_CLIENT) {
            widget = ZCLAutoPlayVideoBeanForClientWidget(item: item);
          }
        }
      }
    }

    return widget;
  }

  _buildFooter() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.px),
      alignment: Alignment.center,
      child: Text("-The End-", style: Theme.of(context).textTheme.headline3!.copyWith(fontFamily: "Lobster"),),
    );
  }
}
