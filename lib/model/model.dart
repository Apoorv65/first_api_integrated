

class PostResponseModel {
  int? userId;
  int? id;
  String? title;
  String? body;
  String? error;

  PostResponseModel({this.userId, this.id, this.title, this.body});

  PostResponseModel.withError(String errorMessage){
    error = errorMessage;
  }

  PostResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}


//3.0.5