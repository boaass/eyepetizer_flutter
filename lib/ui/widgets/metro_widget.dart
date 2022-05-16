import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:eyepetizer/ui/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:video_player/video_player.dart';

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
  slide_cover_image
}
class ZCLMetroWidget extends StatefulWidget {

  ZCLMetroType? _metroType;
  final ZCLMetro? model;

  ZCLMetroWidget({Key? key, this.model}) :
        assert(model != null),
        super(key: key) {
    if (model!.style!.tpl_label == "feed_cover_large_video") {
      _metroType = ZCLMetroType.feed_cover_large_video;
    } else if (model!.style!.tpl_label == "feed_cover_small_video" ) {
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
    } else {
      assert(true, "Unknow metro type");
    }
  }

  @override
  _ZCLMetroWidgetState createState() => _ZCLMetroWidgetState();
}

class _ZCLMetroWidgetState extends State<ZCLMetroWidget> {
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();

    _initializeVideoPlayController();
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  _initializeVideoPlayController() {

    if (widget.model!.autoplay == true) {
      if (_videoController?.dataSource != widget.model!.play_url!) {
        if (_videoController != null) {
          _videoController!.dispose();
        }
        _videoController =
        VideoPlayerController.network(widget.model!.play_url!)
          ..initialize().then((value) {
            setState(() {
              _videoController?.setVolume(0);
              _videoController?.play();
            });
          });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _initializeVideoPlayController();
    switch (widget._metroType) {
      case ZCLMetroType.feed_cover_large_video:
        return _buildFeedCoverLargeVideo();
      case ZCLMetroType.slide_cover_image_with_footer:
        return _buildSlideCoverImageWithFooter();
      case ZCLMetroType.feed_cover_small_video:
        return _buildFeedCoverSmallVideo();
      case ZCLMetroType.feed_cover_large_image:
        return _buildFeedCoverLargeImage();
      case ZCLMetroType.feed_item_detail:
        return _buildFeedItemDetail();
      case ZCLMetroType.card_title:
        return _buildCardTitle();
      case ZCLMetroType.normal_text:
        return _buildNormalText();
      case ZCLMetroType.refresh_button:
        return _buildRefreshButton();
      case ZCLMetroType.slide_user:
        return _buildSlideUser();
      case ZCLMetroType.card_user:
        return _buildCardUser();
      case ZCLMetroType.slide_cover_video:
        return _buildSlideCoverVideo();
      case ZCLMetroType.slide_cover_image:
        return _buildSlideCoverImage();
      case null:
        return Container();
    }
  }

  _buildFeedCoverLargeVideo() {
    return Container(
      key: widget.model!.stickyKey,
      child: Column(
        children: [
          _buildFeedCoverLargeVideoBody(),
          widget.model!.videoPlayerAspectRatio! == 0 ? _buildFeedCoverLargeVideoFooter(Colors.black, Colors.black54) : Container(),
          widget.model!.videoPlayerAspectRatio! != 0 ? Padding(
            padding: EdgeInsets.fromLTRB(0, 20.px, 0, 10.px),
            child: Image.asset("lib/res/images/staff_pick.png")) : Container(),
          _buildDivider()
        ],
      ),
    );
  }

  _buildFeedCoverLargeVideoBody() {
    if (widget.model?.autoplay == true) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          _videoController!.value.isInitialized ? AspectRatio(
              aspectRatio: (widget.model!.videoPlayerAspectRatio! == 0) ? _videoController!.value.aspectRatio : widget.model!.videoPlayerAspectRatio!,
              child: VideoPlayer(_videoController!)
            ) : Image.network(widget.model!.cover!
          ),
          // Icon(Icons.play_arrow, color: Colors.white, size: 60.px,),
          widget.model!.duration!.text == "" ? Container() : Positioned(
              bottom: 10.px,
              right: 10.px,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.px),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, ),
                  borderRadius: BorderRadius.circular(15.px),
                ),
                child: Text(widget.model!.duration!.text!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),),
              )
          ),
          Positioned(
              left: 10.px,
              top: 10.px,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _videoController!.setVolume(_videoController!.value.volume == 0 ? 1 : 0);
                  });
                },
                child: (_videoController!.value.isInitialized && (_videoController!.value.volume) != 0) ?
                Icon(Icons.volume_up, color: Colors.white,) :
                Icon(Icons.volume_off, color: Colors.white,),
              )
          ),
          widget.model!.videoPlayerAspectRatio! == 0 ? Container() : Positioned(left: 0, right: 0, bottom: 10.px, child: _buildFeedCoverLargeVideoFooter(Colors.white, Colors.white))
        ],
      );
    } else {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.network(widget.model!.cover!),
          Icon(Icons.play_arrow, color: Colors.white, size: 60.px,),
          Positioned(
              bottom: 10.px,
              right: 10.px,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.px),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, ),
                  borderRadius: BorderRadius.circular(15.px),
                ),
                child: Text(widget.model!.duration!.text!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),),
              )
          ),
        ],
      );
    }
  }

  _buildFeedCoverLargeVideoFooter(Color titleColor, Color subTitleColor) {
    return Container(
        padding: EdgeInsets.fromLTRB(10.px, 5.px, 10.px, 5.px),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            foregroundImage: NetworkImage(widget.model!.author!.avatar!),
          ),
          title: Text(widget.model!.title!, style: Theme
              .of(context)
              .textTheme
              .headline4!.copyWith(color: titleColor),),
          subtitle: Text(
              "${widget.model!.author!.nick} ${widget.model!.tags!.join(" ")}",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: subTitleColor)),
        )
    );
  }

  _buildDivider() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10.px, 0, 0),
      color: Colors.black54,
      height: 1.px,
    );
  }

  _buildSlideCoverImageWithFooter() {
    return Container(
      padding: EdgeInsets.fromLTRB(2.px, 0, 2.px, 0),
      child: Image.network(widget.model!.cover!),
    );
  }

  _buildFeedCoverSmallVideo(){
    return Container(
      margin: EdgeInsets.all(10.px),
      height: 120.px,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54)
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(widget.model!.cover!),
              Icon(Icons.play_arrow, color: Colors.white, size: 60.px,),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10.px, 5.px, 10.px, 5.px),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model!.title!,
                    style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.model!.tags!.join(" ")}",
                        style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54)
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.px),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54, ),
                          borderRadius: BorderRadius.circular(15.px),
                        ),
                        child: Text(widget.model!.duration!.text!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black54),),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildFeedCoverLargeImage() {
    return Container(
      child: Column(
        children: [
          Image.network(widget.model!.cover!),
        ],
      ),
    );
  }

  _buildFeedItemDetail() {
    return Container(
      padding: EdgeInsets.fromLTRB(10.px, 15.px, 10.px, 2.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              foregroundImage: NetworkImage(widget.model!.author!.avatar!),
            ),
            title: Text(widget.model!.author!.nick!, style: Theme
                .of(context)
                .textTheme
                .headline4,),
            subtitle: Text(
                widget.model!.publish_time!,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.black54)),
            trailing: Icon(Icons.add_box, color: Colors.black, size: 30.px,),
          ),
          Row(
            children: widget.model!.topics!.map((e) => GestureDetector(
              onTap: (){
                // todo: 跳转 topic 详情页
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(5.px, 1.px, 5.px, 1.px),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10.px)
                ),
                child: Text(e.title!, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),)
              )
            )).toList(),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.px),
            child: Image.network(widget.model!.video!.cover!)
          ),
          Container(
            padding: EdgeInsets.only(top: 5.px),
            child: ExpandableText(
              text: widget.model!.text,
              maxLines: 3,
              style: Theme.of(context).textTheme.headline4,
              expand: false,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildFooterItem(Icons.thumb_up_alt_outlined, widget.model!.consumption!.like_count!),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.px),
                      child: _buildFooterItem(Icons.star_border_outlined, widget.model!.consumption!.collection_count!)
                    ),
                    _buildFooterItem(Icons.messenger_outline_rounded, widget.model!.consumption!.comment_count!),
                  ],
                ),
                Icon(Icons.add_to_home_screen_outlined)
              ],
            ),
          ),
          _buildDivider()
        ],
      )
    );
  }

  _buildFooterItem(IconData icon, int count) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 5.px,),
        Text(count.toString())
      ]
    );
  }

  _buildCardTitle() {
    return Text(widget.model!.text!, style: Theme.of(context).textTheme.headline2!);
  }

  _buildNormalText() {
    return Text(widget.model!.text!, style: Theme.of(context).textTheme.headline4!);
  }

  _buildRefreshButton() {
    return Icon(Icons.refresh_outlined, size: 25.px,);
  }

  _buildSlideUser() {
    return Container(
      padding: EdgeInsets.only(top: 10.px),
      width: ZCLSizeFit.screenWidth!/3.5,
      decoration: BoxDecoration(
        border: Border.all(width: 1.px, color: Colors.black54)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(widget.model!.avatar!.url!),
          ),
          Text(widget.model!.nick!, style: Theme.of(context).textTheme.headline5, textAlign: TextAlign.center,),
          Text("${widget.model!.follow_count}关注|${widget.model!.fans_count}粉丝", style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54),),
          // widget.model!.followed! ?
          Container(
            width: double.maxFinite,
            color: Colors.black,
            child: Icon(Icons.add, color: Colors.white,),
          )
        ],
      ),
    );
  }

  _buildCardUser() {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(foregroundImage: NetworkImage(widget.model!.avatar!.url!),),
          title: Text(widget.model!.nick!, style: Theme.of(context).textTheme.headline4!),
          subtitle: Text(widget.model!.description!, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54),),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.px),
          child: _buildDivider(),
        )
      ]
    );
  }

  _buildSlideCoverVideo() {
    return Container(
      padding: EdgeInsets.only(top: 10.px),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _videoController!.value.isInitialized ?
          AspectRatio(
            aspectRatio: _videoController!.value.aspectRatio,
            child: VideoPlayer(_videoController!,))
          : Image.network(widget.model!.cover!),
          Icon(Icons.play_arrow, color: Colors.white,)
        ]
      )
    );
  }

  _buildSlideCoverImage() {
    return Container(
      padding: EdgeInsets.only(top: 10.px),
      child: Image.network(widget.model!.cover!)
    );
  }
}
