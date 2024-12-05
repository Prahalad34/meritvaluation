class Dashbord {
  String? cell1;
  String? cell2;
  String? cell3;
  String? cell4;
  String? cell5;
  String? cell6;
  String? cell7;
  String? cell8;
  String? cell9;
  String? cell10;
  String? cell11;
  String? cell12;
  String? cell13;
  String? cell14;
  String? cell15;
  String? cell16;
  String? cell17;
  String? cell18;
  String? cell19;
  String? cell20;
  String? cell21;
  String? cell22;
  String? cell23;
  String? cell24;
  String? result;
  String? message;
  String? status;

  Dashbord(
      {this.cell1,
        this.cell2,
        this.cell3,
        this.cell4,
        this.cell5,
        this.cell6,
        this.cell7,
        this.cell8,
        this.cell9,
        this.cell10,
        this.cell11,
        this.cell12,
        this.cell13,
        this.cell14,
        this.cell15,
        this.cell16,
        this.cell17,
        this.cell18,
        this.cell19,
        this.cell20,
        this.cell21,
        this.cell22,
        this.cell23,
        this.cell24,
        this.result,
        this.message,
        this.status});

  Dashbord.fromJson(Map<String, dynamic> json) {
    cell1 = json['cell_1'];
    cell2 = json['cell_2'];
    cell3 = json['cell_3'];
    cell4 = json['cell_4'];
    cell5 = json['cell_5'];
    cell6 = json['cell_6'];
    cell7 = json['cell_7'];
    cell8 = json['cell_8'];
    cell9 = json['cell_9'];
    cell10 = json['cell_10'];
    cell11 = json['cell_11'];
    cell12 = json['cell_12'];
    cell13 = json['cell_13'];
    cell14 = json['cell_14'];
    cell15 = json['cell_15'];
    cell16 = json['cell_16'];
    cell17 = json['cell_17'];
    cell18 = json['cell_18'];
    cell19 = json['cell_19'];
    cell20 = json['cell_20'];
    cell21 = json['cell_21'];
    cell22 = json['cell_22'];
    cell23 = json['cell_23'];
    cell24 = json['cell_24'];
    result = json['result'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cell_1'] = this.cell1;
    data['cell_2'] = this.cell2;
    data['cell_3'] = this.cell3;
    data['cell_4'] = this.cell4;
    data['cell_5'] = this.cell5;
    data['cell_6'] = this.cell6;
    data['cell_7'] = this.cell7;
    data['cell_8'] = this.cell8;
    data['cell_9'] = this.cell9;
    data['cell_10'] = this.cell10;
    data['cell_11'] = this.cell11;
    data['cell_12'] = this.cell12;
    data['cell_13'] = this.cell13;
    data['cell_14'] = this.cell14;
    data['cell_15'] = this.cell15;
    data['cell_16'] = this.cell16;
    data['cell_17'] = this.cell17;
    data['cell_18'] = this.cell18;
    data['cell_19'] = this.cell19;
    data['cell_20'] = this.cell20;
    data['cell_21'] = this.cell21;
    data['cell_22'] = this.cell22;
    data['cell_23'] = this.cell23;
    data['cell_24'] = this.cell24;
    data['result'] = this.result;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}