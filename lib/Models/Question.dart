class Question {
  List<Result>? result;
  String? message;
  String? status;

  Question({this.result, this.message, this.status});

  Question.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Result {
  String? id;
  String? companyId;
  String? surveyId;
  String? question;
  String? title;
  String? optionValue;
  String? type;
  String? importanceOfInformation;
  String? impactOnBusinessValue;
  String? slideStartValue;
  String? slideEndValue;
  String? slideDiffValue;
  String? slideType;
  String? ordernumber;
  String? dateTime;
  List<QuestionOption>? questionOption;
  String? serveyName;

  Result(
      {this.id,
        this.companyId,
        this.surveyId,
        this.question,
        this.title,
        this.optionValue,
        this.type,
        this.importanceOfInformation,
        this.impactOnBusinessValue,
        this.slideStartValue,
        this.slideEndValue,
        this.slideDiffValue,
        this.slideType,
        this.dateTime,
        this.questionOption,
        this.ordernumber,
        this.serveyName});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    surveyId = json['survey_id'];
    question = json['question'];
    title = json['Title'];
    optionValue = json['option_value'];
    type = json['type'];
    importanceOfInformation = json['Importance_of_Information'];
    impactOnBusinessValue = json['Impact_on_Business_Value'];
    slideStartValue = json['slide_start_value'];
    slideEndValue = json['slide_end_value'];
    slideDiffValue = json['slide_diff_value'];
    slideType = json['slide_type'];
    ordernumber = json['order_number'];
    dateTime = json['date_time'];
    if (json['question_option'] != null) {
      questionOption = <QuestionOption>[];
      json['question_option'].forEach((v) {
        questionOption!.add(QuestionOption.fromJson(v));
      });
    }
    serveyName = json['servey_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['survey_id'] = surveyId;
    data['question'] = question;
    data['Title'] = title;
    data['option_value'] = optionValue;
    data['type'] = type;
    data['Importance_of_Information'] = importanceOfInformation;
    data['Impact_on_Business_Value'] = impactOnBusinessValue;
    data['slide_start_value'] = slideStartValue;
    data['slide_end_value'] = slideEndValue;
    data['slide_diff_value'] = slideDiffValue;
    data['slide_type'] = slideType;
    data['order_number'] = ordernumber;
    data['date_time'] = dateTime;
    if (questionOption != null) {
      data['question_option'] = questionOption!.map((v) => v.toJson()).toList();
    }
    data['servey_name'] = serveyName;
    return data;
  }
}

class QuestionOption {
  String? id;
  String? qId;
  String? qTId;
  String? tOption;
  String? totalCount;

  QuestionOption({this.id, this.qId, this.qTId, this.tOption, this.totalCount});

  QuestionOption.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qId = json['q_id'];
    qTId = json['q_t_id'];
    tOption = json['t_option'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['q_id'] = qId;
    data['q_t_id'] = qTId;
    data['t_option'] = tOption;
    data['total_count'] = totalCount;
    return data;
  }
}
