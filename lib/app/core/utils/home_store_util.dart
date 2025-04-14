import 'package:brasil_cripto/app/modules/home/stores/home_store.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class HomeStoreStateFulWidget<T extends StatefulWidget>
    extends State<T> {
  HomeStore homeStore = Modular.get<HomeStore>();
}
