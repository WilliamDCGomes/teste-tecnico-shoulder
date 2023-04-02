import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_tecnico_shoulder/app/utils/sharedWidgets/loading_with_success_or_error_widget.dart';
import 'package:teste_tecnico_shoulder/base/models/invoiceResponse/invoice_response.dart';
import '../../../../base/services/interface/iinvoice_service.dart';
import '../../../../base/services/invoice_service.dart';
import '../../../utils/sharedWidgets/popups/information_popup.dart';

class InvoicesController extends GetxController {
  late InvoiceResponse? invoiceResponse;
  late LoadingWithSuccessOrErrorWidget loadingWithSuccessOrErrorWidget;
  late final IInvoiceService _invoiceService;

  InvoicesController() {
    _initializeVariables();
  }

  @override
  void onInit() async {
    await Future.delayed(const Duration(milliseconds: 200));
    await _getOpenInvoices();
    super.onInit();
  }

  _initializeVariables() {
    invoiceResponse = null;
    loadingWithSuccessOrErrorWidget = LoadingWithSuccessOrErrorWidget();
    _invoiceService = InvoiceService();
  }

  Future<void> _getOpenInvoices() async {
    try {
      await loadingWithSuccessOrErrorWidget.startAnimation();

      invoiceResponse = await _invoiceService.getOpenInvoices("MUE017");
      update(["invoices-list"]);

      if (loadingWithSuccessOrErrorWidget.animationController.isAnimating) await loadingWithSuccessOrErrorWidget.stopAnimation(justLoading: true);
    }
    catch(_) {
      if (loadingWithSuccessOrErrorWidget.animationController.isAnimating) await loadingWithSuccessOrErrorWidget.stopAnimation(fail: true);
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const InformationPopup(
            warningMessage: "Erro ao buscar as notas fiscais!\nTente novamente mais tarde.",
          );
        },
      );
    }
  }
}