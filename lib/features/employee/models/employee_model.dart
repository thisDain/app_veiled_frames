import 'package:veiled_frames/core/enums/user_role.dart';

class EmployeeModel {
  final int id;
  final int officeId;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String address;
  final String city;
  final String stateProvince;
  final String country;
  final String postalCode;
  final String image;
  final UserRole role;
  final DateTime hireDate;

  EmployeeModel({
    required this.id,
    required this.officeId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.stateProvince,
    required this.country,
    required this.postalCode,
    required this.image,
    required this.role,
    required this.hireDate,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['emp_id'],
      officeId: json['office_id'],
      firstName: json['e_fname'],
      lastName: json['e_lname'],
      email: json['e_email'],
      phoneNumber: json['e_phone'],
      address: json['e_address'],
      city: json['e_city'],
      stateProvince: json['e_state_province'],
      country: json['e_country'],
      postalCode: json['e_postalcode'],
      image: json['e_image'],
      role: UserRole.values[json['e_role']],
      hireDate: DateTime.parse(json['e_hiredate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'emp_id': id,
      'office_id': officeId,
      'e_fname': firstName,
      'e_lname': lastName,
      'e_email': email,
      'e_phone': phoneNumber,
      'e_address': address,
      'e_city': city,
      'e_state_province': stateProvince,
      'e_country': country,
      'e_postalcode': postalCode,
      'e_image': image,
      'e_role': role.index,
      'e_hiredate': hireDate.toIso8601String(),
    };
  }
}
