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
    return Color(
      int.parse(
        "FF${invoiceInformation.destaqueAtraso.replaceAll('#', '').toUpperCase()}",
        radix: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => InvoiceDetailPage(
        invoiceInformation: invoiceInformation,
      )),
      child: Container(
        decoration: BoxDecoration(
          color: invoiceInformation.destaqueAtraso.isEmpty ?
            AppColors.whiteColor :
            _getColor(),
          borderRadius: BorderRadius.circular(1.h),
          border: Border.all(
            width: .5.w,
            color: invoiceInformation.destaqueAtraso.isEmpty ?
            AppColors.defaultColor :
            _getColor(),
          ),
        ),
        padding: EdgeInsets.all(1.h),
        margin: EdgeInsets.only(bottom: 2.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextWidget(
                "NF: ${invoiceInformation.notaFiscal}",
                textColor:invoiceInformation.destaqueAtraso.isEmpty ? AppColors.blackColor : AppColors.whiteColor,
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
                  textColor:invoiceInformation.destaqueAtraso.isEmpty ? AppColors.blackColor : AppColors.whiteColor,
                  fontSize: 16.sp,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w600,
                  maxLines: 3,
                ),
                TextWidget(
                  "Atraso: ${invoiceInformation.diasAtraso} dias",
                  textColor:invoiceInformation.destaqueAtraso.isEmpty ? AppColors.blackColor : AppColors.whiteColor,
                  fontSize: 16.sp,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
