import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_tecnico_shoulder/app/utils/sharedWidgets/snackbar_widget.dart';
import '../stylePages/app_colors.dart';

class CopyBarCodeWidget extends StatelessWidget {
  final String successText;
  final String valueCopy;
  final Widget widgetCustom;

  const CopyBarCodeWidget(
      { Key? key,
        required this.successText,
        required this.valueCopy,
        required this.widgetCustom,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Clipboard.setData(ClipboardData(text: valueCopy));
        SnackbarWidget(
          warningText: "Sucesso",
          informationText: successText,
          backgrondColor: AppColors.blackTransparentColor
        );
      },
      child: widgetCustom,
    );
  }
}