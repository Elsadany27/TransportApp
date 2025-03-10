class PyrollDriverModel {
  String? jsonrpc;
  Null? id;
  Result? result;

  PyrollDriverModel({this.jsonrpc, this.id, this.result});

  PyrollDriverModel.fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jsonrpc'] = this.jsonrpc;
    data['id'] = this.id;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? status;
  Data? data;

  Result({this.status, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? driverId;
  String? driverName;
  List<PayrollData>? payrollData;

  Data({this.driverId, this.driverName, this.payrollData});

  Data.fromJson(Map<String, dynamic> json) {
    driverId = json['driver_id'];
    driverName = json['driver_name'];
    if (json['payroll_data'] != null) {
      payrollData = <PayrollData>[];
      json['payroll_data'].forEach((v) {
        payrollData!.add(new PayrollData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driver_id'] = this.driverId;
    data['driver_name'] = this.driverName;
    if (this.payrollData != null) {
      data['payroll_data'] = this.payrollData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PayrollData {
  int? payrollId;
  double? netWage;
  String? month;

  PayrollData({this.payrollId, this.netWage, this.month});

  PayrollData.fromJson(Map<String, dynamic> json) {
    payrollId = json['payroll_id'];
    netWage = json['net_wage'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payroll_id'] = this.payrollId;
    data['net_wage'] = this.netWage;
    data['month'] = this.month;
    return data;
  }
}
