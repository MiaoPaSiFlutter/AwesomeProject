import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:flutter/material.dart';

class ListViewTabWidget extends StatefulWidget {
  const ListViewTabWidget(this.tabKey);

  final Key tabKey;

  @override
  _ListViewTabWidgetState createState() => _ListViewTabWidgetState();
}

class _ListViewTabWidgetState extends State<ListViewTabWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Widget child = ExtendedVisibilityDetector(
      uniqueKey: widget.tabKey,
      child: GlowNotificationWidget(
        //margin: EdgeInsets.only(left: 190.0),
        ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext c, int i) {
              return Container(
                //decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 1.0)),
                alignment: Alignment.center,
                height: 60.0,
                width: double.infinity,
                //color: Colors.blue,
                child: Text('${widget.tabKey}: List$i'),
              );
            },
            itemCount: 100,
            padding: const EdgeInsets.all(0.0)),
        showGlowLeading: false,
      ),
    );

    return child;
  }

  @override
  bool get wantKeepAlive => true;
}
