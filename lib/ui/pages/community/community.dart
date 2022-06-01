import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/viewmodel/community_view_model.dart';
import 'package:eyepetizer/ui/shared/app_theme.dart';
import 'package:eyepetizer/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';

class ZCLCommunityPage extends StatefulWidget {

  static const String routeName = "/community";

  ZCLCommunityPage({Key? key}) : super(key: key);

  @override
  _ZCLCommunityPageState createState() => _ZCLCommunityPageState();
}

class _ZCLCommunityPageState extends State<ZCLCommunityPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {

    _scrollController.addListener(() {
      if (_scrollController.offset == _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ZCLCommunityViewModel>(
      builder: (ctx, communityVM, child) {
        return Scaffold(
          appBar: _buidlAppBar(ctx),
          body: communityVM.cardPageModel.cards == null ? Container() :
          ListView.builder(
            shrinkWrap: true,
            controller: _scrollController,
              itemCount: communityVM.cardPageModel.cards!.length,
            itemBuilder: (ctx, index) {
              return ZCLCardWidget(model: communityVM.cardPageModel.cards![index]);
            }
          ),
        );
      },
    );
  }

  _buidlAppBar(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.search_outlined),
      title: Text("eyepetizer", style: Theme.of(context).textTheme.headline3!.copyWith(fontFamily: ZCLAppTheme.fontFamily)),
      actions: [
        Icon(Icons.notifications_none_outlined, size: 30.px,)
      ],
    );
  }

  _loadMore() {
    Provider.of<ZCLCommunityViewModel>(context, listen: false).requestMoreMetros();
  }
}
