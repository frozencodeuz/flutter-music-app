import 'dart:async';

import 'package:flutter/material.dart';

class AutoListView<T> extends StatelessWidget {

  final Widget Function(BuildContext context, int index) itemBuilder;
  final itemCount;
  final Future<List<T>> Function(int page) onLoadMore;
  int page;

  AutoListView({
    @required this.itemBuilder,
    @required this.itemCount,
    this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          this.onLoadMore(++page);
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          page = 1;
          this.onLoadMore(page);
        },
        child: ListView.builder(
            itemCount: this.itemCount,
            itemBuilder: this.itemBuilder),
      ),
    );
  }

}
