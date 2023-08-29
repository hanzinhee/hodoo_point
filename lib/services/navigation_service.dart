import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> sectionNavigatorKey =
      GlobalKey<NavigatorState>();
  static get rootContext => rootNavigatorKey.currentContext;
  static get sectionContext => sectionNavigatorKey.currentContext;
}