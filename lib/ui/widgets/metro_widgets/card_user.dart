import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/core/viewmodel/user_center_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/user_center.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:provider/provider.dart';


class ZCLCardUser extends StatelessWidget {
  const ZCLCardUser({Key? key, required this.model}) : super(key: key);
  final ZCLMetro? model;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ListTile(
            onTap: () {
              Provider.of<ZCLUserCenterNotifier>(context, listen: false).link = model!.author!.uid.toString();
              Navigator.of(context).pushNamed(ZCLUserCenterPage.routeName);
            },
            leading: CircleAvatar(foregroundImage: NetworkImage(model!.avatar!.url!),),
            title: Text(model!.nick!, style: Theme.of(context).textTheme.headline4!),
            subtitle: Text(model!.description!, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54),),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.px),
            child: _buildDivider(),
          )
        ]
    );
  }

  _buildDivider() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10.px, 0, 0),
      color: Colors.black54,
      height: 1.px,
    );
  }
}
