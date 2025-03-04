class RouteModel {
  String? jsonrpc;
  dynamic id; // Change this to dynamic or appropriate type
  Result? result;

  RouteModel({this.jsonrpc, this.id, this.result});

  RouteModel.fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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
  List<Route>? routes; // Assuming Route is a defined class

  Data({this.driverId, this.driverName, this.routes});

  Data.fromJson(Map<String, dynamic> json) {
    driverId = json['driver_id'];
    driverName = json['driver_name'];
    if (json['routes'] != null) {
      routes = <Route>[];
      json['routes'].forEach((v) {
        routes!.add(Route.fromJson(v)); // Assuming Route has fromJson
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['driver_id'] = this.driverId;
    data['driver_name'] = this.driverName;
    if (this.routes != null) {
      data['routes'] = this.routes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Routes {
  int? planningId;
  Route? route;
  Bus? bus;
  String? date;
  String? startTime;
  String? endTime;

  Routes({this.planningId, this.route, this.bus, this.date, this.startTime, this.endTime});

  Routes.fromJson(Map<String, dynamic> json) {
    planningId = json['planning_id'];
    route = json['route'] != null ? Route.fromJson(json['route']) : null;
    bus = json['bus'] != null ? Bus.fromJson(json['bus']) : null;
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['planning_id'] = this.planningId;
    if (this.route != null) {
      data['route'] = this.route!.toJson();
    }
    if (this.bus != null) {
      data['bus'] = this.bus!.toJson();
    }
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}

class Route {
  int? id;
  String? name;
  List<Point>? points; // Change Null to Point or whatever type

  Route({this.id, this.name, this.points});

  Route.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['points'] != null) {
      points = <Point>[];
      json['points'].forEach((v) {
        points!.add(Point.fromJson(v)); // Assuming Point has fromJson
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.points != null) {
      data['points'] = this.points!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Point { // Define a Point class or appropriate type
  double? latitude;
  double? longitude;

  Point({this.latitude, this.longitude});

  Point.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Bus {
  int? id;
  String? name;

  Bus({this.id, this.name});

  Bus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}