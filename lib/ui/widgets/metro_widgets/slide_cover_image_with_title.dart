import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLSlideCoverImageWithTitle extends StatelessWidget {
  const ZCLSlideCoverImageWithTitle({Key? key, required this.model}) : super(key: key);
  final ZCLMetro model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ZCLSizeFit.screenWidth!/5*2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(model.cover!, height: ZCLSizeFit.screenWidth!/5*2, fit: BoxFit.fill),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.px),
            child: Text(model.title!, style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.center,)
          )
        ],
      ),
    );
  }
}
