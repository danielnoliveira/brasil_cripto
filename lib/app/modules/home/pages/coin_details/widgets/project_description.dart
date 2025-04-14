import 'package:coingecko_api/data/coin.dart';
import 'package:flutter/material.dart';

class ProjectDescription extends StatelessWidget {
  final Coin coin;
  const ProjectDescription({
    super.key,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sobre o Projeto',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          coin.description?.translations['en'] ?? 'Descrição não disponível',
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
