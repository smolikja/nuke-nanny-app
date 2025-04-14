/// Constants for application routes
class Routes {
  Routes._();

  static const String examinationListPage = '/examination-list-page';

  static const String questionnairePage = '/questionnaire-page';

  static const String examinationDetailPage = '/examination-detail-page';

  static const String patientListPage = '/patient-list-page';

  static const String patientDetailPage = 'patient-detail-page/:patientId';

  static String get examinationListQuestionnairePath =>
      examinationListPage + questionnairePage;

  static String get examinationListDetailPath =>
      examinationListPage + examinationDetailPage;

  static String patientDetailPath(String patientId) =>
      '$patientListPage/patient-detail-page/$patientId';
}
