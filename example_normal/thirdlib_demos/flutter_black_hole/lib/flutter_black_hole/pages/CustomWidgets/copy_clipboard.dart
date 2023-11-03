import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:flutter_black_hole/flutter_black_hole/pages/CustomWidgets/custom_widgets_index.dart';
import 'package:flutter_black_hole/flutter_black_hole/pages/flutter_gen/gen_l10n/app_localizations.dart';

void copyToClipboard({
  required BuildContext context,
  required String text,
  String? displayText,
}) {
  Clipboard.setData(ClipboardData(text: text));
  ShowSnackBar().showSnackBar(
    context,
    displayText ?? AppLocalizations.of(context)!.copied,
  );
}
