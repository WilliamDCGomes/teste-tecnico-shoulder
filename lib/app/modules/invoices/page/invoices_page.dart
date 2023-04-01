import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teste_tecnico_shoulder/app/utils/helpers/app_paths.dart';
import '../../../utils/helpers/app_close_controller.dart';
import '../../../utils/sharedWidgets/information_container_widget.dart';
import '../../../utils/sharedWidgets/text_widget.dart';
import '../../../utils/stylePages/app_colors.dart';
import '../controller/invoices_controller.dart';
import '../widget/invoice_card_widget.dart';

class InvoicesPages extends StatefulWidget {
  const InvoicesPages({Key? key}) : super(key: key);

  @override
  State<InvoicesPages> createState() => _InvoicesPagesState();
}

class _InvoicesPagesState extends State<InvoicesPages> {
  late InvoicesController controller;

  @override
  void initState() {
    controller = Get.put(InvoicesController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return AppCloseController.verifyCloseScreen();
      },
      child: SafeArea(
        child: Material(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.backgroundFirstScreenColor,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  height: 25.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.h), bottomRight: Radius.circular(15.h)),
                    border: Border.all(
                      width: 1.w,
                      color: AppColors.lightGrayColor,
                    )
                  ),
                  child: Center(
                    child: Image.asset(
                      AppPaths.shoulderIcon,
                      width: 80.w,
                    ),
                  ),
                ),
                Center(
                  child: InformationContainerWidget(
                    iconPath: AppPaths.invoiceIcon,
                    textColor: AppColors.whiteColor,
                    backgroundColor: AppColors.defaultColor,
                    informationText: "",
                    showBorder: true,
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.5.h,),
                    customContainer: TextWidget(
                      "Entrada de Notas Fiscais",
                      textColor: AppColors.backgroundColor,
                      fontSize: 22.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      maxLines: 2,
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 42.h, right: 5.w, bottom: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        "Notas Fiscais",
                        textColor: AppColors.blackColor,
                        fontSize: 18.sp,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Obx(
                            () => ListView.builder(
                              itemCount: controller.invoiceInformationList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InvoiceCardWidget(
                                  invoiceInformation: controller.invoiceInformationList[index],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      TextWidget(
                        "Sua loja possui notas pendentes de entrada",
                        textColor: AppColors.blackColor,
                        fontSize: 18.sp,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                controller.loadingWithSuccessOrErrorWidget
              ],
            ),
          ),
        ),
      ),
    );
  }
}
