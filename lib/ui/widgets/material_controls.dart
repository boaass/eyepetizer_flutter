import 'dart:async';

import 'package:chewie/src/chewie_player.dart';
import 'package:chewie/src/chewie_progress_colors.dart';
import 'package:chewie/src/material_progress_bar.dart';
import 'package:chewie/src/utils.dart';
import 'package:eyepetizer/ui/pages/main/main.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class KYMaterialControls extends StatefulWidget {
  const KYMaterialControls({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _KYMaterialControlsState();
  }
}

class _KYMaterialControlsState extends State<KYMaterialControls> {
  VideoPlayerValue? _latestValue;
  double? _latestVolume;
  bool _hideStuff = true;
  Timer? _hideTimer;
  Timer? _initTimer;
  Timer? _showAfterExpandCollapseTimer;
  bool _dragging = false;
  bool _displayTapped = false;
  double dragValue = 0;

  final barHeight = 48.0;
  final marginSize = 5.0;

  VideoPlayerController? controller;
  ChewieController? chewieController;

  @override
  Widget build(BuildContext context) {
    if (_latestValue!.hasError) {
      return chewieController!.errorBuilder != null
          ? chewieController!.errorBuilder!(
        context,
        chewieController!.videoPlayerController.value.errorDescription!,
      )
          : Center(
        child: Icon(
          Icons.error,
          color: Colors.white,
          size: 42,
        ),
      );
    }
    ///添加滑动手势处理  以及顶部退出按钮啥的
    return MouseRegion(
      onHover: (_) {
        _cancelAndRestartTimer();
      },
      child: GestureDetector(
        onHorizontalDragUpdate: (detail) {
          print('${detail.delta.dx}');
          dragValue += detail.delta.dx / 2;
        },
        onHorizontalDragEnd: (detail) {
          print(dragValue);
          controller!.seekTo(Duration(seconds: controller!.value.position.inSeconds + dragValue.floor()));
          isShowProgressRate(false);
        },
        onHorizontalDragStart: (details) {
          dragValue = 0;
          isShowProgressRate(true);
        },
        onTap: () => _cancelAndRestartTimer(),
        child: AbsorbPointer(
          absorbing: _hideStuff,
          child: Column(
            children: <Widget>[
              _buildTopBar(context),
              buildProgressRate(),
              _latestValue != null &&
                  !_latestValue!.isPlaying &&
                  _latestValue!.duration == null ||
                  _latestValue!.isBuffering
                  ? const Expanded(
                child: const Center(
                  child: const CircularProgressIndicator(),
                ),
              )
                  : _buildHitArea(),
              _buildBottomBar(context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _dispose() {
    controller!.removeListener(_updateState);
    _hideTimer?.cancel();
    _initTimer?.cancel();
    _showAfterExpandCollapseTimer?.cancel();
  }

  @override
  void didChangeDependencies() {
    final _oldController = chewieController;
    chewieController = ChewieController.of(context);
    controller = chewieController!.videoPlayerController;

    if (_oldController != chewieController) {
      _dispose();
      _initialize();
    }

    super.didChangeDependencies();
  }

  ///创建顶部返回按钮
  AnimatedOpacity _buildTopBar(BuildContext context,) {
    final iconColor = Theme
        .of(context)
        .textTheme
        .button!
        .color;


    return AnimatedOpacity(
      opacity: _hideStuff ? 0.0 : 1.0,
      duration: Duration(milliseconds: 300),
      child: Container(color: Colors.black38, width: double.infinity, height: 48, child: Row(children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).maybePop();
            // Navigator.of(context).pushNamedAndRemoveUntil(ZCLMainPage.routeName, (route) => false);
//        chewieController.toggleFullScreen();
          }, child: Padding(child: Icon(Icons.arrow_back, color: Colors.white,),
          padding: EdgeInsets.symmetric(horizontal: 10),),),
        // Text('${chewieController.}', style: TextStyle(color: Colors.white,),)
      ],),),
    );
  }

  ///底部状态栏高度,修改了下透明度
  AnimatedOpacity _buildBottomBar(BuildContext context,) {
    final iconColor = Theme
        .of(context)
        .textTheme
        .button!
        .color;
    return AnimatedOpacity(
      opacity: _hideStuff ? 0.0 : 1.0,
      duration: Duration(milliseconds: 500),
      child: Container(
        height: barHeight,
        color: Colors.black38,
        child: Row(
          children: <Widget>[
            _buildPlayPause(controller!),
            chewieController!.isLive ? Expanded(child: const Text('LIVE')) : _buildPosition(iconColor!),
            chewieController!.isLive ? const SizedBox() : _buildProgressBar(),
            chewieController!.allowMuting ? _buildMuteButton(controller!) : Container(),
            chewieController!.allowFullScreen ? _buildExpandButton() : Container(),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildExpandButton() {
    return GestureDetector(
      onTap: _onExpandCollapse,
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: Duration(milliseconds: 300),
        child: Container(
          height: barHeight,
          margin: EdgeInsets.only(right: 12.0),
          padding: EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Center(
            child: Icon(
              chewieController!.isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen
              , color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildHitArea() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (_latestValue != null && _latestValue!.isPlaying) {
            if (_displayTapped) {
              setState(() {
                _hideStuff = true;
              });
            } else
              _cancelAndRestartTimer();
          } else {
            _playPause();

            setState(() {
              _hideStuff = true;
            });
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: AnimatedOpacity(
              opacity:
              _latestValue != null && !_latestValue!.isPlaying && !_dragging
                  ? 1.0
                  : 0.0,
              duration: Duration(milliseconds: 300),
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .dialogBackgroundColor,
                    borderRadius: BorderRadius.circular(48.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.play_arrow, size: 32.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  GestureDetector _buildMuteButton(VideoPlayerController controller,) {
    return GestureDetector(
      onTap: () {
        _cancelAndRestartTimer();

        if (_latestValue!.volume == 0) {
          controller.setVolume(_latestVolume ?? 0.5);
        } else {
          _latestVolume = controller.value.volume;
          controller.setVolume(0.0);
        }
      },
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: Duration(milliseconds: 300),
        child: ClipRect(
          child: Container(
            child: Container(
              height: barHeight,
              padding: EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Icon(
                (_latestValue != null && _latestValue!.volume > 0) ? Icons.volume_up : Icons.volume_off,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildPlayPause(VideoPlayerController controller) {
    return GestureDetector(
      onTap: _playPause,
      child: Container(
        height: barHeight,
        color: Colors.transparent,
        margin: EdgeInsets.only(left: 8.0, right: 4.0),
        padding: EdgeInsets.only(
          left: 12.0,
          right: 12.0,
        ),
        child: Icon(
          controller.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPosition(Color iconColor) {
    final position = _latestValue != null && _latestValue!.position != null
        ? _latestValue!.position
        : Duration.zero;
    final duration = _latestValue != null && _latestValue!.duration != null
        ? _latestValue!.duration
        : Duration.zero;

    return Padding(
      padding: EdgeInsets.only(right: 24.0),
      child: Text(
        '${formatDuration(position)} / ${formatDuration(duration)}',
        style: TextStyle(
            fontSize: 14.0,
            color: Colors.white
        ),
      ),
    );
  }

  void _cancelAndRestartTimer() {
    _hideTimer?.cancel();
    _startHideTimer();

    setState(() {
      _hideStuff = false;
      _displayTapped = true;
    });
  }

  Future<Null> _initialize() async {
    controller!.addListener(_updateState);

    _updateState();

    if ((controller!.value != null && controller!.value.isPlaying) ||
        chewieController!.autoPlay) {
      _startHideTimer();
    }

    if (chewieController!.showControlsOnInitialize) {
      _initTimer = Timer(Duration(milliseconds: 200), () {
        setState(() {
          _hideStuff = false;
        });
      });
    }
  }

  void _onExpandCollapse() {
    setState(() {
      _hideStuff = true;

      chewieController!.toggleFullScreen();
      _showAfterExpandCollapseTimer = Timer(Duration(milliseconds: 300), () {
        setState(() {
          _cancelAndRestartTimer();
        });
      });
    });
  }

  void _playPause() {
    bool isFinished = _latestValue!.position >= _latestValue!.duration;

    setState(() {
      if (controller!.value.isPlaying) {
        _hideStuff = false;
        _hideTimer?.cancel();
        controller!.pause();
      } else {
        _cancelAndRestartTimer();

        if (!controller!.value.isInitialized) {
          controller!.initialize().then((_) {
            controller!.play();
          });
        } else {
          if (isFinished) {
            controller!.seekTo(Duration(seconds: 0));
          }
          controller!.play();
        }
      }
    });
  }

  void _startHideTimer() {
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _hideStuff = true;
      });
    });
  }

  void _updateState() {
    setState(() {
      _latestValue = controller!.value;
    });
  }

  Widget _buildProgressBar() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: MaterialVideoProgressBar(
          controller!,
          onDragStart: () {
            setState(() {
              _dragging = true;
            });

            _hideTimer?.cancel();
          },
          onDragEnd: () {
            setState(() {
              _dragging = false;
            });

            _startHideTimer();
          },
          colors: chewieController!.materialProgressColors ??
              ChewieProgressColors(
                  playedColor: Theme
                      .of(context)
                      .accentColor,
                  handleColor: Theme
                      .of(context)
                      .accentColor,
                  bufferedColor: Theme
                      .of(context)
                      .backgroundColor,
                  backgroundColor: Theme
                      .of(context)
                      .disabledColor),
        ),
      ),
    );
    print(controller!.value.buffered.length);
    return Expanded(
      child: VideoProgressIndicator(controller!, allowScrubbing: true,
        colors: VideoProgressColors(
            backgroundColor: Colors.blue, playedColor: Colors.green, bufferedColor: Colors.red),
      ),
    );
  }

  ///显示快进快退的时间
  Widget buildProgressRate() {
    return Visibility(visible: isShowProgressRote, child: Container(
      height: 50,
      width: 250,
      child: Row(children: <Widget>[
        Text('${formatDuration(Duration(seconds: controller!.value.position.inSeconds.floor() + dragValue.floor()))} /',
          style: TextStyle(fontSize: 26, color: Colors.white,),),
        Text('${controller!.value.duration == null ? 0 : formatDuration(controller!.value.duration)}',
            style: TextStyle(fontSize: 26, color: Colors.white))
      ], mainAxisAlignment: MainAxisAlignment.center,),
      decoration: BoxDecoration(color: Colors.black38),
      alignment: Alignment.center,),);
  }

  bool isShowProgressRote = false;

  ///是否显示哪个进度
  void isShowProgressRate(bool isShow) {
    isShowProgressRote = isShow;
    setState(() {});
  }
}
