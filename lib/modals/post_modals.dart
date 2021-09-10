import 'package:equatable/equatable.dart';

class PostModals extends Equatable {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModals({
    this.userId,
    this.id,
    this.body,
    this.title,
  });

  PostModals.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [userId, id , title, body];
}
