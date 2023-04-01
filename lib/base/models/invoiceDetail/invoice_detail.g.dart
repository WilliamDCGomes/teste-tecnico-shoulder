// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceDetail _$InvoiceDetailFromJson(Map<String, dynamic> json) =>
    InvoiceDetail(
      numLoja: json['numLoja'] as String,
      nomeLoja: json['nomeLoja'] as String,
      numLojaOrigem: json['numLojaOrigem'] as String,
      nomelojaOrigem: json['nomelojaOrigem'] as String,
      notaFiscal: json['notaFiscal'] as String,
      serie: json['serie'] as String,
      data: json['data'] as String,
      volume: json['volume'] as String,
      itens: (json['itens'] as List<dynamic>)
          .map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceDetailToJson(InvoiceDetail instance) =>
    <String, dynamic>{
      'numLoja': instance.numLoja,
      'nomeLoja': instance.nomeLoja,
      'numLojaOrigem': instance.numLojaOrigem,
      'nomelojaOrigem': instance.nomelojaOrigem,
      'notaFiscal': instance.notaFiscal,
      'serie': instance.serie,
      'data': instance.data,
      'volume': instance.volume,
      'itens': instance.itens,
    };
