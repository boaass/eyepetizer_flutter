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
      width: model.metroData!.cover!.imgInfo!.width!/ZCLSizeFit.dpr!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.network(model.cover!, fit: BoxFit.fill)),
          Text(model.title!, style: Theme.of(context).textTheme.headline3)
        ],
      ),
    );
  }
}
