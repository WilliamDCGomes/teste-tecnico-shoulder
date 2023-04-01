import 'package:json_annotation/json_annotation.dart';
import '../items/items.dart';

part 'invoice_detail.g.dart';

@JsonSerializable()
class InvoiceDetail {
  final String numLoja;
  final String nomeLoja;
  final String numLojaOrigem;
  final String nomelojaOrigem;
  final String notaFiscal;
  final String serie;
  final String data;
  final String volume;
  final List<Items> itens;

  InvoiceDetail({
    required this.numLoja,
    required this.nomeLoja,
    required this.numLojaOrigem,
    required this.nomelojaOrigem,
    required this.notaFiscal,
    required this.serie,
    required this.data,
    required this.volume,
    required this.itens,
  });

  String get getQuantityItems {
    int quantity = 0;
    for (var element in itens) {
      quantity += int.tryParse(element.pecasNF) ?? 0;
    }
    return quantity.toString();
  }

  factory InvoiceDetail.fromJson(Map<String, dynamic> json) => _$InvoiceDetailFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceDetailToJson(this);
}