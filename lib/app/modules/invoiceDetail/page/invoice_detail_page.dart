import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../base/models/invoiceInformation/invoice_information.dart';
import '../../../utils/helpers/app_paths.dart';
import '../../../utils/sharedWidgets/dropdown_widget.dart';
import '../../../utils/sharedWidgets/information_container_widget.dart';
import '../../../utils/sharedWidgets/rich_text_two_different_widget.dart';
import '../../../utils/sharedWidgets/text_widget.dart';
import '../../../utils/stylePages/app_colors.dart';
import '../controller/invoice_detail_controller.dart';

class InvoiceDetailPage extends StatefulWidget {
  final InvoiceInformation invoiceInformation;

  const InvoiceDetailPage({
    Key? key,
    required this.invoiceInformation,
  }) : super(key: key);

  @override
  State<InvoiceDetailPage> createState() => _InvoiceDetailPageState();
}

class _InvoiceDetailPageState extends State<InvoiceDetailPage> {
  late InvoiceDetailController controller;

  @override
  void initState() {
    controller = Get.put(InvoiceDetailController(widget.invoiceInformation));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.defaultColor,
                          size: 3.h,
                        ),
                        Expanded(
                          child: TextWidget(
                            "Nota Fiscal: ${widget.invoiceInformation.notaFiscal}",
                            textColor: AppColors.defaultColor,
                            fontSize: 18.sp,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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
                      "Detalhes da Nota Fiscal",
                      textColor: AppColors.backgroundColor,
                      fontSize: 20.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      maxLines: 2,
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w, top: 38.h, right: 5.w, bottom: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      "Detalhes da Nota Fiscal",
                      textColor: AppColors.blackColor,
                      fontSize: 18.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 15,
                          margin: EdgeInsets.only(top: 2.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.h),
                            side: BorderSide(
                              color: AppColors.defaultColor,
                              width: .5.w,
                            ),
                          ),
                          child: GetBuilder(
                            id: "invoice-detail",
                            init: controller,
                            builder: (_) => Padding(
                              padding: EdgeInsets.all(1.h),
                              child: controller.invoiceDetail != null ? ListView(
                                shrinkWrap: true,
                                children: [
                                  Center(
                                    child: RichTextTwoDifferentWidget(
                                      firstText: controller.invoiceDetail!.nomeLoja,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  RichTextTwoDifferentWidget(
                                    firstText: "Nota Fiscal: ",
                                    secondText: controller.invoiceDetail!.notaFiscal,
                                  ),
                                  SizedBox(height: 2.h),
                                  RichTextTwoDifferentWidget(
                                    firstText: "Origem: ",
                                    secondText: "${controller.invoiceDetail!.nomelojaOrigem} - ${controller.invoiceDetail!.numLojaOrigem}",
                                  ),
                                  SizedBox(height: 2.h),
                                  RichTextTwoDifferentWidget(
                                    firstText: "Destino: ",
                                    secondText: "${controller.invoiceDetail!.nomeLoja} - ${controller.invoiceDetail!.numLoja}",
                                  ),
                                  SizedBox(height: 2.h),
                                  RichTextTwoDifferentWidget(
                                    firstText: "Emissão: ",
                                    secondText: controller.invoiceDetail!.data.replaceAll('-', '/'),
                                  ),
                                  SizedBox(height: 2.h),
                                  RichTextTwoDifferentWidget(
                                    firstText: "Peças: ",
                                    secondText: controller.invoiceDetail!.getQuantityItems,
                                  ),
                                  SizedBox(height: 2.h),
                                  RichTextTwoDifferentWidget(
                                    firstText: "Quantidade de Itens na Lista: ",
                                    secondText: controller.invoiceDetail!.itens.length.toString(),
                                  ),
                                  SizedBox(height: 2.h),
                                  DropdownWidget(
                                    title: "Itens",
                                    items: controller.invoiceDetail!.itens,
                                  ),
                                ],
                              ) : Center(
                                child: TextWidget(
                                  "Sem informações",
                                  textColor: AppColors.blackColor,
                                  fontSize: 16.sp,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              controller.loadingWithSuccessOrErrorWidget
            ],
          ),
        ),
      ),
    );
  }
}
