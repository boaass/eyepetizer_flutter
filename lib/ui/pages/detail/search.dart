import 'package:eyepetizer/core/viewmodel/search_recommend_view_model.dart';
import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:eyepetizer/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ZCLSearchPage extends StatefulWidget {
  static const routeName = "/search";
  const ZCLSearchPage({Key? key}) : super(key: key);

  @override
  _ZCLSearchPageState createState() => _ZCLSearchPageState();
}

class _ZCLSearchPageState extends State<ZCLSearchPage> with TickerProviderStateMixin {

  TextEditingController _textEditingController = TextEditingController();
  PageController _pageController = PageController();
  ScrollController _scrollController = ScrollController();
  TabController? _tabController;
  int _currentPageIndex = 0;
  bool _isDeleteBtnShow = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SEARCH_HISTORY_KEY = "search_history_key";

  @override
  void initState() {
    _scrollController.addListener(_listener);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listener);
    _pageController.dispose();
    _tabController?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _listener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
      Provider.of<ZCLSearchRecommendViewModel>(context, listen: false).loadMore(_currentPageIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ZCLSearchRecommendViewModel>(
        builder: (ctx, searchRecommendVM, child) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.px),
            child: searchRecommendVM.isSearchPage ?
            SingleChildScrollView(
              child: SafeArea(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildSearchBar(),
                    searchRecommendVM.isSearchPage ? _buildSearchPageBody(searchRecommendVM) : Expanded(child: _buildSearchResultPageBody(searchRecommendVM))
                  ],
                )
              ),
            ) :
            SafeArea(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildSearchBar(),
                    searchRecommendVM.isSearchPage ? _buildSearchPageBody(searchRecommendVM) : Expanded(child: _buildSearchResultPageBody(searchRecommendVM))
                  ],
                )
            ),
          );
        },
      ),
    );
  }

  _buildSearchPageBody(ZCLSearchRecommendViewModel searchRecommendVM) {
    return searchRecommendVM.hotQuerues == null ? Container() :
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSearchHistory(),
        _buildRecommendSearch(searchRecommendVM),
        _buildBody(searchRecommendVM),
      ],
    );
  }

  _buildSearchResultPageBody(ZCLSearchRecommendViewModel searchRecommendVM) {
    return searchRecommendVM.searchResultModel == null ? Container() :
    Column(
      children: [
        _buildSearchResultPageTabBar(searchRecommendVM),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: searchRecommendVM.searchResultModel!.itemList!.length,
            itemBuilder: (ctx, index) {
              return RefreshIndicator(
                onRefresh: () {
                  return searchRecommendVM.changeToSearchResultPage(_textEditingController.value.text);
                },
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: searchRecommendVM.searchResultModel!.itemList![_currentPageIndex].cardList!.length - 1,
                    itemBuilder: (ctx, index) {
                      return ZCLCardWidget(model: searchRecommendVM.searchResultModel!.itemList![_currentPageIndex].cardList![index]);
                    }
                ),
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
              _tabController!.index = index;
            },
          ),
        )
      ],
    );
  }

  _buildSearchResultPageTabBar(ZCLSearchRecommendViewModel searchRecommendVM) {
    if (_tabController == null || _tabController?.length !=  searchRecommendVM.searchResultModel!.itemList!.length) {
      _tabController = TabController(vsync: this, length: searchRecommendVM.searchResultModel!.itemList!.length);
    }
    return Container(
      padding: EdgeInsets.fromLTRB(10.px, 10.px, 10.px, 10.px),
      child: TabBar(
        labelColor: Colors.black,//选中的颜色
        labelStyle: Theme.of(context).textTheme.headline2,
        unselectedLabelColor: Colors.black54,//未选中的颜色
        unselectedLabelStyle: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black54),
        isScrollable: true,
        controller: _tabController,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
          _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        tabs: searchRecommendVM.searchResultModel!.itemList!.map((e) => Tab(text: e.nav!.title!)).toList(),
      )
    );
  }
  
  _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.px),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: Theme.of(context).textTheme.headline4,
              controller: _textEditingController,
              cursorColor: Colors.blue,
              onSubmitted: (content) {
                _changeToSearchResultPage();
              },
              onChanged: (content) {
                if (content.isNotEmpty && _isDeleteBtnShow == false) {
                  setState(() {
                    _isDeleteBtnShow = true;
                  });
                } else if (content.isEmpty && _isDeleteBtnShow == true) {
                  setState(() {
                    _isDeleteBtnShow = false;
                  });
                }
              },
              decoration: InputDecoration(
                enabledBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                hintText: "搜索视频、作者、用户及标签",
              ),
            ),
          ),
          _isDeleteBtnShow ? Padding(
            padding: EdgeInsets.only(left: 5.px),
            child: GestureDetector(
              onTap: () {
                _textEditingController.clear();
                setState(() {
                  _isDeleteBtnShow = false;
                });
              },
              child: Icon(Icons.highlight_remove_outlined, color: Colors.black54, size: 18,)
            ),
          ) : Container(),
          Padding(
            padding: EdgeInsets.only(left: 10.px),
            child: GestureDetector(
              onTap: () {
                Provider.of<ZCLSearchRecommendViewModel>(context, listen: false).isSearchPage = true;
                Navigator.of(context).maybePop();
              },
              child: Text("取消", style: Theme.of(context).textTheme.headline4)
            ),
          )
        ],
      ),
    );
  }

  _buildSearchHistory() {
    Future<List<String>> searchWords = _prefs.then((SharedPreferences preferences) {
      return preferences.getStringList(SEARCH_HISTORY_KEY) ?? [];
    });
    return FutureBuilder(
      future: searchWords,
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        return snapshot.data == null || snapshot.data!.length == 0 ? Container() :
        Container(
          margin: EdgeInsets.only(top: 10.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("搜索历史", style: Theme.of(context).textTheme.headline3,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _changeSearchCache([]);
                      });
                    },
                    child: Text("删除", style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.lightBlue))
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20.px),
                child: Wrap(
                  spacing: 20.px,
                  runSpacing: 10.px,
                  children: snapshot.data!.map<Widget>((e) => _buildRecommendSearchItem(e)).toList(),
                ),
              )
            ],
          )
        );
      }
    );
  }

  _buildRecommendSearch(ZCLSearchRecommendViewModel vm) {
    return Container(
      margin: EdgeInsets.only(top: 10.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("推荐搜索", style: Theme.of(context).textTheme.headline3,),
          Container(
            margin: EdgeInsets.only(top: 20.px),
            child: Wrap(
              spacing: 20.px,
              runSpacing: 10.px,
              children: vm.hotQuerues!.map<Widget>((e) => _buildRecommendSearchItem(e)).toList(),
            ),
          )
        ],
      ),
    );
  }

  _buildRecommendSearchItem(String content) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _textEditingController.value = TextEditingValue(
            text: content,
            selection: TextSelection.fromPosition(TextPosition(offset: content.length))
          );

          _changeToSearchResultPage();
        });
      },
      child: Container(
        padding: EdgeInsets.all(5.px),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(15.px)
        ),
        child: Text(content, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black87)),
      ),
    );
  }

  _buildBody(ZCLSearchRecommendViewModel vm) {
    return Container(
      margin: EdgeInsets.only(top: 30.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: vm.cardPageModel!.cards!.map((e) => ZCLCardWidget(model: e)).toList(),
      ),
    );
  }

  _changeToSearchResultPage() async {
    if (_textEditingController.value.text.isEmpty) {
      return;
    }

    final SharedPreferences prefs = await _prefs;
    final List<String> searchWords = prefs.getStringList(SEARCH_HISTORY_KEY) ?? [];
    if (!searchWords.contains(_textEditingController.value.text)) {
      searchWords.add(_textEditingController.value.text);
      prefs.setStringList(SEARCH_HISTORY_KEY, searchWords);
    }

    ZCLSearchRecommendViewModel vm = Provider.of<ZCLSearchRecommendViewModel>(context, listen: false);
    vm.isSearchPage = false;
    vm.changeToSearchResultPage(_textEditingController.value.text);
  }

  _changeSearchCache(List<String> newWords) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setStringList(SEARCH_HISTORY_KEY, newWords);
  }
}
