import 'package:brasil_cripto/app/core/helpers/routes_helper.dart';
import 'package:brasil_cripto/app/core/models/coin.dart';
import 'package:brasil_cripto/app/core/utils/home_store_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatefulWidget {
  final CoinShort coin;
  final bool isDeleteConfirmationEnabled;

  const CoinCard(
      {super.key,
      required this.coin,
      this.isDeleteConfirmationEnabled = false});

  @override
  State<CoinCard> createState() => _CoinCardState();
}

class _CoinCardState extends HomeStoreStateFulWidget<CoinCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = homeStore.favoriteCoins.contains(widget.coin);
  }

  @override
  void didUpdateWidget(covariant CoinCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.coin != widget.coin) {
      isFavorite = homeStore.favoriteCoins.contains(widget.coin);
    }
  }

  void confirmDelete() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: Text('Tem certeza que deseja excluir "${widget.coin.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              var favoriteCoins = homeStore.favoriteCoins.toList();

              favoriteCoins.remove(widget.coin);

              homeStore.favoriteCoins = favoriteCoins;
              Navigator.of(context).pop();
            },
            child: const Text(
              'Excluir',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void toggleFavorite() {
    if (widget.isDeleteConfirmationEnabled && isFavorite) {
      confirmDelete();
      return;
    }
    setState(() {
      isFavorite = !isFavorite;
      var favoriteCoins = homeStore.favoriteCoins.toList();
      if (isFavorite) {
        favoriteCoins.add(widget.coin);
      } else {
        favoriteCoins.remove(widget.coin);
      }
      homeStore.favoriteCoins = favoriteCoins;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: () {
          RoutesHelper.goToCoinDetails(widget.coin);
        },
        contentPadding: const EdgeInsets.all(12),
        leading: CachedNetworkImage(
          imageUrl: widget.coin.thumb,
          width: 40,
          height: 40,
          errorWidget: (_, __, ___) => Icon(
            Icons.image,
            size: 40,
          ),
        ),
        title: Text(widget.coin.name,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          '${widget.coin.symbol.toUpperCase()} • Rank #${widget.coin.marketCapRank}',
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: toggleFavorite,
        ),
      ),
    );
  }
}
