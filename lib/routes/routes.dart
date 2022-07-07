import 'package:flutter/material.dart';
import 'package:githubuser_withtest/pages/details_page.dart';
import 'package:githubuser_withtest/pages/search_page.dart';
import 'package:githubuser_withtest/pages/welcome_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'welcome': (_) => const WelcomePage(),
  'search': (_) => const SearchPage(),
  'details': (_) => const DetailsPage(),
};
