import 'dart:async';

mixin AutomaticSearchMixin {
  late Function automaticSearchRefreshCallback;
  final textSearchAwaitDuration = const Duration(milliseconds: 1000);

  Timer? t;
  String lastTextSearched = "";

  void onChangedAutomaticSearch(String text) {
    t?.cancel();
    t = Timer(textSearchAwaitDuration, () => reloadList(text));
  }

  void reloadList(String text) {
    if (text == lastTextSearched) {
      return;
    }
    lastTextSearched = text;
    automaticSearchRefreshCallback();
  }
}
