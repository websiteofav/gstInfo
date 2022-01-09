// To parse this JSON data, do
//
//     final GSTResponseModel = GSTResponseModelFromJson(jsonString);

class GSTResponseModel {
  GSTResponseModel({
    this.success,
  });

  dynamic success;

  GSTResponseModel.fromJson(Map<String, dynamic> json) {
    success = Success.fromJson(json);
  }

  Map<String, dynamic> toJson() => {
        "Success": success.toJson(),
      };
}

class Success {
  Success({
    required this.gstNumber,
    required this.comapnyName,
    required this.businessPlace,
    required this.additionalPlace,
    required this.stateJurisdiction,
    required this.centerJurisdiction,
    required this.taxPayerType,
    required this.businessCondition,
    required this.registartionDate,
    required this.cancellationDate,
  });

  final String gstNumber;
  final String comapnyName;
  final String businessPlace;
  final String additionalPlace;
  final String stateJurisdiction;
  final String centerJurisdiction;
  final String taxPayerType;
  final String businessCondition;
  final String registartionDate;
  final String cancellationDate;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
        gstNumber: json["gstNumber"],
        comapnyName: json["comapnyName"],
        businessPlace: json["businessPlace"],
        additionalPlace: json["additionalPlace"],
        stateJurisdiction: json["stateJurisdiction"],
        centerJurisdiction: json["centerJurisdiction"],
        taxPayerType: json["taxPayerType"],
        businessCondition: json["businessCondition"],
        registartionDate: json["registartionDate"],
        cancellationDate: json["cancellationDate"],
      );

  Map<String, dynamic> toJson() => {
        "gstNumber": gstNumber,
        "comapnyName": comapnyName,
        "businessPlace": businessPlace,
        "additionalPlace": additionalPlace,
        "stateJurisdiction": stateJurisdiction,
        "centerJurisdiction": centerJurisdiction,
        "taxPayerType": taxPayerType,
        "businessCondition": businessCondition,
        "registartionDate": registartionDate,
        "cancellationDate": cancellationDate,
      };
}
