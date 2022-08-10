import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/consts.dart';
import 'package:task/home_page/home_screen/modal_bottom_sheet/bloc/login_bloc.dart';

import 'main_login_view.dart';
import 'number_verification_view.dart';

class CommonLoginContent extends StatefulWidget {
  const CommonLoginContent(
    this.bloc, {
    Key? key,
  }) : super(key: key);

  final LoginContentBloc bloc;

  @override
  State<CommonLoginContent> createState() => _CommonLoginContentState();
}

class _CommonLoginContentState extends State<CommonLoginContent> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: AppColors.greyLight,
          ),
          margin: const EdgeInsets.only(top: 6.0, bottom: 15.0),
          alignment: Alignment.center,
          height: 4.0,
          width: 36.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(left: 31.0),
                child: SvgPicture.asset(
                  AppAssets.icClose,
                  height: 10.0,
                  width: 10.0,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
            StreamBuilder(
              stream: widget.bloc.titleStream,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) => snapshot.hasData
                  ? Text(
                      snapshot.data!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 14.0,
                        height: 1.285,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(width: 24.0),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 17.0, bottom: 12.0),
          child: Divider(height: 1.0),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: StreamBuilder(
              stream: widget.bloc.stepsStream,
              builder: (BuildContext context, AsyncSnapshot<LoginStep> snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data) {
                    case LoginStep.verify:
                      return NumberVerificationView(widget.bloc);
                    default:
                      return MainLoginView(widget.bloc);
                  }
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ],
    );
  }
}
