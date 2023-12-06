// To parse this JSON data, do
//
//     final jazzCashResponse = jazzCashResponseFromJson(jsonString);

import 'dart:convert';

JazzCashResponse jazzCashResponseFromJson(String str) =>
    JazzCashResponse.fromJson(json.decode(str));

String jazzCashResponseToJson(JazzCashResponse data) =>
    json.encode(data.toJson());

class JazzCashResponse {
  JazzCashResponse({
    required this.ppAmount,
    required this.ppAuthCode,
    this.ppBankId,
    required this.ppBillReference,
    required this.ppLanguage,
    required this.ppMerchantId,
    required this.ppResponseCode,
    required this.ppResponseMessage,
    required this.ppRetreivalReferenceNo,
    required this.ppSubMerchantId,
    required this.ppTxnCurrency,
    required this.ppTxnDateTime,
    required this.ppTxnRefNo,
    required this.ppSettlementExpiry,
    required this.ppTxnType,
    required this.ppVersion,
    required this.ppmpf1,
    required this.ppmpf2,
    required this.ppmpf3,
    required this.ppmpf4,
    required this.ppmpf5,
    required this.ppSecureHash,
  });

  String ppAmount;
  String ppAuthCode;
  dynamic ppBankId;
  String ppBillReference;
  String ppLanguage;
  String ppMerchantId;
  String ppResponseCode;
  String ppResponseMessage;
  String ppRetreivalReferenceNo;
  String ppSubMerchantId;
  String ppTxnCurrency;
  String ppTxnDateTime;
  String ppTxnRefNo;
  String ppSettlementExpiry;
  String ppTxnType;
  String ppVersion;
  String ppmpf1;
  String ppmpf2;
  String ppmpf3;
  String ppmpf4;
  String ppmpf5;
  String ppSecureHash;

  factory JazzCashResponse.fromJson(Map<String, dynamic> json) =>
      JazzCashResponse(
        ppAmount: json["pp_Amount"],
        ppAuthCode: json["pp_AuthCode"],
        ppBankId: json["pp_BankID"],
        ppBillReference: json["pp_BillReference"],
        ppLanguage: json["pp_Language"],
        ppMerchantId: json["pp_MerchantID"],
        ppResponseCode: json["pp_ResponseCode"],
        ppResponseMessage: json["pp_ResponseMessage"],
        ppRetreivalReferenceNo: json["pp_RetreivalReferenceNo"],
        ppSubMerchantId: json["pp_SubMerchantId"],
        ppTxnCurrency: json["pp_TxnCurrency"],
        ppTxnDateTime: json["pp_TxnDateTime"],
        ppTxnRefNo: json["pp_TxnRefNo"],
        ppSettlementExpiry: json["pp_SettlementExpiry"],
        ppTxnType: json["pp_TxnType"],
        ppVersion: json["pp_Version"],
        ppmpf1: json["ppmpf_1"],
        ppmpf2: json["ppmpf_2"],
        ppmpf3: json["ppmpf_3"],
        ppmpf4: json["ppmpf_4"],
        ppmpf5: json["ppmpf_5"],
        ppSecureHash: json["pp_SecureHash"],
      );

  Map<String, dynamic> toJson() => {
        "pp_Amount": ppAmount,
        "pp_AuthCode": ppAuthCode,
        "pp_BankID": ppBankId,
        "pp_BillReference": ppBillReference,
        "pp_Language": ppLanguage,
        "pp_MerchantID": ppMerchantId,
        "pp_ResponseCode": ppResponseCode,
        "pp_ResponseMessage": ppResponseMessage,
        "pp_RetreivalReferenceNo": ppRetreivalReferenceNo,
        "pp_SubMerchantId": ppSubMerchantId,
        "pp_TxnCurrency": ppTxnCurrency,
        "pp_TxnDateTime": ppTxnDateTime,
        "pp_TxnRefNo": ppTxnRefNo,
        "pp_SettlementExpiry": ppSettlementExpiry,
        "pp_TxnType": ppTxnType,
        "pp_Version": ppVersion,
        "ppmpf_1": ppmpf1,
        "ppmpf_2": ppmpf2,
        "ppmpf_3": ppmpf3,
        "ppmpf_4": ppmpf4,
        "ppmpf_5": ppmpf5,
        "pp_SecureHash": ppSecureHash,
      };
}
