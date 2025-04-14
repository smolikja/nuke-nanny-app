import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nuke_nanny/core/navigation/routes.dart';
import 'package:nuke_nanny/features/examination_detail_page/examination_detail_page.dart';
import 'package:nuke_nanny/features/examination_list_page/examination_list_page.dart';
import 'package:nuke_nanny/features/nurse_section/patient_detail_page/patient_detail_page.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/patient_list_page.dart';
import 'package:nuke_nanny/features/questionnaire_page/questionnaire_page.dart';

final lastLocationProvider = StateProvider<String>(
  (ref) => Routes.examinationListPage,
);

/// Builder for application routes
class RoutesBuilder {
  /// Private constructor to prevent instantiation
  RoutesBuilder._();

  /// Builds the home route
  static RouteBase get examinationListPageRoute => GoRoute(
    path: Routes.examinationListPage,
    routes: [questionnaireRoute, examinationDetailRoute],
    pageBuilder:
        (context, state) => NoTransitionPage(
          child: ExaminationListPage(
            onExaminationSignTap:
                () => context.go(Routes.examinationListQuestionnairePath),
            onExaminationDetailTap:
                () => context.go(Routes.examinationListDetailPath),
            onPatienListTap: () => context.replace(Routes.patientListPage),
          ),
        ),
  );

  static RouteBase get questionnaireRoute => GoRoute(
    path: Routes.questionnairePage,
    builder: (context, state) => const QuestionnairePage(),
  );

  static RouteBase get examinationDetailRoute => GoRoute(
    path: Routes.examinationDetailPage,
    builder: (context, state) => const ExaminationDetailPage(),
  );

  static RouteBase get patientListPageRoute => GoRoute(
    path: Routes.patientListPage,
    routes: [patientDetailPageRoute],
    pageBuilder:
        (context, state) => NoTransitionPage(
          child: PatientListPage(
            onExaminationListTap:
                () => context.replace(Routes.examinationListPage),
            onPatientDetailTap:
                (patientId) => context.go(Routes.patientDetailPath(patientId)),
          ),
        ),
  );

  static RouteBase get patientDetailPageRoute => GoRoute(
    path: Routes.patientDetailPage,
    builder: (context, state) {
      final patientId = state.pathParameters['patientId'] ?? '';
      return PatientDetailPage(patientId: patientId);
    },
  );
}
