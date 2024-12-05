class Kpidata {
  List<Resulted>? result;
  String? message;
  String? status;

  Kpidata({this.result, this.message, this.status});

  Kpidata.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Resulted>[];
      json['result'].forEach((v) {
        result!.add(new Resulted.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Resulted {
  String? id;
  String? categoryName;
  String? status;
  String? dateTime;

  Resulted({this.id, this.categoryName, this.status, this.dateTime});

  Resulted.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['status'] = this.status;
    data['date_time'] = this.dateTime;
    return data;
  }
}