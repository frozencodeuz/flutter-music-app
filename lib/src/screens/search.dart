import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:myapp/src/bloc/app_bloc.dart';
import 'package:myapp/src/bloc/app_provider.dart';
import 'package:myapp/src/resources/colors.dart' as AppColors;
import 'package:myapp/src/widgets/common_image.dart';

import 'package:myapp/src/models/music_details.dart';
import 'package:myapp/src/service/search.dart' as searchService;
import 'package:myapp/src/widgets/screen_with_bottom_player_bar.dart';

class SearchScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchState();
  }
}

class _SearchState extends State<SearchScreen> implements TickerProvider {

  final textEditingController = TextEditingController();
  TabController _tabController;

  _handleSearch() async {
    final searchModal = await searchService.search(keywords: textEditingController.text);
    print(searchModal.result.songs);
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      this._handleSearch();
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 3);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "单曲",),
                Tab(text: "歌手",),
                Tab(text: "专辑",),
                Tab(text: "歌单",),
              ],
            ),
            title: TextField(
              cursorColor: Colors.white,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
              textInputAction: TextInputAction.search,
              autofocus: true,
              onEditingComplete: () {
                _handleSearch();
              },
              controller: textEditingController,
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ));
  }

  @override
  Ticker createTicker(onTick) {
    // TODO: implement createTicker
    return null;
  }

}
