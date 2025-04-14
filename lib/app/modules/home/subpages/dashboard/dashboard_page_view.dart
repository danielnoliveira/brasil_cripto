import 'package:brasil_cripto/app/commom_widgets/builders/ds_builder.dart';
import 'package:brasil_cripto/app/modules/home/subpages/dashboard/widgets/coin_card.dart';
import 'package:brasil_cripto/app/modules/home/subpages/dashboard/widgets/list_warning.dart';
import 'package:brasil_cripto/app/modules/home/subpages/dashboard/widgets/search_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

import 'dashboard_page_view_model.dart';

class DashboardPageView extends DashboardPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      padding: const EdgeInsets.symmetric(horizontal: 16)
          .copyWith(top: 24, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchTextInput(
            onChangedAutomaticSearch: onChangedAutomaticSearch,
            textEditingController: homeStore.searchController,
          ),
          Expanded(
            child: Observer(builder: (context) {
              return AsyncDataStateBuilder(
                dataState: homeStore.coinsAsyncState,
                errorWidget: (error) {
                  return ListWarning(
                      message: 'Erro ao tentar buscar criptomoedas!');
                },
                dataWidget: (data) {
                  if (data.isEmpty) {
                    return ListWarning(
                        message: 'Nenhuma criptomoeda encontrada!');
                  }
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final coin = data[index];
                      return CoinCard(coin: coin);
                    },
                    itemCount: data.length,
                  );
                },
                invalidWidget: () {
                  return ListWarning(
                      message:
                          'Para pesquisar criptomoedas,\ninsira o nome dela no campo de pesquisa!');
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
