import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/user_center_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/user_center.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:provider/provider.dart';


class ZCLFeedUser extends StatefulWidget {
  final ZCLMetro? model;
  const ZCLFeedUser({Key? key, required this.model}) : super(key: key);

  @override
  _ZCLFeedUserState createState() => _ZCLFeedUserState();
}

class _ZCLFeedUserState extends State<ZCLFeedUser> {

  final double _height = 80.px;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ZCLUserCenterNotifier>(context, listen: false).link = widget.model!.metroData!.uid!;
        Navigator.of(context).pushNamed(ZCLUserCenterPage.routeName);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10.px, 20.px, 10.px, 20.px),
        height: _height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: _height,
              height: _height,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_height)
              ),
              child: Image.network(widget.model!.avatar!.url!, fit: BoxFit.fill,)
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.model!.nick!, style: Theme.of(context).textTheme.headline4),
                    Text(
                      widget.model!.description!,
                      style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Icon(Icons.add_box_sharp, color: Colors.black, size: _height/2,),
          ],
        )
      ),
    );
  }
}
