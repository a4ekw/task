import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task/consts.dart';
import 'package:task/home_page/home_screen/bloc/home_bloc.dart';
import 'package:task/home_page/home_screen/modal_bottom_sheet/bloc/login_bloc.dart';
import 'package:task/home_page/home_screen/modal_bottom_sheet/view/common_login_content.dart';

class HomeView extends StatefulWidget {
  const HomeView(
    this.bloc, {
    Key? key,
  }) : super(key: key);

  final HomeBloc bloc;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late StreamSubscription streamSubscription;

  @override
  void initState() {
    streamSubscription = widget.bloc.modalBottomSheetStream.listen((event) {
      if (event != null) {
        showModalBottomSheetWidget();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                Localization.yourProfile,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 22.0,
                  height: 1.18,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  Localization.loginNotice,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.0,
                    height: 1.43,
                  ),
                ),
              ),
              MaterialButton(
                height: 48.0,
                color: AppColors.red,
                elevation: .0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                onPressed: widget.bloc.loginButton,
                child: const Center(
                  child: Text(
                    Localization.loginButton,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      height: 1.25,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: [
                    const Text(
                      Localization.noAccount,
                      style: TextStyle(
                        color: AppColors.greyText,
                        fontWeight: FontWeight.w300,
                        fontSize: 14.0,
                        height: 1.285,
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    InkWell(
                      onTap: widget.bloc.loginButton,
                      child: const Text(
                        Localization.signUp,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  // showModalBottomSheet has obvious jamming when running for the first time:
  // https://github.com/flutter/flutter/issues/100606
  Future<void> showModalBottomSheetWidget() async {
    final LoginContentBloc loginContentBloc = GetIt.I.get();
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
      barrierColor: Colors.black,
      isScrollControlled: true,
      constraints: BoxConstraints(
          maxHeight:
              MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - 14.0),
      builder: (BuildContext context) => GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: CommonLoginContent(loginContentBloc),
      ),
    );
  }
}
