import 'dart:convert';

import 'package:brasil_cripto/app/core/async_state/async_data_state.dart';
import 'package:brasil_cripto/app/core/enums/bottom_nav_page_type.dart';
import 'package:brasil_cripto/app/core/helpers/store_keys_helper.dart';
import 'package:brasil_cripto/app/core/models/coin.dart';
import 'package:flutter/widgets.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  BottomNavPageType bottomNavPageType = BottomNavPageType.dashboard;

  @action
  setBottomNavPageType(BottomNavPageType value) {
    bottomNavPageType = value;
  }

  final searchController = TextEditingController();
  @observable
  AsyncDataState<List<CoinShort>>? coinsAsyncState;

  @observable
  List<CoinShort> favoriteCoins = [];
  ReactionDisposer? favoriteCoinsDisposer;

  void initFavoriteCoins() {
    try {
      favoriteCoins = (jsonDecode(
              (localStorage.getItem(StoreKeysHelper.favoriteCoinsKey) ??
                  "[]")) as List)
          .map((e) => CoinShort.fromJson(e))
          .toList();
    } catch (e) {
      favoriteCoins = [];
    } finally {
      favoriteCoinsDisposer = reaction(
        (e) => favoriteCoins,
        (value) {
          var favoriteCoinsSerialized =
              jsonEncode(favoriteCoins.map((e) => e.toJson()).toList());
          localStorage.setItem(
              StoreKeysHelper.favoriteCoinsKey, favoriteCoinsSerialized);
        },
      );
    }
  }
}
