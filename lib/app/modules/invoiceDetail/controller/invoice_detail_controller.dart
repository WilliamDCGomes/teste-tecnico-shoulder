import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_tecnico_shoulder/app/utils/sharedWidgets/loading_with_success_or_error_widget.dart';
import '../../../../base/models/invoiceDetail/invoice_detail.dart';
import '../../../../base/models/invoiceInformation/invoice_information.dart';
import '../../../../base/services/interface/iinvoice_service.dart';
import '../../../../base/services/invoice_service.dart';
import '../../../utils/sharedWidgets/popups/information_popup.dart';

class InvoiceDetailController extends GetxController {
  late InvoiceDetail? invoiceDetail;
  late final InvoiceInformation invoiceInformation;
  late LoadingWithSuccessOrErrorWidget loadingWithSuccessOrErrorWidget;
  late final IInvoiceService _invoiceService;

  InvoiceDetailController(this.invoiceInformation) {
    _initializeVariables();
  }

  @override
  void onInit() async {
    await Future.delayed(const Duration(milliseconds: 200));
    await _getInvoiceDetail();
    super.onInit();
  }

  _initializeVariables() {
    invoiceDetail = null;
    loadingWithSuccessOrErrorWidget = LoadingWithSuccessOrErrorWidget();
    _invoiceService = InvoiceService();
  }

  Future<void> _getInvoiceDetail() async {
    try {
      await loadingWithSuccessOrErrorWidget.startAnimation();

      invoiceDetail = await _invoiceService.getInvoiceDetail(invoiceInformation);
      update(["invoice-detail"]);

      if (loadingWithSuccessOrErrorWidget.animationController.isAnimating) await loadingWithSuccessOrErrorWidget.stopAnimation(justLoading: true);
    }
    catch(_) {
      if (loadingWithSuccessOrErrorWidget.animationController.isAnimating) await loadingWithSuccessOrErrorWidget.stopAnimation(fail: true);
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const InformationPopup(
            warningMessage: "Erro ao buscar os detalhes da nota fiscal!\nTente novamente mais tarde.",
          );
        },
      );
    }
  }
}