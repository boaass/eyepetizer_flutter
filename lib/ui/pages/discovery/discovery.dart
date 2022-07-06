import 'package:eyepetizer/core/model/discovery_nav_model.dart';
import 'package:eyepetizer/core/viewmodel/discovery_view_model.dart';
import 'package:eyepetizer/ui/pages/detail/search.dart';
import 'package:eyepetizer/ui/shared/KeepAliveWrapper.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:eyepetizer/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLDiscoveryPage extends StatelessWidget {

  static const String routeName = "/discovery";

  const ZCLDiscoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ZCLDiscoveryViewModel>(
      builder: (ctx, discoveryVM, child) {
        return discoveryVM.discoveryModel == null ? Scaffold(body: Container()) :
        Scaffold(
          appBar: _buildSearchBar(ctx, discoveryVM.discoveryNavModel!),
          body: Container(
            child: RefreshIndicator(
              color: Colors.black,
              onRefresh: () {
                return discoveryVM.update();
              },
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: discoveryVM.discoveryModel!.cards!.length + 1,
                itemBuilder: (ctx, index) {
                  if (index == discoveryVM.discoveryModel!.cards!.length) {
                    return _buildFooter(ctx);
                  }
                  return KeepAliveWrapper(
                    keepAlive: true,
                    child: Padding(padding: EdgeInsets.only(top: 20.px), child: ZCLCardWidget(model: discoveryVM.discoveryModel!.cards![index]))
                  );
                }
              ),
            ),
          )
        );
      }
    );
  }

  _buildSearchBar(BuildContext context, ZCLDiscoveryNavModel discoveryNavModel) {
    return AppBar(
      titleSpacing: 0,
      elevation: 0, // 隐藏阴影
      title: ListTile(
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ZCLSearchPage.routeName);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.px),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(7.px))
            ),
            child: Container(
              margin: EdgeInsets.only(left: 10.px),
              child: Text(discoveryNavModel.navItem!.left!.first.text!, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black54),)
            ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(left: 10.px),
          child: Icon(Icons.notifications_none_outlined, size: 30.px,)
        )
      ],
    );
  }

  _buildFooter(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.px),
      alignment: Alignment.center,
      child: Text("-The End-", style: Theme.of(context).textTheme.headline3!.copyWith(fontFamily: "Lobster"),),
    );
  }
}
