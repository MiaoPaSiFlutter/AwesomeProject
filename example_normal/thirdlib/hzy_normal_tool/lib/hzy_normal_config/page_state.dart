/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-16 17:37:21
 * @LastEditors: TT
 * @LastEditTime: 2023-05-20 11:41:42
 */
enum PageState {
  // 初始状态
  initializedState,
  // 错误状态,显示失败界面
  errorState,
  // 错误状态,只弹错误信息
  erroronlyTotal,
  // 错误状态,显示刷新按钮
  errorshowRelesh,
  // 没有更多数据
  noMoreDataState,
  // 空数据状态
  emptyDataState,
  // 数据获取成功状态
  dataFetchState,
}

class BaseState {
  PageState? pageState;
  bool isok = true;
  String? msg;
  String? mark;
  BaseState({
    this.pageState = PageState.initializedState,
    this.msg,
  });
}

class TTcommentTool {
  static configPageState({
    required int allNum,
    required int netlistNum,
  }) {
    PageState st = PageState.dataFetchState;
    if (allNum == 0) {
      st = PageState.emptyDataState;
    } else if (netlistNum == 0) {
      st = PageState.noMoreDataState;
    }
    return st;
  }
}
