class MpsfRecommondListVM {
  int page = 0;
  int pageSize = 10;
  bool loading = false; // 是否正在请求
  bool hasMore = true; // 是否有更多数据
  List datas = [];

  dealDatas(Map result) {
    List? wareInfoList = result['wareInfoList'] ?? [];
    List newDatas = [];
    if (wareInfoList != null) {
      for (var item in wareInfoList) {
        newDatas.add(Map.from(item));
      }
    }
    if (page == 1) {
      datas.clear();
    }
    datas.addAll(newDatas);
    if (newDatas.length < pageSize) {
      hasMore = false;
    }
  }
}
