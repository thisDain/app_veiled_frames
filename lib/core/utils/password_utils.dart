import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

String generateSalt([int length = 16]) {
  final random = Random.secure();
  final saltBytes = List<int>.generate(length, (i) => random.nextInt(256));
  return base64Encode(saltBytes);
}

String hashPassword(String password, String salt) {
  final bytes = utf8.encode(password + salt);
  final digest = sha256.convert(bytes);
  return digest.toString();
}
