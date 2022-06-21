import 'package:eyepetizer/core/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLIconGrid extends StatelessWidget {
  final ZCLMetro model;
  const ZCLIconGrid({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        )
      ),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 3/1,
        mainAxisSpacing: 10.px,
        crossAxisSpacing: 10.px,
        crossAxisCount: 3,
        children: model.metroData!.icons!.map((e) => _buildItem(e)).toList()
      ),
    );
  }

  Widget _buildItem(ZCLIcon icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.px)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(icon.icon!, width: 30.px,),
          SizedBox(width: 10.px),
          Text(icon.name!)
        ],
      ),
    );
  }
}
