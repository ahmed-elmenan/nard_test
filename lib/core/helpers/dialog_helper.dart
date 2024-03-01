import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nard_test/core/commons/widgets/custom_button.dart';
import 'package:nard_test/core/helpers/widget_helper.dart';
import 'package:nard_test/core/services/navigation_service.dart';

class DialogHelper {
  static Future<T?> showDialog<T>(
      {required String title,
      required String subTitle,
      required assetName,
      required String label,
      required VoidCallback callback,
      required Color bgColor,
      bool isDismissible = true}) {
    final context = GetIt.instance.get<NavigationService>().context;
    return showGeneralDialog<T>(
        context: context,
        barrierDismissible: isDismissible,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        pageBuilder: (BuildContext context, _, __) => Dialog(
            insetPadding: const EdgeInsets.all(12),
            backgroundColor: bgColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: _dialogBody(
                context, title, subTitle, assetName, label, callback)));
  }

  static Widget _dialogBody(
    BuildContext context,
    String title,
    String subTitle,
    String assetName,
    String label,
    VoidCallback callback,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height / 2 - 60,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 12),
          ...WidgetHelper.buildTitledImage(
              title: title, subTitle: subTitle, assetName: assetName),
          const SizedBox(
            height: 12,
          ),
          CustomButton(
              onPressed: () {
                Navigator.of(context).pop();
                callback();
              },
              text: label)
        ],
      ),
    );
  }
}
