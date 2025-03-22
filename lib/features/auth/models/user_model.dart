import 'package:veiled_frames/core/enums/user_role.dart';

class UserModel {
  final int? id; // Can be customer_id or emp_id
  final int? officeId; // Specific to employees
  final String firstName;
  final String lastName;
  final String email;
  final String? password;
  final String? phoneNumber;
  final String? address;
  final String? city;
  final String? stateProvince;
  final String? country;
  final String? postalCode;
  final String? image;
  final UserRole role;
  final DateTime createdAt; //c_created_at or e_hiredate

  UserModel({
    this.id,
    this.officeId,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.password,
    this.phoneNumber,
    this.address,
    this.city,
    this.stateProvince,
    this.country,
    this.postalCode,
    this.image,
    required this.role,
    required this.createdAt,
  });
}
