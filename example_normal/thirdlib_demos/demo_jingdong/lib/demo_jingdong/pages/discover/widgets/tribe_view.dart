import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/material.dart';
import '../vm/tribe_viewmodel.dart';

class TribeView extends StatefulWidget {
  const TribeView({Key? key}) : super(key: key);

  @override
  State createState() => _TribeViewState();
}

class _TribeViewState extends State<TribeView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _model = TribeViewModel();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<TribeViewModel>(
      model: _model,
      onReady: (model) {
        model.getPageDatas();
      },
      builder: (context, model, widget) {
        return MultiStateWidget(
          state: model.state,
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.transparent),
                color: const Color(0xFFEEEEEE),
              ),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(10),
                    sliver: SliverGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: List.generate(8, (index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: const Color(0xFFFFFFFF),
                            alignment: Alignment.center,
                            child: Text('$index',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((content, index) {
                      return Container(
                        height: 85,
                        alignment: Alignment.center,
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        child: Text(
                          '$index',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      );
                    }, childCount: 25),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
