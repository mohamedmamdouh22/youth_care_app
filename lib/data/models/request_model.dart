class RequestModel {
  String stdName, stdNatId, stdEmail, stdPhone, stdDep, stdFerka;
  RequestModel(
    this.stdName,
    this.stdNatId,
    this.stdEmail,
    this.stdPhone,
    this.stdDep,
    this.stdFerka,
  );
  
  factory RequestModel.fromJson(jsonData)
  {
    return RequestModel(
      jsonData['name'],
      jsonData['natId'],
      jsonData['email'],
      jsonData['phone'],
      jsonData['depart'],
      jsonData['ferka'],
    );
  }
}
