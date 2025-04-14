import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nuke_nanny/features/examination_detail_page/entities/examination_detail_entity.dart';
import 'package:nuke_nanny/features/examination_detail_page/entities/examination_status_entity.dart';

part 'examination_detail_page_provider.freezed.dart';

@freezed
abstract class ExaminationDetailPageState with _$ExaminationDetailPageState {
  factory ExaminationDetailPageState({
    @Default(AsyncValue.loading())
    AsyncValue<ExaminationDetailEntity> examination,
  }) = _ExaminationDetailPageState;
}

final examinationDetailPageProvider = StateNotifierProvider.autoDispose<
  ExaminationDetailPageNotifier,
  ExaminationDetailPageState
>(ExaminationDetailPageNotifier.new);

class ExaminationDetailPageNotifier
    extends StateNotifier<ExaminationDetailPageState> {
  ExaminationDetailPageNotifier(this.ref)
    : super(ExaminationDetailPageState()) {
    _loadExaminationDetail();
  }

  final _logger = Logger('ExaminationDetailPageNotifier');
  final Ref ref;

  void _loadExaminationDetail() {
    final dummyExamination = ExaminationDetailEntity(
      title: 'PET vyšetření',
      doctor: 'MUDr. Iveta Nováková',
      doctorContact: '+420 123 456 789',
      date: '15. dubna 2025',
      time: '10:00',
      status: ExaminationStatusEntity.planned,
      instructions: [
        'Po celou dobu jste v kabince monitorováni kamerovým systémem a můžete mluvit s obsluhou pomocí komunikačního systému.',
        'Po aplikaci radiofarmaka FDG zaujměte pohodlnou pozici, bez napnutí svalů. Připravte si k ruce kelímek, láhev s vodou, čtení…',
        'Je velice důležité pro kvalitu vyšetření, abyste byli v kabince v klidu.',
        'Použijte deku na přikrytí, je důležité, aby u vás nebyl pocit chladu a třes.',
      ],
      icon: MdiIcons.atom,
    );

    state = state.copyWith(examination: AsyncValue.data(dummyExamination));
  }
}
