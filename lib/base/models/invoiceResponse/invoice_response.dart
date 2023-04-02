import 'package:json_annotation/json_annotation.dart';
import '../invoiceInformation/invoice_information.dart';

part 'invoice_response.g.dart';

@JsonSerializable()
class InvoiceResponse {
  final String nomeLoja;
  final List<InvoiceInformation> notas;

  InvoiceResponse({
    required this.nomeLoja,
    required this.notas,
  });

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) => _$InvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceResponseToJson(this);
}