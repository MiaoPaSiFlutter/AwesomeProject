import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class SliverAppbarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            ExtendedSliverAppbar(
              title: const Text(
                'ExtendedSliverAppbar',
                style: TextStyle(color: Colors.white),
              ),
              leading: const BackButton(
                onPressed: null,
                color: Colors.white,
              ),
              background: Image.asset(
                NormalModuleUtils.configPackagesImage(
                    packagename: 'extended_sliver_demo',
                    name: 'assets/cypridina.jpeg'),
                fit: BoxFit.cover,
              ),
              actions: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: MaterialButton(
                      onPressed: () => debugPrint('$index'),
                      child: Container(
                        child: Text(
                          '${100 - index}',
                        ),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(50),
                      ),
                    ),
                  );
                },
                childCount: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
