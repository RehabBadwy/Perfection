import 'package:perfection/features/users/model/support.dart';

import 'all_user_model.dart';

class UserModel{
  late int page;
  late int per_page;
  late int total;
  late int total_pages;
  late List<AllUserModel> data;
  late Support? support;

  UserModel({
    required this.page,
    required this.per_page,
    required this.total,
    required this.total_pages,
    required this.data,
    required this.support,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      page: json['page'],
      per_page: json['per_page'],
      total: json['total'],
      total_pages: json['total_pages'],
      data: (json['data'] as List<dynamic>?)?.map((userJson) => AllUserModel.fromJson(userJson)).toList() ?? [],
      support: json['support'] != null ? Support.fromJson(json['support']) : null,
    );
  }
}