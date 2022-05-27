import 'package:flutter/material.dart';
import 'package:eyepetizer/core/model/card_model.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';

class ZCLDefaultNav extends StatefulWidget {
  const ZCLDefaultNav({Key? key, required this.model, this.navIndex = 0, this.onTap}) : super(key: key);
  final ZCLMetro? model;
  final int? navIndex;
  final Function(int)? onTap;

  @override
  _ZCLDefaultNavState createState() => _ZCLDefaultNavState();
}

class _ZCLDefaultNavState extends State<ZCLDefaultNav> with TickerProviderStateMixin {
  int _currentIndex = 0;
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    _currentIndex = widget.navIndex!;
    child = _buildDefaultNavTabBar();
    return child;
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  _buildDefaultNavTabBar() {
    _tabController = TabController(length: widget.model!.metroData!.navList!.length, vsync: this);
    return TabBar(
      key: widget.model!.stickyKey,
      onTap: (index) {
        if (index != _currentIndex) {
          setState(() {
            _currentIndex = index;
            if (widget.onTap != null) {
              widget.onTap!(index);
            }
          });
        }
      },
      controller: _tabController,
      labelPadding: EdgeInsets.zero,
      tabs: widget.model!.metroData!.navList!.asMap().map((int index, NavList e) => MapEntry(index, Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: index == _currentIndex ? Border(top: BorderSide(color: Colors.black54), right: BorderSide(color: Colors.black54)) : Border.all(color: Colors.black54)
          ),
          padding: EdgeInsets.fromLTRB(30.px, 10.px, 30.px, 10.px),
          child: Text(e.title!, style: Theme.of(context).textTheme.headline3,)
      ))).values.toList(),
    );
  }
}
