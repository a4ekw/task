import 'dart:async';

abstract class HomeBloc {
  Stream<bool?> get modalBottomSheetStream;

  void loginButton();
}

class HomeBlocImpl implements HomeBloc {
  final _modalBottomSheetStreamController = StreamController<bool?>();

  @override
  Stream<bool?> get modalBottomSheetStream => _modalBottomSheetStreamController.stream;

  @override
  void loginButton() {
    _modalBottomSheetStreamController.sink.add(true);
  }
}
