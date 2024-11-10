import 'package:perfection/features/users/model/support.dart';

class AllUserModel {
  late int id;
  late String email;
  late String first_name;
  late String last_name;
  late String avatar;
  late Support? support;

  AllUserModel({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
    required this.support,
  });


  factory AllUserModel.fromJson(Map<String, dynamic> json) {

    return AllUserModel(
      id: json['id'].toInt(),
      email: json['email'].toString(),
      first_name: json['first_name'].toString(),
      last_name: json['last_name'].toString(),
      avatar: json['avatar'].toString(),
      support: json['support'] != null ? Support.fromJson(json['support']) : null,
    );
  }
}