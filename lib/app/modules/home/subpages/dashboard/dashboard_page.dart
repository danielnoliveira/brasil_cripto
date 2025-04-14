import 'package:flutter/material.dart';

import 'dashboard_page_view.dart';
import 'dashboard_page_view_model.dart';

class DashboardPage extends StatefulWidget {
  static String get path => '/dashboard';
  static String get fullPath => '/settings$path';
  const DashboardPage({super.key});

  @override
  DashboardPageViewModel createState() => DashboardPageView();
}
