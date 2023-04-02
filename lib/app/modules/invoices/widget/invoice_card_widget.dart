import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../base/models/invoiceInformation/invoice_information.dart';
import '../../../utils/sharedWidgets/text_widget.dart';
import '../../../utils/stylePages/app_colors.dart';
import '../../invoiceDetail/page/invoice_detail_page.dart';

class InvoiceCardWidget extends StatelessWidget {
  final InvoiceInformation invoiceInformation;

  const InvoiceCardWidget({
    Key? key,
    required this.invoiceInformation,
  }) : super(key: key);

  Color _getColor() {
    try{
      return Color(
        int.parse(
          "FF${invoiceInformation.destaqueAtraso.replaceAll('#', '').toUpperCase()}",
          radix: 16,
        ),
      );
    }
    catch(_){
      return AppColors.whiteColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => InvoiceDetailPage(
        invoiceInformation: invoiceInformation,
      )),
      child: Card(
        color: invoiceInformation.destaqueAtraso.isEmpty ?
          AppColors.whiteColor : _getColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.h),
          side: BorderSide(
            color: invoiceInformation.destaqueAtraso.isEmpty ?
              AppColors.defaultColor : _getColor(),
            width: .5.w,
          ),
        ),
        elevation: 3,
        margin: EdgeInsets.only(bottom: 2.h),
        child: Padding(
          padding: EdgeInsets.all(1.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextWidget(
                  "NF: ${invoiceInformation.notaFiscal}",
                  textColor: AppColors.blackColor,
                  fontSize: 18.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    invoiceInformation.data.replaceAll('-', '/'),
                    textColor: AppColors.blackColor,
                    fontSize: 16.sp,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w600,
                    maxLines: 3,
                  ),
                  TextWidget(
                    "Atraso: ${invoiceInformation.diasAtraso} dias",
                    textColor: AppColors.blackColor,
                    fontSize: 16.sp,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
