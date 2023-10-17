import 'dart:async';

import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:loading_more_list/loading_more_list.dart';

import 'WaterfallFlowTabSource.dart';

class TuChongRepository extends LoadingMoreBase<dynamic> {
  TuChongRepository(Map tabInfo, {this.maxLength = 300});
  int _pageIndex = 1;
  bool _hasMore = true;
  bool forceRefresh = false;
  Map tabInfo = {};
  @override
  bool get hasMore => (_hasMore && length < maxLength) || forceRefresh;
  final int maxLength;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    _pageIndex = 1;
    //force to refresh list when you don't want clear list before request
    //for the case, if your list already has 20 items.
    forceRefresh = !notifyStateChanged;
    final bool result = await super.refresh(notifyStateChanged);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isLoadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      //to show loading more clearly, in your app,remove this
      //await Future<void>.delayed(const Duration(seconds: 5));
      List<dynamic>? feedList;
      dPrint(tabInfo);

      MpsfResponse response =
          await JdService.getTabProductsList(_pageIndex, tabInfo);
      var result = response.jsonData["result"] ?? {};

      feedList = TuChongSource.fromJson(result).list ?? [];

      if (_pageIndex == 1) {
        clear();
      }

      for (final item in feedList) {
        add(item);
      }

      _hasMore = feedList.isNotEmpty;
      _pageIndex++;
      isSuccess = true;
    } catch (exception, stack) {
      isSuccess = false;
      print(exception);
      print(stack);
    }
    return isSuccess;
  }

  // @override
  // Iterable<TuChongItem> wrapData(Iterable<TuChongItem> source) {
  //   return source.where((TuChongItem element) => element.imageCount == 1);
  // }
}
