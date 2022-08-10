import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/consts.dart';
import 'package:task/home_page/home_screen/modal_bottom_sheet/bloc/login_bloc.dart';
import 'package:task/model/sign_up_services.dart';

class MainLoginView extends StatelessWidget {
  const MainLoginView(
    this.bloc, {
    Key? key,
  }) : super(key: key);

  final LoginContentBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: AppColors.greyBorder)),
          padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 15.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 14.0,
                  right: 18.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          Localization.countryOrRegion,
                          style: TextStyle(
                            color: AppColors.greyText,
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            height: 1.33,
                          ),
                        ),
                        Text(
                          Localization.codeRussia,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16.0,
                            height: 1.25,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6.0,
                        vertical: 10.0,
                      ),
                      child: SvgPicture.asset(
                        AppAssets.icArrowDown,
                        height: 6.0,
                        width: 12.0,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 14.0,
                  right: 18.0,
                ),
                child: StatefulBuilder(
                  builder: (_, void Function(void Function()) setState) => TextField(
                    controller: bloc.phoneController,
                    onChanged: (_) {
                      setState(() {});
                    },
                    maxLength: 13,
                    decoration: InputDecoration(
                      hintText: Localization.phoneNumber,
                      counterText: '',
                      hintStyle: const TextStyle(
                        color: AppColors.greyText,
                        fontSize: 16.0,
                        height: 1.25,
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        maxHeight: 24.0,
                        maxWidth: 24.0,
                      ),
                      suffixIcon: Container(
                        padding: const EdgeInsets.all(7.0),
                        child: GestureDetector(
                          child: SvgPicture.asset(
                            AppAssets.icClose,
                            height: 10.0,
                            width: 10.0,
                            color: bloc.phoneController.text.isEmpty ? Colors.transparent : null,
                          ),
                          onTap: () {
                            setState(() {
                              bloc.phoneController.clear();
                            });
                          },
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 24.0),
          child: Text(
            Localization.smsVerificationNote,
            style: TextStyle(
              color: AppColors.greyText,
              fontWeight: FontWeight.w300,
              fontSize: 14.0,
              height: 1.285,
            ),
          ),
        ),
        StreamBuilder(
          stream: bloc.validationStream,
          builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) => MaterialButton(
            height: 48.0,
            color: snapshot.data == true ? AppColors.red : AppColors.greyButton,
            elevation: .0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            onPressed: () {
              if (snapshot.data == true) {
                bloc.continueButton();
              }
            },
            child: const Center(
              child: Text(
                Localization.resume,
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  height: 1.25,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: const [
            Flexible(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                Localization.or,
                style: TextStyle(
                  color: AppColors.greyText,
                  fontWeight: FontWeight.w300,
                  fontSize: 12.0,
                  height: 1.33,
                ),
              ),
            ),
            Flexible(child: Divider()),
          ],
        ),
        buildSignUpServices()
      ],
    );
  }

  Widget buildSignUpServices() => StreamBuilder(
        stream: bloc.servicesStream,
        builder: (BuildContext context, AsyncSnapshot<List<SignUpServices>> snapshot) =>
            snapshot.hasData
                ? ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext _, int index) => MaterialButton(
                          // padding: const EdgeInsets.only(bottom: 10.0),
                          height: 48.0,
                          elevation: .0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(color: AppColors.black)),
                          onPressed: () => bloc.onServiceTap(snapshot.data![index].type),
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(26.5, 12.0, 24.0, 12.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.27),
                                  child: SvgPicture.asset(
                                    snapshot.data![index].iconPath,
                                    height: 17.12,
                                    width: 19.23,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data![index].title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                      height: 1.285,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (ctx, _) => const SizedBox(height: 10.0),
                    itemCount: snapshot.data!.length)
                : const SizedBox.shrink(),
      );
}
