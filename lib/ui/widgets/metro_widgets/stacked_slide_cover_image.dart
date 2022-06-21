import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLStackedSlideCoverImage extends StatelessWidget {
  final ZCLMetro model;
  const ZCLStackedSlideCoverImage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.px,
      child: Swiper(
        loop: true,
        autoplay: true,
        layout: SwiperLayout.STACK,
        itemWidth: ZCLSizeFit.screenWidth! - 70.px,
        itemCount: model.itemList!.length,
        itemBuilder: (ctx, index) {
          return Container(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(model.itemList![index].cover!.url!, fit: BoxFit.fill),
                Positioned(
                  left: 5.px,
                  top: 10.px,
                  child: Text(model.itemList![index].title!, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white))
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
