import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLCardUser extends StatelessWidget {
  const ZCLCardUser({Key? key, required this.model}) : super(key: key);
  final ZCLMetro? model;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ListTile(
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
