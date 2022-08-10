import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task/consts.dart';
import 'package:task/home_page/home_screen/modal_bottom_sheet/bloc/login_bloc.dart';

class NumberVerificationView extends StatelessWidget {
  const NumberVerificationView(
    this.bloc, {
    Key? key,
  }) : super(key: key);

  final LoginContentBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // Note: it is necessary to implement a change of the country code
          '${Localization.codeNote} +7 ${bloc.phoneController.text}:',
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 14.0,
            height: 1.42,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
          child: PinCodeTextField(
            appContext: context,
            length: 4,
            autoFocus: true,
            onChanged: bloc.onCodeChanged,
            keyboardType: TextInputType.number,
            mainAxisAlignment: MainAxisAlignment.start,
            cursorColor: AppColors.black,
            cursorWidth: 1.0,
            cursorHeight: 16.0,
            textStyle: const TextStyle(
              color: AppColors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              height: 1.25,
            ),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8.0),
              fieldOuterPadding: const EdgeInsets.only(right: 6.0),
              fieldHeight: 52.0,
              fieldWidth: 46.0,
              borderWidth: 1.0,
              activeColor: AppColors.greyCodeBorder,
              selectedColor: AppColors.black,
              inactiveColor: AppColors.greyCodeBorder,
            ),
          ),
        ),
        Row(
          children: [
            const Text(
              Localization.noCode,
              style: TextStyle(
                color: AppColors.greyText,
                fontWeight: FontWeight.w300,
                fontSize: 14.0,
                height: 1.285,
              ),
            ),
            const SizedBox(width: 6.0),
            InkWell(
              onTap: bloc.resendCodeButton,
              child: const Text(
                Localization.resendCode,
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.underline,
                  fontSize: 14.0,
                  height: 1.285,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 36.0),
          child: InkWell(
            onTap: bloc.moreOptionsButton,
            child: const Text(
              Localization.moreOptions,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w300,
                decoration: TextDecoration.underline,
                fontSize: 14.0,
                height: 1.285,
              ),
            ),
          ),
        ),
        Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          elevation: 5.0,
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 24.0, 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: SvgPicture.asset(
                    AppAssets.icNotify,
                    height: 15.0,
                    width: 12.0,
                  ),
                ),
                const Expanded(
                  child: Text(
                    Localization.sentCodeNote,
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontWeight: FontWeight.w300,
                      fontSize: 14.0,
                      height: 1.285,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
