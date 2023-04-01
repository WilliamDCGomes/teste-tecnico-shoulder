import 'package:get/get.dart';
import 'package:teste_tecnico_shoulder/app/utils/sharedWidgets/loading_with_success_or_error_widget.dart';
import '../../../../base/models/invoiceInformation/invoice_information.dart';

class InvoicesController extends GetxController {
  late RxList<InvoiceInformation> invoiceInformationList;
  late LoadingWithSuccessOrErrorWidget loadingWithSuccessOrErrorWidget;

  InvoicesController() {
    _initializeVariables();
  }

  @override
  void onInit() async {
    super.onInit();
  }

  _initializeVariables() {
    invoiceInformationList = <InvoiceInformation>[
      InvoiceInformation(
        data: "28-03-2023",
        destaqueAtraso: "#F44336",
        diasAtraso: "2",
        notaFiscal: "000293294",
        numLoja: "MUE017",
        serie: "3",
      ),
      InvoiceInformation(
        data: "28-03-2023",
        destaqueAtraso: "",
        diasAtraso: "2",
        notaFiscal: "000012714",
        numLoja: "MUE017",
        serie: "8",
      ),
    ].obs;
    loadingWithSuccessOrErrorWidget = LoadingWithSuccessOrErrorWidget();
  }
}