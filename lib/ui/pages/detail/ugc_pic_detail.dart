import 'package:eyepetizer/core/model/ugc_pic_detail_model.dart';
import 'package:eyepetizer/core/viewmodel/ugc_pic_detail_view_model.dart';
import 'package:eyepetizer/ui/widgets/expandable_pageview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';

class ZCLUgcPicDetailPage extends StatefulWidget {
  static const String routeName = "/ugc_pic_detail";
  const ZCLUgcPicDetailPage({Key? key}) : super(key: key);

  @override
  _ZCLUgcPicDetailPageState createState() => _ZCLUgcPicDetailPageState();
}

class _ZCLUgcPicDetailPageState extends State<ZCLUgcPicDetailPage> {

  int _currentPageIndex = 1;
  bool _isPicDetailShow = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ZCLUgcPicDetailViewModel>(
      builder: (ctx, detailVM, child) {
        return detailVM.ugcPicDetailModel == null ? Scaffold(body: Container()) :
        SafeArea(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isPicDetailShow = !_isPicDetailShow;
              });
            },
            child: Scaffold(
              body: detailVM.ugcPicDetailModel == null ? Container() :
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.black,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: _isPicDetailShow ? 1 : 0,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.maybePop(context);
                              },
                              child: AppBar(
                                leading: Icon(Icons.arrow_drop_down_circle_rounded, color: Colors.white,),
                                title: Text(_currentPageIndex.toString() + "/" + detailVM.ugcPicDetailModel!.images!.length.toString(), style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),),
                                backgroundColor: Colors.black,
                              ),
                            ),
                            _buildAuthor(detailVM),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ExpandablePageView(
                    itemCount: detailVM.ugcPicDetailModel!.images!.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index + 1;
                      });
                    },
                    itemBuilder: (ctx, index) {
                      return Container(
                          height: 200.px,
                          child: Image.network(detailVM.ugcPicDetailModel!.images![index].cover!.url!, fit: BoxFit.fitWidth)
                      );
                    }
                  ),
                ]
              )
            ),
          ),
        );
      },
    );
  }

  _buildAuthor(ZCLUgcPicDetailViewModel detailVM) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(foregroundImage: NetworkImage(detailVM.ugcPicDetailModel!.author!.avatar!.url!)),
              SizedBox(width: 5.px,),
              Text(detailVM.ugcPicDetailModel!.author!.nick!, style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white)),
              Spacer(),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(5.px))
                    ),
                    padding: EdgeInsets.fromLTRB(7.px, 3.px, 7.px, 3.px),
                    child: Text("私信", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)),
                  ),
                  Container(width: 10.px,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5.px))
                    ),
                    padding: EdgeInsets.all(3.px),
                    child: Text("+关注", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)),
                  )
                ],
              )
            ]
          ),
          (detailVM.ugcPicDetailModel!.text == null || detailVM.ugcPicDetailModel!.text!.isEmpty) ? Container() :
          Padding(
            padding: EdgeInsets.only(top: 10.px),
            child: Text(detailVM.ugcPicDetailModel!.text!, style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white)),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.px),
            child: Wrap(
              children: detailVM.ugcPicDetailModel!.topics!.map((e) => Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(3.px))
                ),
                padding: EdgeInsets.all(3.px),
                child: Text(e.title!),
              )).toList(),
            ),
          ),
          _buildDivider(),
          _buildBottomButton(detailVM.ugcPicDetailModel!.consumption!),
        ],
      ),
    );
  }

  _buildDivider() {
    return Container(
      margin: EdgeInsets.only(top: 10.px),
      color: Colors.white,
      height: 1.px,
    );
  }

  _buildBottomButton(Consumption consumption) {
    return Container(
      margin: EdgeInsets.only(top: 10.px),
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionButton(Icons.favorite_border_outlined, consumption.likeCount!.toString()),
          _buildActionButton(Icons.chat_bubble_outline, consumption.collectionCount!.toString()),
          _buildActionButton(Icons.star_border_outlined, "收藏"),
          _buildActionButton(Icons.open_in_new_outlined, ""),
        ],
      ),
    );
  }

  _buildActionButton(IconData icon, String text) {
    return Row(
        children: [
          Icon(icon, color: Colors.grey,),
          SizedBox(width: 5.px,),
          Text(text, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.grey),)
        ]
    );
  }
}
