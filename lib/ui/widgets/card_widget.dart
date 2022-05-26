import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/topic_detail.dart';
import 'package:eyepetizer/ui/widgets/metro_widget.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';


enum ZCLCardType {
  set_metro_list,
  set_banner_list,
  call_metro_list,
  set_slide_metro_list
}


class ZCLCardWidget extends StatefulWidget {

  late ZCLCardType _cardType;

  final ZCLCard? model;

  final int? index;

  final Function(int index)? onTap;

  final int? navIndex;


  ZCLCardWidget({Key? key, this.model, this.index, this.onTap, this.navIndex}) : assert(model != null), super(key: key) {
    if (model!.type == "set_metro_list") {
      _cardType = ZCLCardType.set_metro_list;
    } else if (model!.type == "set_banner_list") {
      _cardType = ZCLCardType.set_banner_list;
    } else if (model!.type == "call_metro_list") {
      _cardType = ZCLCardType.call_metro_list;
    } else if (model!.type == "set_slide_metro_list") {
      _cardType = ZCLCardType.set_slide_metro_list;
    } else {
      assert(true, "Unknow card type");
    }
  }

  @override
  _ZCLCardWidgetState createState() => _ZCLCardWidgetState();
}

class _ZCLCardWidgetState extends State<ZCLCardWidget> {
  late ValueNotifier _indexNotifier;

  @override
  void initState() {
    super.initState();
    _indexNotifier = ValueNotifier<int>(1);
  }
  @override
  Widget build(BuildContext context) {
    switch (widget._cardType) {
      case ZCLCardType.set_banner_list: {
        return _buildBannerListCard();
      }
      case ZCLCardType.set_metro_list: {
        return _buildSetMetroListCard();
      }
      case ZCLCardType.call_metro_list: {
        return _buildCallMetroListCard();
      }
      case ZCLCardType.set_slide_metro_list: {
        return _buildSetSlideMetroListCard();
      }
    }
  }

  _buildBannerListCard() {
    return Column(
      children: [
        Container(
          height: 210.px,
          child: Swiper(
            viewportFraction: 0.95,
            loop: widget.model!.body!.metro_list!.length != 1,
            itemCount: widget.model!.body!.metro_list!.length,
            itemBuilder: (ctx, index) {
              return ZCLMetroWidget(model: widget.model!.body!.metro_list![index]);
            },
            onIndexChanged: (index) {
              _indexNotifier.value = index+1;
            },
            onTap: (index) {
              Provider.of<ZCLTopicDetailNotifier>(context, listen: false).link = widget.model!.body!.metro_list![index].link!;
              Navigator.of(context).pushNamed(ZCLTopicDetailPage.routeName);
            },
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10.px, 5.px, 10.px, 5.px),
          child: Row(
            children: [
              Text("了解详情", style: Theme
                  .of(context)
                  .textTheme
                  .headline5,),
              Padding(
                padding: EdgeInsets.only(left: 10.px),
                child: Icon(Icons.arrow_right_alt_outlined, size: 25.px,),
              ),
              Spacer(),
              widget.model!.body!.metro_list!.length == 1 ? Container() :
              Container(
                alignment: Alignment.center,
                width: 15.px,
                height: 15.px,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.px),
                    border: Border.all(color: Colors.black54)
                ),
                child: ValueListenableBuilder(
                    valueListenable: _indexNotifier,
                    builder: (ctx, value, child) {
                      return Text("${value}");
                    }
                ),
              )
            ],
          ),
        ),
        _buildDivider()
      ],
    );
  }

  _buildDivider() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10.px, 0, 0),
      color: Colors.black54,
      height: 1.px,
    );
  }

  _buildSetMetroListCard() {
    List<Widget> headers = List.from(widget.model!.header!.left!.map((e) => ZCLMetroWidget(model: e,)))
        ..addAll(List.from(widget.model!.header!.right!.map((e) => ZCLMetroWidget(model: e,))));
    List<Widget> bodys = List.from(widget.model!.body!.metro_list!.map((v) => ZCLMetroWidget(model: v, onTap: widget.onTap, navIndex: widget.navIndex,)));
    List<Widget> footers = List.from(widget.model!.footer!.left!.map((e) => ZCLMetroWidget(model: e,)))
      ..addAll(List.from(widget.model!.footer!.right!.map((e) => ZCLMetroWidget(model: e,))));
    // List adverts = widget.model!.adverts!;
    // if (adverts.length > 0) {
    //   // 添加广告footer
    //   ZCLAuthor advert = adverts[0];
    //   Widget widget = Container(
    //       padding: EdgeInsets.fromLTRB(10.px, 5.px, 10.px, 5.px),
    //       child: ListTile(
    //         contentPadding: EdgeInsets.zero,
    //         leading: CircleAvatar(
    //           foregroundImage: NetworkImage(advert.avatar!),
    //         ),
    //         title: Text(advert.nick!),
    //         subtitle: Text(
    //             "${advert.description}}"),
    //         trailing: Container(
    //           padding: EdgeInsets.symmetric(horizontal: 4.px),
    //           decoration: BoxDecoration(
    //             border: Border.all(color: Colors.white, ),
    //             borderRadius: BorderRadius.circular(15.px),
    //           ),
    //           child: Text("广告", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black54),)
    //         ),
    //       )
    //   );
    //   bodys.add(widget);
    // }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: headers..addAll(bodys)..addAll(footers),
    );
  }

  _buildCallMetroListCard() {
    return Column(
      children: List.from(widget.model!.body!.metro_list!.map((e) => ZCLMetroWidget(model: e,)))
    );
  }

  _buildSetSlideMetroListCard() {
    return Container(
      margin: EdgeInsets.fromLTRB(10.px, 30.px, 10.px, 10.px),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ZCLMetroWidget(model: widget.model!.header!.left![0]),
              Row(
                children: List<ZCLMetroWidget>.from((widget.model!.header!.right!.map((x) => ZCLMetroWidget(model: x,)))),
              )
            ],
          ),
          Container(
            // margin: EdgeInsets.only(top: 20.px),
            height: widget.model!.create_source == "tpl_slide_metro_list_with_title" ? 240.px : 140.px,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.model!.body!.metro_list!.length,
              itemBuilder: (ctx, index) {
                return ZCLMetroWidget(model: widget.model!.body!.metro_list![index],);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  width: 10.px,
                );
              },
            ),
          ),
          widget.model!.footer!.left!.length != 0 ? ListTile(
            leading: CircleAvatar(foregroundImage: NetworkImage(widget.model!.footer!.left!.first.avatar!.url!),),
            title: Text(widget.model!.footer!.left!.first.nick!, style: Theme.of(context).textTheme.headline4!,),
            subtitle: Text(widget.model!.footer!.left!.first.description!, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54),),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.px),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, ),
                borderRadius: BorderRadius.circular(15.px),
              ),
              child: Text("广告", style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54),)
            )
          ) : Container()
        ],
      ),
    );
  }
}
