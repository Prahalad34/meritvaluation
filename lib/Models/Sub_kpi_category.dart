class Subcategory {
  List<Resulteded>? result;
  String? message;
  String? status;

  Subcategory({this.result, this.message, this.status});

  Subcategory.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Resulteded>[];
      json['result'].forEach((v) {
        result!.add(new Resulteded.fromJson(v));
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

class Resulteded {
  String? id;
  String? categoryId;
  String? name;
  String? dateTime;

  Resulteded({this.id, this.categoryId, this.name, this.dateTime});

  Resulteded.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['date_time'] = this.dateTime;
    return data;
  }
}