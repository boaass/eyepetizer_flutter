import 'package:eyepetizer/core/model/ugc_video_detail_model.dart';
import 'package:eyepetizer/core/viewmodel/ugc_video_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/user_center_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/user_center.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:eyepetizer/ui/shared/utils.dart';
import 'package:eyepetizer/ui/widgets/expandable_pageview.dart';
import 'package:eyepetizer/ui/widgets/metro_widgets/search_result_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:video_player/video_player.dart';

class ZCLUgcVideoDetailPage extends StatefulWidget {
  static const String routeName = "/ugc_video_detail";
  const ZCLUgcVideoDetailPage({Key? key}) : super(key: key);

  @override
  _ZCLUgcVideoDetailPageState createState() => _ZCLUgcVideoDetailPageState();
}

class _ZCLUgcVideoDetailPageState extends State<ZCLUgcVideoDetailPage> {

  bool _isPicDetailShow = true;
  VideoPlayerController? _videoController;
  double _progressValue = 0.0;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  _initializeVideoPlayController(String url) {
    if (_videoController?.dataSource != url) {
      if (_videoController != null) {
        _videoController!.dispose();
      }
      _videoController =
      VideoPlayerController.network(url)
        ..initialize().then((value) {
          setState(() {
            _videoController?.setVolume(0);
            _videoController?.play();
            _videoController?.setLooping(true);
          });
        });
      _videoController?.addListener(() {
        setState(() {
          _progressValue = _videoController!.value.position.inSeconds / _videoController!.value.duration.inSeconds;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ZCLUgcVideoDetailViewModel>(
      builder: (ctx, detailVM, child) {
        if (detailVM.ugcVideoDetailModel != null) {
          _initializeVideoPlayController(detailVM.ugcVideoDetailModel!.video!.playUrl!);
        }
        return detailVM.ugcVideoDetailModel == null ? Scaffold(body: Container()) :
        SafeArea(
          child: Scaffold(
              body: detailVM.ugcVideoDetailModel == null ? Container() :
              Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: Colors.black,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: _isPicDetailShow ? 1 : 0,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.maybePop(context);
                                },
                                child: AppBar(
                                  leading: Icon(Icons.arrow_drop_down_circle_rounded, color: Colors.white,),
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              _buildAuthor(detailVM),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPicDetailShow = !_isPicDetailShow;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: AspectRatio(
                                aspectRatio: 3/2,
                                child: VideoPlayer(_videoController!)
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10.px, 20.px, 10.px, 0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    child: _videoController!.value.isPlaying ? Icon(Icons.pause, color: Colors.white,) : Icon(Icons.play_arrow, color: Colors.white),
                                    onTap: () {
                                      _videoController!.value.isPlaying ? _videoController!.pause() : _videoController!.play();
                                    },
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10.px),
                                      child: Slider(
                                        onChanged: (value) {
                                          _videoController!.seekTo(Duration(seconds: (value * _videoController!.value.duration.inSeconds).toInt()));
                                        },
                                        value: _progressValue,
                                        inactiveColor: Colors.white54,
                                        activeColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${ZCLUtils.secondToTimeText(_videoController!.value.position.inSeconds)}/${ZCLUtils.secondToTimeText(_videoController!.value.duration.inSeconds)}",
                                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]
              )
          ),
        );
      },
    );
  }

  _buildAuthor(ZCLUgcVideoDetailViewModel detailVM) {
    return GestureDetector(
      onTap: () {
        Provider.of<ZCLUserCenterNotifier>(context, listen: false).link = detailVM.ugcVideoDetailModel!.author!.uid.toString();
        Navigator.of(context).pushNamed(ZCLUserCenterPage.routeName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                children: [
                  CircleAvatar(foregroundImage: NetworkImage(detailVM.ugcVideoDetailModel!.author!.avatar!.url!)),
                  SizedBox(width: 5.px,),
                  Text(detailVM.ugcVideoDetailModel!.author!.nick!, style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white)),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(5.px))
                        ),
                        padding: EdgeInsets.fromLTRB(7.px, 3.px, 7.px, 3.px),
                        child: Text("私信", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)),
                      ),
                      Container(width: 10.px,),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(5.px))
                        ),
                        padding: EdgeInsets.all(3.px),
                        child: Text("+关注", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)),
                      )
                    ],
                  )
                ]
            ),
            (detailVM.ugcVideoDetailModel!.text == null || detailVM.ugcVideoDetailModel!.text!.isEmpty) ? Container() :
            Padding(
              padding: EdgeInsets.only(top: 10.px),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                        detailVM.ugcVideoDetailModel!.text!,
                        style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.px),
              child: Wrap(
                children: detailVM.ugcVideoDetailModel!.topics!.map((e) => Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(3.px))
                  ),
                  padding: EdgeInsets.all(3.px),
                  child: Text(e.title!),
                )).toList(),
              ),
            ),
            _buildDivider(),
            _buildBottomButton(detailVM.ugcVideoDetailModel!.consumption!),
          ],
        ),
      ),
    );
  }

  _buildDivider() {
    return Container(
      margin: EdgeInsets.only(top: 10.px),
      color: Colors.white,
      height: 1.px,
    );
  }

  _buildBottomButton(Consumption consumption) {
    return Container(
      margin: EdgeInsets.only(top: 10.px),
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionButton(Icons.favorite_border_outlined, consumption.likeCount!.toString()),
          _buildActionButton(Icons.chat_bubble_outline, consumption.collectionCount!.toString()),
          _buildActionButton(Icons.star_border_outlined, "收藏"),
          _buildActionButton(Icons.open_in_new_outlined, ""),
        ],
      ),
    );
  }

  _buildActionButton(IconData icon, String text) {
    return Row(
        children: [
          Icon(icon, color: Colors.grey,),
          SizedBox(width: 5.px,),
          Text(text, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.grey),)
        ]
    );
  }
}
