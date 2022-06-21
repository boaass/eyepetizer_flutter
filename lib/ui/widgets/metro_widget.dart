import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/viewmodel/video_detail_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/video_detail.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/card_title.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/card_user.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/default_nav.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/default_web.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/feed_cover_large_image.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/feed_cover_large_video.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/feed_cover_small_video.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/feed_item_detail.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/icon_grid.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/more_link.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/normal_text.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/refresh_button.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/rich_text_detail.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/slide_cover_image.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/slide_cover_image_with_footer.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/slide_cover_image_with_title.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/slide_cover_video.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/slide_user.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/stacked_slide_cover_image.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/topic_intro.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/waterfall_cover_small_image.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/waterfall_cover_small_video.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ZCLMetroType {
  feed_cover_large_video,
  slide_cover_image_with_footer,
  feed_cover_small_video,
  feed_cover_large_image,
  feed_item_detail,
  card_title,
  normal_text,
  refresh_button,
  slide_user,
  card_user,
  slide_cover_video,
  slide_cover_image,
  topic_intro,
  rich_text_detail,
  default_nav,
  waterfall_cover_small_image,
  waterfall_cover_small_video,
  more_link,
  slide_cover_image_with_title,
  icon_grid,
  stacked_slide_cover_image,
  default_web
}
class ZCLMetroWidget extends StatefulWidget {

  ZCLMetroType? _metroType;
  final ZCLMetro? model;

  // default_nav 专用
  final Function(int)? onTap;
  final int? navIndex;

  ZCLMetroWidget({Key? key, this.model, this.onTap, this.navIndex = 0}) :
        assert(model != null),
        super(key: key) {
    if (model!.style!.tpl_label == "feed_cover_large_video") {
      _metroType = ZCLMetroType.feed_cover_large_video;
    } else if (model!.style!.tpl_label == "feed_cover_small_video") {
      _metroType = ZCLMetroType.feed_cover_small_video;
    } else if (model!.style!.tpl_label == "slide_cover_image_with_footer") {
      _metroType = ZCLMetroType.slide_cover_image_with_footer;
    } else if (model!.style!.tpl_label == "feed_cover_large_image") {
      _metroType = ZCLMetroType.feed_cover_large_image;
    } else if (model!.style!.tpl_label == "feed_item_detail") {
      _metroType = ZCLMetroType.feed_item_detail;
    } else if (model!.style!.tpl_label == "card_title") {
      _metroType = ZCLMetroType.card_title;
    } else if (model!.style!.tpl_label == "normal_text") {
      _metroType = ZCLMetroType.normal_text;
    } else if (model!.style!.tpl_label == "refresh_button") {
      _metroType = ZCLMetroType.refresh_button;
    } else if (model!.style!.tpl_label == "slide_user") {
      _metroType = ZCLMetroType.slide_user;
    } else if (model!.style!.tpl_label == "card_user") {
      _metroType = ZCLMetroType.card_user;
    } else if (model!.style!.tpl_label == "slide_cover_video") {
      _metroType = ZCLMetroType.slide_cover_video;
    } else if (model!.style!.tpl_label == "slide_cover_image") {
      _metroType = ZCLMetroType.slide_cover_image;
    } else if (model!.style!.tpl_label == "topic_intro") {
      _metroType = ZCLMetroType.topic_intro;
    } else if (model!.style!.tpl_label == "rich_text_detail") {
      _metroType = ZCLMetroType.rich_text_detail;
    } else if (model!.style!.tpl_label == "default_nav") {
      _metroType = ZCLMetroType.default_nav;
    } else if (model!.style!.tpl_label == "waterfall_cover_small_image") {
      _metroType = ZCLMetroType.waterfall_cover_small_image;
    } else if (model!.style!.tpl_label == "waterfall_cover_small_video") {
      _metroType = ZCLMetroType.waterfall_cover_small_video;
    } else if (model!.style!.tpl_label == "more_link") {
      _metroType = ZCLMetroType.more_link;
    } else if (model!.style!.tpl_label == "slide_cover_image_with_title") {
      _metroType = ZCLMetroType.slide_cover_image_with_title;
    } else if (model!.style!.tpl_label == "icon_grid") {
      _metroType = ZCLMetroType.icon_grid;
    } else if (model!.style!.tpl_label == "stacked_slide_cover_image") {
      _metroType = ZCLMetroType.stacked_slide_cover_image;
    } else if (model!.style!.tpl_label == "default_web") {
      _metroType = ZCLMetroType.default_web;
    } else {
      assert(true, "Unknow metro type");
    }
  }

