import 'package:teste_tecnico_shoulder/base/models/invoiceDetail/invoice_detail.dart';
import 'package:teste_tecnico_shoulder/base/models/invoiceResponse/invoice_response.dart';
import '../../models/invoiceInformation/invoice_information.dart';

abstract class IInvoiceService {
  Future<InvoiceResponse?> getOpenInvoices(String storeNumber);

  Future<InvoiceDetail?> getInvoiceDetail(InvoiceInformation invoiceInformation);
}