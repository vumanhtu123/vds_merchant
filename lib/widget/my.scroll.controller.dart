import 'package:flutter/material.dart';

class MyScrollController extends ScrollController {
  final Function loadMore;
  bool isFull = false;
  bool isLoadMore = false;
  MyScrollController(this.loadMore) {
    addListener(_scrollListener);
  }

  void _scrollListener() async {
    if ((position.extentAfter) < 100 && (position.extentBefore) > 0) {
      if (!isLoadMore && !isFull) {
        isLoadMore = true;
        await loadMore();
        isLoadMore = false;
      }
    }
  }

  updateFull(){
    isFull = true;
  }

  resetLoadMore() {
    isFull = false;
    isLoadMore = false;
  }
}
