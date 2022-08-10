import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task/consts.dart';
import 'package:task/model/sign_up_services.dart';

enum LoginStep {
  inputNumber,
  verify,
}

abstract class LoginContentBloc {
  List<SignUpServices> get services;

  BehaviorSubject<LoginStep> get stepsStream;

  BehaviorSubject<String> get titleStream;

  BehaviorSubject<List<SignUpServices>> get servicesStream;

  BehaviorSubject<bool?> get validationStream;

  TextEditingController get phoneController;

  void dispose();

  void continueButton();

  void onServiceTap(Services service);

  void onCodeChanged(String coed);

  void resendCodeButton();

  void moreOptionsButton();
}

class LoginContentBlocImpl implements LoginContentBloc {
  LoginContentBlocImpl() {
    _init();
  }

  late BehaviorSubject<LoginStep> _stepsStreamController;
  late BehaviorSubject<String> _titleStreamController;
  late BehaviorSubject<List<SignUpServices>> _servicesStreamController;
  late BehaviorSubject<bool?> _validationStreamController;

  late TextEditingController _textEditingController;

  @override
  final services = <SignUpServices>[
    SignUpServices(
      type: Services.eMail,
      title: Localization.signInWithEmail,
      onTap: () {},
      iconPath: AppAssets.icEmail,
    ),
    SignUpServices(
      type: Services.apple,
      title: Localization.signInWithApple,
      onTap: () {},
      iconPath: AppAssets.icApple,
    ),
    SignUpServices(
      type: Services.google,
      title: Localization.signInWithGoogle,
      onTap: () {},
      iconPath: AppAssets.icGoogle,
    ),
    SignUpServices(
      type: Services.facebook,
      title: Localization.signInWithFacebook,
      onTap: () {},
      iconPath: AppAssets.icFacebook,
    ),
  ];

  @override
  BehaviorSubject<LoginStep> get stepsStream => _stepsStreamController;

  @override
  BehaviorSubject<String> get titleStream => _titleStreamController;

  @override
  BehaviorSubject<List<SignUpServices>> get servicesStream => _servicesStreamController;

  @override
  BehaviorSubject<bool?> get validationStream => _validationStreamController;

  @override
  TextEditingController get phoneController => _textEditingController;

  @override
  void dispose() {
    _stepsStreamController.close();
    _titleStreamController.close();
    _servicesStreamController.close();
    _textEditingController.dispose();
  }

  @override
  void continueButton() {
    _titleStreamController.add(Localization.verifyCode);
    _stepsStreamController.add(LoginStep.verify);
  }

  @override
  void onServiceTap(Services service) {
    //ToDo: implement onServiceTap
  }

  @override
  void onCodeChanged(String coed) {
    // TODO: implement onCodeChanged
  }

  @override
  void resendCodeButton() {
    // TODO: implement resendCodeButton
  }

  @override
  void moreOptionsButton() {
    // TODO: implement resendCodeButton
  }

  void _init() {
    _stepsStreamController = BehaviorSubject<LoginStep>()..add(LoginStep.inputNumber);
    _titleStreamController = BehaviorSubject<String>()..add(Localization.signInOrSignUp);
    _servicesStreamController = BehaviorSubject<List<SignUpServices>>()..add(services);
    _validationStreamController = BehaviorSubject<bool?>();
    _textEditingController = MaskedTextController(mask: '000 000-00-00')
      ..addListener(() {
        _validationStreamController.add(_textEditingController.text.length == 13 ? true : null);
      });
  }
}
