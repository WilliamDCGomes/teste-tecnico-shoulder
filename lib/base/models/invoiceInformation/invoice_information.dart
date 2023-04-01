import 'package:json_annotation/json_annotation.dart';

part 'invoice_information.g.dart';

@JsonSerializable()
class InvoiceInformation {
  final String numLoja;
  final String notaFiscal;
  final String serie;
  final String data;
  final String diasAtraso;
  final String destaqueAtraso;

  InvoiceInformation({
    required this.numLoja,
    required this.notaFiscal,
    required this.serie,
    required this.data,
    required this.diasAtraso,
    required this.destaqueAtraso,
  });

  factory InvoiceInformation.fromJson(Map<String, dynamic> json) => _$InvoiceInformationFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceInformationToJson(this);
}