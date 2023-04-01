// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceInformation _$InvoiceInformationFromJson(Map<String, dynamic> json) =>
    InvoiceInformation(
      numLoja: json['numLoja'] as String,
      notaFiscal: json['notaFiscal'] as String,
      serie: json['serie'] as String,
      data: json['data'] as String,
      diasAtraso: json['diasAtraso'] as String,
      destaqueAtraso: json['destaqueAtraso'] as String,
    );

Map<String, dynamic> _$InvoiceInformationToJson(InvoiceInformation instance) =>
    <String, dynamic>{
      'numLoja': instance.numLoja,
      'notaFiscal': instance.notaFiscal,
      'serie': instance.serie,
      'data': instance.data,
      'diasAtraso': instance.diasAtraso,
      'destaqueAtraso': instance.destaqueAtraso,
    };
