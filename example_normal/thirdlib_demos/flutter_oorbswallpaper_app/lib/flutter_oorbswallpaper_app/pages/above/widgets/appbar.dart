import 'package:flutter/material.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';

import '../../collections/collections_widget.dart';

PreferredSizeWidget? createAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color(0xFF14181B),
    automaticallyImplyLeading: false,
    title: InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CollectionsWidget(),
          ),
        );
      },
      child: Text(
        FFLocalizations.of(context)!.getText(
          'u9imkvtv' /* ◀︎ Collections */,
        ),
        style: FlutterFlowTheme.of(context).title3.override(
              fontFamily: 'Montserrat',
              color: FlutterFlowTheme.of(context).grayLight,
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
      ),
    ),
    actions: const [],
    centerTitle: false,
    elevation: 0,
  );
}
