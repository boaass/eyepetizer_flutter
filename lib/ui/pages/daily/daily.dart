import 'package:eyepetizer/core/viewmodel/daily_view_model.dart';
import 'package:eyepetizer/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLDailyPage extends StatefulWidget {

  static const String routeName = "/daily";

  const ZCLDailyPage({Key? key}) : super(key: key);

  @override
  _ZCLDailyPageState createState() => _ZCLDailyPageState();
}

class _ZCLDailyPageState extends State<ZCLDailyPage> {
  ScrollController _scrollController = ScrollController();
  bool _isLoading = true;
  late ZCLDailyViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listener);
  }

  _listener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listener);
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ZCLDailyViewModel>(
        builder: (ctx, dailyVM, child) {
          _viewModel = dailyVM;
          _isLoading = false;
          if (dailyVM.cardPageModel.cards == null) {
            return Container(height: 1,);
          }
          return RefreshIndicator(
            color: Colors.black,
            onRefresh: (){
              return dailyVM.update();
            },
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                List? metros = dailyVM.cardPageModel.cards?[index].body!.metro_list;
                if (metros == null || metros.length == 0) {
                  return Container(height: 1);
                }
                return Padding(
                  padding: EdgeInsets.only(top: 5.px),
                  child: ZCLCardWidget(model: dailyVM.cardPageModel.cards![index],),
                );
              },
              itemCount: dailyVM.cardPageModel.cards!.length,
            ),
          );
        }
    );
  }

  _loadMore() {
    _viewModel.requestMoreMetros();
  }
}
