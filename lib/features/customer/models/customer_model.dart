import 'package:veiled_frames/core/enums/user_role.dart';

class CustomerModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String address;
  final String city;
  final String stateProvince;
  final String country;
  final String postalCode;
  final String image;
  final UserRole role;
  final DateTime createdAt;

  CustomerModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.stateProvince,
    required this.country,
    required this.postalCode,
    required this.image,
    required this.role,
    required this.createdAt,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['customer_id'],
      firstName: json['c_fname'],
      lastName: json['c_lastname'],
      email: json['c_email'],
      password: json['c_password'],
      phoneNumber: json['c_phone'],
      address: json['c_address'],
      city: json['c_city'],
      stateProvince: json['c_state_province'],
      country: json['c_country'],
      postalCode: json['c_postalcode'],
      image: json['c_image'],
      role: UserRole.values.firstWhere(
        (e) => e.toString() == 'UserRole.${json['c_role']}',
      ),
      createdAt: DateTime.parse(json['c_created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': id,
      'c_fname': firstName,
      'c_lastname': lastName,
      'c_email': email,
      'c_password': password,
      'c_phone': phoneNumber,
      'c_address': address,
      'c_city': city,
      'c_state_province': stateProvince,
      'c_country': country,
      'c_postalcode': postalCode,
      'c_image': image,
      'c_role': role.toString().split('.').last,
      'c_created_at': createdAt.toIso8601String(),
    };
  }
}
