import 'package:veiled_frames/core/enums/user_role.dart';
import 'package:veiled_frames/features/auth/models/user_model.dart';

class EmployeeModel extends UserModel {
  EmployeeModel({
    required int super.id,
    super.officeId,
    required super.firstName,
    required super.lastName,
    required super.email,
    super.phoneNumber,
    super.address,
    super.city,
    super.stateProvince,
    super.country,
    super.postalCode,
    super.image,
    required super.role,
    required super.createdAt,
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
      role: UserRole.values.firstWhere(
        (e) => e.toString() == 'UserRole.${json['e_role']}',
      ),
      createdAt: DateTime.parse(json['e_hiredate']),
    );
  }
}
