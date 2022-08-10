import 'package:flutter/material.dart';

enum Services {
  eMail,
  apple,
  google,
  facebook,
}

class SignUpServices {
  SignUpServices._({
    required this.type,
    required this.title,
    required this.iconPath,
  });

  factory SignUpServices({
    required Services type,
    required GestureTapCallback onTap,
    required String title,
    required String iconPath,
  }) {
    return SignUpServices._(
      type: type,
      title: title,
      iconPath: iconPath,
    );
  }

  final Services type;
  final String title;
  final String iconPath;
}
