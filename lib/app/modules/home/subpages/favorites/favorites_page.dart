import 'package:flutter/material.dart';

import 'favorites_page_view.dart';
import 'favorites_page_view_model.dart';

class FavoritesPage extends StatefulWidget {
  static String get path => '/favorites';
  static String get fullPath => '/settings$path';
  const FavoritesPage({super.key});

  @override
  FavoritesPageViewModel createState() => FavoritesPageView();
}
