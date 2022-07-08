import 'package:date_format/date_format.dart';
import 'package:eyepetizer/core/model/topic_detail_tag_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/ugc_pic_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/user_center_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/ugc_pic_detail.dart';
import 'package:eyepetizer/ui/pages/detail/user_center.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:provider/provider.dart';

import '../expandable_text.dart';



class ZCLUGCPictureBeanWidget extends StatefulWidget {
  const ZCLUGCPictureBeanWidget({Key? key, required this.item}) : super(key: key);
  final ItemList item;

  @override
  _ZCLUGCPictureBeanWidgetState createState() => _ZCLUGCPictureBeanWidgetState();
}

class _ZCLUGCPictureBeanWidgetState extends State<ZCLUGCPictureBeanWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.px, 10.px, 10.px, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<ZCLUserCenterNotifier>(context, listen: false).link = widget.item.data!.content!.data!.uid!;
              Navigator.of(context).pushNamed(ZCLUserCenterPage.routeName);
            },
            child: Container(
              child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(foregroundImage: NetworkImage(widget.item
                      .data!.content!.data!.owner!.avatar!)),
                  title: Text(widget.item.data!.content!.data!.owner!.nickname!,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontWeight: FontWeight.bold)),
                  subtitle: Text("${_formatTimestamp(widget.item.data!.content!
                      .data!.createTime!)} 发布:"),
                  trailing: widget.item.data!.header!.topShow! ? Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("置顶", style: Theme
                          .of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.blue),),
                    ),
                  ) : Container(width: 1,)
              ),
            ),
          ),
          widget.item.data!.content!.data!.description == "" ? Container() :
          ExpandableText(
            text: widget.item.data!.content!.data!.description,
            maxLines: 2,
            style: Theme
                .of(context)
                .textTheme
                .headline3,
            expand: false,
          ),
          widget.item.data!.content!.data!.tags == null ? Container() :
          Container(
            margin: EdgeInsets.only(top: 10.px),
            padding: EdgeInsets.symmetric(horizontal: 8.px),
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5)
            ),
            child: Text(
              widget.item.data!.content!.data!.tags!.first.name!, style: Theme
                .of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.blue),),
          ),
          _buildFourPic(widget.item.data!.content!.data!),
          _buildBottomButton(widget.item.data!.content!.data!.consumption!),
        ],
      ),
    );
  }

  _buildFourPic(ContentData data) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 300.px,
            margin: EdgeInsets.only(top: 10.px),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.px)
            ),
            child: GestureDetector(
              onTap: () {
                Provider.of<ZCLUgcPicDetailNotifier>(context, listen: false).id = data.id.toString();
                Navigator.of(context).pushNamed(ZCLUgcPicDetailPage.routeName);
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(child: Image.network(data.urls!.first, fit: BoxFit.fill)),
                  data.urls!.length <= 1 ? Container() :
                  Positioned(
                    top: 10.px,
                    right: 10.px,
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                      child: Text("+${data.urls!.length - 1}", style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white)),
                    ),
                  ),
                ],),
            )
            // child: GridView.count(
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   crossAxisCount: data.urls!.length == 1 ? 1 : 2,
            //   mainAxisSpacing: 3.px,
            //   crossAxisSpacing: 3.px,
            //   childAspectRatio: 3/2,
            //   children: data.urls!.length > 4 ? data.urls!.sublist(0, 4).asMap().map((key, value) {
            //     if (key == 3) {
            //       return MapEntry(key, Stack(
            //         alignment: Alignment.center,
            //         children: [
            //           Positioned.fill(child: Image.network(value, fit: BoxFit.fill)),
            //           Positioned.fill(
            //             child: Container(
            //               color: Colors.black.withOpacity(0.3),
            //             ),
            //           ),
            //           Text("+${data.urls!.length - 4}", style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white)),
            //         ],));
            //     }
            //     return MapEntry(key, Image.network(value, fit: BoxFit.fill,));
            //   }).values.map((e) => GestureDetector(onTap: () {
            //     Provider.of<ZCLUgcPicDetailNotifier>(context, listen: false).id = data.id.toString();
            //     Navigator.of(context).pushNamed(ZCLUgcPicDetailPage.routeName);
            //   }, child: e)).toList() :
            //   data.urls!.asMap().map((key, value) {
            //     return MapEntry(key, Image.network(value, fit: BoxFit.fill));
            //   }).values.map((e) => GestureDetector(onTap: () {
            //     Provider.of<ZCLUgcPicDetailNotifier>(context, listen: false).id = data.id.toString();
            //     Navigator.of(context).pushNamed(ZCLUgcPicDetailPage.routeName);
            //   }, child: e)).toList(),
            // ),
          ),
        ),
      ],
    );
  }

  _buildBottomButton(Consumption consumption) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionButton(Icons.favorite_border_outlined, consumption.collectionCount!.toString()),
          _buildActionButton(Icons.chat_bubble_outline, consumption.replyCount!.toString()),
          _buildActionButton(Icons.star_border_outlined, "收藏"),
          _buildActionButton(Icons.publish, ""),
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

  _formatTimestamp(int time) {
    return formatDate(DateTime.fromMillisecondsSinceEpoch(time), [yyyy,'/',mm,'/',dd]);
  }
}
