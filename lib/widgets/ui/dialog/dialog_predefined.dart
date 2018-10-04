import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myagenda/keys/string_key.dart';
import 'package:myagenda/utils/translations.dart';
import 'package:myagenda/widgets/ui/dialog/progress_dialog.dart';
import 'package:myagenda/widgets/ui/dialog/simple_alert_dialog.dart';

class DialogPredefined {
  static Future<bool> showContentDialog(
    BuildContext context,
    String title,
    Widget content,
    String btnPositive,
    String btnNegative, [
    dismissable = true,
  ]) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: dismissable,
          builder: (BuildContext context) {
            return SimpleAlertDialog(
              title: title,
              content: content,
              btnNegative: btnNegative,
              btnPositive: btnPositive,
            );
          },
        ) ??
        false;
  }

  static Future<bool> showTextDialog(
    BuildContext context,
    String title,
    String text,
    String btnPositive,
    String btnNegative, [
    dismissable = true,
  ]) async {
    return await showContentDialog(
      context,
      title,
      Text(text, textAlign: TextAlign.justify),
      btnPositive,
      btnNegative,
      dismissable,
    );
  }

  static Future<bool> showSimpleMessage(
      BuildContext context, String title, String message) async {
    final translate = Translations.of(context);

    return await showTextDialog(
      context,
      title,
      message,
      translate.get(StringKey.OK),
      null,
    );
  }

  static Future<bool> showEndTimeError(BuildContext context) async {
    final translate = Translations.of(context);

    return await showTextDialog(
      context,
      translate.get(StringKey.ERROR_END_TIME),
      translate.get(StringKey.ERROR_END_TIME_TEXT),
      translate.get(StringKey.OK),
      null,
    );
  }

  static Future<bool> showDeleteEventConfirm(BuildContext context) async {
    final translate = Translations.of(context);

    return await showTextDialog(
      context,
      translate.get(StringKey.CONFIRM_EVENT_DELETE),
      translate.get(StringKey.CONFIRM_EVENT_DELETE_TEXT),
      translate.get(StringKey.YES),
      translate.get(StringKey.NO),
    );
  }

  static Future<bool> showProgressDialog(
      BuildContext context, String message) async {
    final translate = Translations.of(context);

    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ProgressDialog(
          title: translate.get(StringKey.LOADING),
          text: message,
        );
      },
    );
  }
}
