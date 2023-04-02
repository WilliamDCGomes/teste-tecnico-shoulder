import 'package:teste_tecnico_shoulder/base/models/invoiceResponse/invoice_response.dart';
import '../models/invoiceDetail/invoice_detail.dart';
import '../models/invoiceInformation/invoice_information.dart';
import 'base/base_service.dart';
import 'interface/iinvoice_service.dart';

class InvoiceService extends BaseService implements IInvoiceService {
  @override
  Future<InvoiceResponse?> getOpenInvoices(storeNumber) async {
    try {
      final token = await getToken();
      final url = '${baseUrlApi}buscarNotasPendentes/';
      final response = await get(url, query: {'numLoja': storeNumber}, headers: {'x-hubin-access-token': token});

      if (hasErrorResponse(response)) throw Exception();

      return InvoiceResponse.fromJson(response.body);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<InvoiceDetail?> getInvoiceDetail(InvoiceInformation invoiceInformation) async {
    try {
      final token = await getToken();

      String storeNumber = invoiceInformation.numLoja.substring(3);

      final url = '${baseUrlApi}buscarDestalheNotaPendente/${int.parse(storeNumber).toString()}/${invoiceInformation.notaFiscal}/${invoiceInformation.serie}/${invoiceInformation.data.replaceAll('/', '-')}';
      final response = await get(
        url,
        headers: {'x-hubin-access-token': token},
      );

      if (hasErrorResponse(response)) throw Exception();

      return InvoiceDetail.fromJson(response.body);
    } catch (_) {
      return null;
    }
  }
}
