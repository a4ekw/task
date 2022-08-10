import 'package:flutter/material.dart';

class Localization {
  static const String suisseIntl = 'Suisse Intl';
  static const String yourProfile = 'Ваш профиль';
  static const String loginNotice =
      'Войдите в аккаунт и начните поддерживать  и создавать проекты.';
  static const String loginButton = 'Войти';
  static const String noAccount = 'Нет аккаунта?';
  static const String signUp = 'Зарегистрируйтесь';
  static const String signInOrSignUp = 'Войдите или зарегистрируйтесь';
  static const String countryOrRegion = 'Страна/регион';
  static const String codeRussia = 'Россия (+7)';
  static const String phoneNumber = 'Номер телефона';
  static const String smsVerificationNote =
      'Мы позвоним вам или отправим SMS, чтобы подтвердить номер телефона. Применяются стандартные условия вашего тарифа на прием сообщений и передачу данных.';
  static const String resume = 'Продолжить';
  static const String codeNote = 'Введите код, отправленный на ';
  static const String verifyCode = 'Подтвердите номер';
  static const String or = 'или';
  static const String noCode = 'Не получили код?';
  static const String resendCode = 'Отправить еще раз';
  static const String moreOptions = 'Другие варианты';
  static const String sentCodeNote = 'Мы отправили вам SMS с кодом подтверждения.';

  static const String signInWithEmail = 'С помощью эл. почты';
  static const String signInWithApple = 'Продолжить с  Apple';
  static const String signInWithGoogle = 'Продолжить через  Google';
  static const String signInWithFacebook = 'Продолжить через  Facebook';
}

class AppColors {
  static const Color white = Colors.white;
  static const Color black = Color.fromRGBO(44, 44, 44, 1);
  static const Color red = Color.fromRGBO(255, 125, 90, 1);
  static const Color greyText = Color.fromRGBO(94, 94, 94, 1);
  static const Color greyLight = Color.fromRGBO(209, 209, 214, 1);
  static const Color greyBorder = Color.fromRGBO(209, 209, 214, 1);
  static const Color greyButton = Color.fromRGBO(224, 224, 224, 1);
  static const Color greyCodeBorder = Color.fromRGBO(200, 200, 200, 1);
}

class AppAssets {
  static const String _basePath = 'assets/icons';
  static const String icClose = '$_basePath/ic_close.svg';
  static const String icArrowDown = '$_basePath/ic_arrow_down.svg';
  static const String icEmail = '$_basePath/ic_email.svg';
  static const String icApple = '$_basePath/ic_apple.svg';
  static const String icGoogle = '$_basePath/ic_google.svg';
  static const String icFacebook = '$_basePath/ic_facebook.svg';
  static const String icNotify = '$_basePath/ic_notify.svg';
}
