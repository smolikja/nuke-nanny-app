import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nuke_nanny/core/navigation/routes.dart';
import 'package:nuke_nanny/core/navigation/routes_builder.dart';

/// Creates the application router
GoRouter getRouter() => GoRouter(
  initialLocation: Routes.examinationListPage,
  routes: [
    RoutesBuilder.examinationListPageRoute,
    RoutesBuilder.patientListPageRoute,
  ],
  errorBuilder:
      (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text('Page not found: ${state.uri}')),
      ),
);
