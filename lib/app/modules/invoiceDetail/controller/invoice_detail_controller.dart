import 'package:get/get.dart';
import 'package:teste_tecnico_shoulder/app/utils/sharedWidgets/loading_with_success_or_error_widget.dart';
import 'package:teste_tecnico_shoulder/base/models/items/items.dart';
import '../../../../base/models/invoiceDetail/invoice_detail.dart';
import '../../../../base/models/invoiceInformation/invoice_information.dart';

class InvoiceDetailController extends GetxController {
  late Rx<InvoiceDetail> invoiceDetail;
  late final InvoiceInformation invoiceInformation;
  late LoadingWithSuccessOrErrorWidget loadingWithSuccessOrErrorWidget;

  InvoiceDetailController(this.invoiceInformation) {
    _initializeVariables();
  }

  @override
  void onInit() async {
    super.onInit();
  }

  _initializeVariables() {
    invoiceDetail = InvoiceDetail(
      numLoja: "MUE017",
      nomeLoja: "MUELLER",
      numLojaOrigem: "CDCARM",
      nomelojaOrigem: "CDCG ARMAZENAGEM",
      notaFiscal: "000293294",
      serie: "3",
      data: "28-03-2023",
      volume: "10",
      itens: [
        Items(
          codigoBarras: "222413904000338",
          pecasNF: "2",
        ),
        Items(
          codigoBarras: "2310119030007G",
          pecasNF: "1",
        ),
        Items(
          codigoBarras: "231011907069940",
          pecasNF: "1",
        ),
        Items(
          codigoBarras: "231011915104636",
          pecasNF: "1",
        ),
        Items(
          codigoBarras: "2310119220079P",
          pecasNF: "1",
        ),
      ],
    ).obs;
    loadingWithSuccessOrErrorWidget = LoadingWithSuccessOrErrorWidget();
  }
}