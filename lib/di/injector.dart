import 'package:get_it/get_it.dart';
import 'package:task/home_page/home_screen/bloc/home_bloc.dart';
import 'package:task/home_page/home_screen/modal_bottom_sheet/bloc/login_bloc.dart';

class AppInjector {
  factory AppInjector() {
    return _singleton;
  }

  AppInjector._internal();

  static final AppInjector _singleton = AppInjector._internal();

  Future<void> init() async {
    GetIt.I.registerSingleton<HomeBloc>(HomeBlocImpl());
    GetIt.I.registerFactory<LoginContentBloc>(() => LoginContentBlocImpl());
  }
}
