import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum BottomNavPageType {
  dashboard(name: 'Home'),
  favorite(name: 'Favoritos');

  final String name;

  const BottomNavPageType({required this.name});

  IconData get icon {
    switch (this) {
      case BottomNavPageType.dashboard:
        return MdiIcons.home;
      case BottomNavPageType.favorite:
        return MdiIcons.heart;
    }
  }

  IconData get unselectedIcon {
    switch (this) {
      case BottomNavPageType.dashboard:
        return MdiIcons.homeOutline;
      case BottomNavPageType.favorite:
        return MdiIcons.heartOutline;
    }
  }
}
