import 'package:veiled_frames/core/enums/user_role.dart';
import 'package:veiled_frames/features/auth/models/user_model.dart';

class CustomerModel extends UserModel {
  CustomerModel({
    required int super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required String super.password,
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

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['customer_id'],
      firstName: json['c_fname'],
      lastName: json['c_lname'],
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
}
