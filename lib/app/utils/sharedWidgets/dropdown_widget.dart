import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teste_tecnico_shoulder/app/utils/sharedWidgets/rich_text_two_different_widget.dart';
import 'package:teste_tecnico_shoulder/app/utils/sharedWidgets/text_widget.dart';
import '../../../base/models/items/items.dart';
import '../stylePages/app_colors.dart';
import 'copy_bar_code_widget.dart';

class DropdownWidget extends StatelessWidget {
  final String title;
  final List<Items> items;

  const DropdownWidget({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.blackColor,
        ),
        borderRadius: BorderRadius.circular(1.h),
      ),
      child: ExpansionTile(
        title: TextWidget(
          title,
          textColor: AppColors.blackColor,
          fontSize: 17.sp,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w600,
        ),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: .5.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 2.h,
                          width: 2.h,
                          margin: EdgeInsets.only(right: 4.w),
                          decoration: BoxDecoration(
                            color: AppColors.defaultColor,
                            borderRadius: BorderRadius.circular(
                              1.h,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CopyBarCodeWidget(
                                successText: "Nota fiscal copiada com sucesso!",
                                valueCopy: items[index].codigoBarras,
                                widgetCustom: RichTextTwoDifferentWidget(
                                  firstText: "Nota Fiscal: ",
                                  secondText: items[index].codigoBarras,
                                  secondTextColor: AppColors.blueLinkColor,
                                  secondTextFontWeight: FontWeight.bold,
                                  secondTextDecoration: TextDecoration.underline,
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              RichTextTwoDifferentWidget(
                                firstText: "Quantidade: ",
                                secondText: items[index].pecasNF,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: .5.h),
                      child: const Divider(
                        color: AppColors.defaultColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
