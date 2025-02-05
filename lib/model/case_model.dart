import 'dart:convert';

class CaseModel {
  final String date;
  final String time;
  final String nameUser;
  final String patientType;
  final String serviceType;
  final String abilityToTravel;
  final String diagnosis;
  final String phoneUser;
  final String hospital;
  final String nameSurname1;
  final String patients1;
  final String phoneNumber1;
  final String nameSurname2;
  final String patients2;
  final String phoneNumber2;
  final String requestInformation;
  final String locationStart;
  final String provinceStart;
  final String districtStart;
  final String subdistrictStart;
  final String landmarkStart;
  final String locationEnd;
  final String provinceEnd;
  final String districtEnd;
  final String subdistrictEnd;
  final String img;

  CaseModel({
    required this.date,
    required this.time,
    required this.nameUser,
    required this.patientType,
    required this.serviceType,
    required this.abilityToTravel,
    required this.diagnosis,
    required this.phoneUser,
    required this.hospital,
    required this.nameSurname1,
    required this.patients1,
    required this.phoneNumber1,
    required this.nameSurname2,
    required this.patients2,
    required this.phoneNumber2,
    required this.requestInformation,
    required this.locationStart,
    required this.provinceStart,
    required this.districtStart,
    required this.subdistrictStart,
    required this.landmarkStart,
    required this.locationEnd,
    required this.provinceEnd,
    required this.districtEnd,
    required this.subdistrictEnd,
    required this.img,
  });

  // 🔹 แปลงจาก Map -> CaseModel
  factory CaseModel.fromMap(Map<String, dynamic> map) {
    return CaseModel(
      date: map["date"] ?? "",
      time: map["time"] ?? "",
      nameUser: map["nameUser"] ?? "",
      patientType: map["patientType"] ?? "",
      serviceType: map["serviceType"] ?? "",
      abilityToTravel: map["abilityToTravel"] ?? "",
      diagnosis: map["diagnosis"] ?? "",
      phoneUser: map["phoneUser"] ?? "",
      hospital: map["hospital"] ?? "",
      nameSurname1: map["nameSurname1"] ?? "",
      patients1: map["patients1"] ?? "",
      phoneNumber1: map["phoneNumber1"] ?? "",
      nameSurname2: map["nameSurname2"] ?? "",
      patients2: map["patients2"] ?? "",
      phoneNumber2: map["phoneNumber2"] ?? "",
      requestInformation: map["requestInformation"] ?? "",
      locationStart: map["locationStart"] ?? "",
      provinceStart: map["provinceStart"] ?? "",
      districtStart: map["districtStart"] ?? "",
      subdistrictStart: map["subdistrictStart"] ?? "",
      landmarkStart: map["landmarkStart"] ?? "",
      locationEnd: map["locationEnd"] ?? "",
      provinceEnd: map["provinceEnd"] ?? "",
      districtEnd: map["districtEnd"] ?? "",
      subdistrictEnd: map["subdistrictEnd"] ?? "",
      img: map["img"] ?? "",
    );
  }

  // 🔹 แปลงจาก CaseModel -> Map
  Map<String, dynamic> toMap() {
    return {
      "date": date,
      "time": time,
      "nameUser": nameUser,
      "patientType": patientType,
      "serviceType": serviceType,
      "abilityToTravel": abilityToTravel,
      "diagnosis": diagnosis,
      "phoneUser": phoneUser,
      "hospital": hospital,
      "nameSurname1": nameSurname1,
      "patients1": patients1,
      "phoneNumber1": phoneNumber1,
      "nameSurname2": nameSurname2,
      "patients2": patients2,
      "phoneNumber2": phoneNumber2,
      "requestInformation": requestInformation,
      "locationStart": locationStart,
      "provinceStart": provinceStart,
      "districtStart": districtStart,
      "subdistrictStart": subdistrictStart,
      "landmarkStart": landmarkStart,
      "locationEnd": locationEnd,
      "provinceEnd": provinceEnd,
      "districtEnd": districtEnd,
      "subdistrictEnd": subdistrictEnd,
      "img": img,
    };
  }

  // 🔹 แปลงจาก CaseModel -> JSON String (สำหรับส่ง API)
  String toJson() => jsonEncode(toMap());

  // 🔹 แปลงจาก JSON String -> CaseModel
  factory CaseModel.fromJson(String source) => CaseModel.fromMap(jsonDecode(source));
}
