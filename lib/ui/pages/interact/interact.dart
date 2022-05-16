import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLInteractPage extends StatelessWidget {

  static const String routeName = "/interact";

  bool isLogined;

  ZCLInteractPage({Key? key, this.isLogined = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLogined ? _buildContentWithLogin() : _buildContentWithNoLogin(context);
  }

  _buildContentWithNoLogin(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 200,),
            Text("别错过重要的信息", style: Theme.of(context).textTheme.headline2?.copyWith(fontWeight: FontWeight.bold),),
            Text("登录后即可查看评论回复、点赞及关注等通知信息", style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black54),)
          ],
        ),
        GestureDetector(
          onTap: (){
            // todo: 跳转登录页面

          },
          child: Container(
            alignment: Alignment.center,
            width: 200.px,
            height: 50.px,
            color: Colors.black,
            child: Text("登录", style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),),
          ),
        )
      ],
    );
  }

  _buildContentWithLogin() {
    // todo: 已登录页面
    return Container();
  }
}