  @override
  _ZCLMetroWidgetState createState() => _ZCLMetroWidgetState();
}

class _ZCLMetroWidgetState extends State<ZCLMetroWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget metroWidget;
    switch (widget._metroType) {
      case ZCLMetroType.feed_cover_large_video:
        metroWidget = ZCLFeedCoverLargeVideo(model: widget.model);
        break;
      case ZCLMetroType.slide_cover_image_with_footer:
        metroWidget = ZCLSlideCoverImageWithFooter(model: widget.model);
        break;
      case ZCLMetroType.feed_cover_small_video:
        metroWidget = ZCLFeedCoverSmallVideo(model: widget.model);
        break;
      case ZCLMetroType.feed_cover_large_image:
        metroWidget = ZCLFeedCoverLargeImage(model: widget.model);
        break;
      case ZCLMetroType.feed_item_detail:
        metroWidget = ZCLFeedItemDetail(model: widget.model);
        break;
      case ZCLMetroType.card_title:
        metroWidget = ZCLCardTitle(model: widget.model);
        break;
      case ZCLMetroType.normal_text:
        metroWidget = ZCLNormalText(model: widget.model);
        break;
      case ZCLMetroType.refresh_button:
        metroWidget = ZCLRefreshButton();
        break;
      case ZCLMetroType.slide_user:
        metroWidget = ZCLSlideUser(model: widget.model);
        break;
      case ZCLMetroType.card_user:
        metroWidget = ZCLCardUser(model: widget.model);
        break;
      case ZCLMetroType.slide_cover_video:
        metroWidget = ZCLSlideCoverVideo(model: widget.model);
        break;
      case ZCLMetroType.slide_cover_image:
        metroWidget = ZCLSlideCoverImage(model: widget.model);
        break;
      case ZCLMetroType.topic_intro:
        metroWidget = ZCLTopicIntro(model: widget.model);
        break;
      case ZCLMetroType.rich_text_detail:
        metroWidget = ZCLRichTextDetail(model: widget.model);
        break;
      case ZCLMetroType.default_nav:
        metroWidget = ZCLDefaultNav(model: widget.model, navIndex: widget.navIndex, onTap: widget.onTap,);
        break;
      case ZCLMetroType.waterfall_cover_small_image:
        metroWidget = ZCLWaterfallCoverSmallImage(model: widget.model!);
        break;
      case ZCLMetroType.waterfall_cover_small_video:
        metroWidget = ZCLWaterfallCoverSmallVideo(model: widget.model!);
        break;
      case ZCLMetroType.more_link:
        metroWidget = ZCLMoreLink(model: widget.model!);
        break;
      case ZCLMetroType.slide_cover_image_with_title:
        metroWidget = ZCLSlideCoverImageWithTitle(model: widget.model!);
        break;
      case ZCLMetroType.icon_grid:
        metroWidget = ZCLIconGrid(model: widget.model!);
        break;
      case ZCLMetroType.stacked_slide_cover_image:
        metroWidget = ZCLStackedSlideCoverImage(model: widget.model!);
        break;
      case ZCLMetroType.default_web:
        metroWidget = ZCLDefaultWeb(model: widget.model!);
        break;
      case null:
        metroWidget = Container();
        break;
    }

    return _buildGestureForWidget(metroWidget);
  }

  _buildGestureForWidget(Widget child) {
    if (widget.model!.type == "video") {
      return GestureDetector(
        onTap: () {
          Provider.of<ZCLVideoDetailNotifier>(context, listen: false).updateVideoId(widget.model!.video_id!);
          // Provider.of<ZCLRecommendViewModel>(context, listen: false).isBigVideoNeedShow = false;
          Navigator.of(context).pushNamed(ZCLVideoDetailPage.routeName);
        },
        child: child,
      );
    } else {
      return child;
    }
  }
}
