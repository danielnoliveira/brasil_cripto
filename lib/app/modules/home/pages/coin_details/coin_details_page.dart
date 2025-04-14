import 'package:brasil_cripto/app/core/models/coin.dart';
import 'package:brasil_cripto/app/modules/home/pages/coin_details/coin_details_page_view.dart';
import 'package:brasil_cripto/app/modules/home/pages/coin_details/coin_details_page_view_model.dart';
import 'package:flutter/material.dart';

class CoinDetailsPage extends StatefulWidget {
  final CoinShort coin;
  const CoinDetailsPage({super.key, required this.coin});

  @override
  CoinDetailsPageViewModel createState() => CoinDetailsPageView();
}
