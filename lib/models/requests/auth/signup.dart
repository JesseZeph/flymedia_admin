import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  final String fullname;
  final String email;
  final String password;

  SignUpModel({
    required this.fullname,
    required this.email,
    required this.password,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "email": email,
        "password": password,
      };
}
