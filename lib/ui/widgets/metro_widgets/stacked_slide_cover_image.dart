import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/viewmodel/topic_detail_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/topic_detail.dart';
import 'package:eyepetizer/ui/pages/detail/topic_detail_light.dart';
import 'package:eyepetizer/ui/pages/detail/topic_detail_tag.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:eyepetizer/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:provider/provider.dart';


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
          return GestureDetector(
            onTap: () {
              Provider.of<ZCLTopicDetailNotifier>(context, listen: false).link = model.itemList![index].link ?? "";
              _jumpPageFromLink(context, Provider.of<ZCLTopicDetailNotifier>(context, listen: false).link);
            },
            child: Container(
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
            ),
          );
        },
      ),
    );
  }

  _jumpPageFromLink(BuildContext context, String link) {
    if (link.startsWith("eyepetizer://tag")) {
      Navigator.of(context).pushNamed(ZCLTopicDetailTagPage.routeName);
    } else if (link.startsWith("eyepetizer://lightTopic")) {
      Navigator.of(context).pushNamed(ZCLTopicDetailLightPage.routeName);
    } else if (link.startsWith("eyepetizer://webview")) {
      String encodeUrl = link.split("url=").last;
      String decodeUrl = Uri.decodeFull(encodeUrl);
      ZCLUtils.launchUrl(decodeUrl);
    } else if (link.startsWith("https://")) {
      ZCLUtils.launchUrl(link);
    } else {
      Navigator.of(context).pushNamed(ZCLTopicDetailPage.routeName);
    }
  }
}
