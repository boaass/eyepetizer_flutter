import 'package:eyepetizer/core/viewmodel/follow_view_model.dart';
import 'package:eyepetizer/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ZCLFollowPage extends StatefulWidget {

  static const String routeName = "/focus";

  const ZCLFollowPage({Key? key}) : super(key: key);

  @override
  _ZCLFollowPageState createState() => _ZCLFollowPageState();
}

class _ZCLFollowPageState extends State<ZCLFollowPage> {
  ScrollController _scrollController = ScrollController();
  bool _isLoading = true;
  late ZCLFollowViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ZCLFollowViewModel>(
        builder: (ctx, followVM, child) {
          _viewModel = followVM;
          _isLoading = false;
          if (followVM.cardPageModel.cards == null) {
            return Container(height: 1,);
          }
          return RefreshIndicator(
            color: Colors.black,
            onRefresh: (){
              return followVM.update();
            },
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                List? metros = followVM.cardPageModel.cards?[index].body!.metro_list;
                if (metros == null || metros.length == 0) {
                  return Container(height: 1);
                }
                return ZCLCardWidget(model: followVM.cardPageModel.cards![index],);
              },
              itemCount: followVM.cardPageModel.cards!.length,
            ),
          );
        }
    );
  }

  _loadMore() {
    _viewModel.requestMoreMetros();
  }
}
