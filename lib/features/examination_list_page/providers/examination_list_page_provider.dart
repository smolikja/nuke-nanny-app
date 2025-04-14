import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nuke_nanny/features/examination_list_page/entities/examination_entity.dart';
import 'package:nuke_nanny/features/examination_list_page/entities/examination_status_entity.dart';

part 'examination_list_page_provider.freezed.dart';

@freezed
abstract class ExaminationListPageState with _$ExaminationListPageState {
  factory ExaminationListPageState({
    @Default(AsyncValue.loading()) AsyncValue<String> userName,
    @Default(AsyncValue.loading()) AsyncValue<List<ExaminationEntity>> content,
  }) = _ExaminationListPageState;
}

final examinationListPageProvider = StateNotifierProvider<
  ExaminationListPageNotifier,
  ExaminationListPageState
>(ExaminationListPageNotifier.new);

class ExaminationListPageNotifier
    extends StateNotifier<ExaminationListPageState> {
  ExaminationListPageNotifier(this.ref) : super(ExaminationListPageState()) {
    _setUserName();
    _setPageContent();
  }

  final _logger = Logger('ExaminationListPageNotifier');
  final Ref ref;

  void _setUserName() {
    state = state.copyWith(userName: const AsyncValue.data('Rudolf Vomáčka'));
  }

  void _setPageContent() {
    final dummyExaminations = <ExaminationEntity>[
      ExaminationEntity(
        title: 'PET vyšetření',
        doctor: 'MUDr. Iveta Nováková',
        date: '15. dubna 2025',
        time: '10:00',
        status: ExaminationStatusEntity.proposed,
        icon: MdiIcons.atom,
      ),
      ExaminationEntity(
        title: 'PET vyšetření',
        doctor: 'MUDr. Pavel Suk',
        date: '1. ledna 2025',
        time: '14:30',
        status: ExaminationStatusEntity.completed,
        icon: MdiIcons.atom,
      ),
      ExaminationEntity(
        title: 'PET vyšetření',
        doctor: 'MUDr. Jan Novotný',
        date: '23. prosince 2024',
        time: '9:15',
        status: ExaminationStatusEntity.cancelled,
        icon: MdiIcons.atom,
      ),
      ExaminationEntity(
        title: 'PET vyšetření',
        doctor: 'MUDr Eva Svobodová',
        date: '25. srpna 2024',
        time: '11:45',
        status: ExaminationStatusEntity.completed,
        icon: MdiIcons.atom,
      ),
      ExaminationEntity(
        title: 'PET vyšetření',
        doctor: 'MUDr. Petr Černý',
        date: '3. května 2024',
        time: '13:00',
        status: ExaminationStatusEntity.completed,
        icon: MdiIcons.atom,
      ),
    ];

    state = state.copyWith(content: AsyncValue.data(dummyExaminations));
  }

  void fakeUpdate() {
    state = state.copyWith(content: const AsyncValue.loading());

    Future.delayed(const Duration(milliseconds: 500), () {
      final dummyExaminations = <ExaminationEntity>[
        ExaminationEntity(
          title: 'PET vyšetření',
          doctor: 'MUDr. Iveta Nováková',
          date: '15. dubna 2025',
          time: '10:00',
          status: ExaminationStatusEntity.planned,
          icon: MdiIcons.atom,
        ),
        ExaminationEntity(
          title: 'PET vyšetření',
          doctor: 'MUDr. Pavel Suk',
          date: '1. ledna 2025',
          time: '14:30',
          status: ExaminationStatusEntity.completed,
          icon: MdiIcons.atom,
        ),
        ExaminationEntity(
          title: 'PET vyšetření',
          doctor: 'MUDr. Jan Novotný',
          date: '23. prosince 2024',
          time: '9:15',
          status: ExaminationStatusEntity.cancelled,
          icon: MdiIcons.atom,
        ),
        ExaminationEntity(
          title: 'PET vyšetření',
          doctor: 'MUDr Eva Svobodová',
          date: '25. srpna 2024',
          time: '11:45',
          status: ExaminationStatusEntity.completed,
          icon: MdiIcons.atom,
        ),
        ExaminationEntity(
          title: 'PET vyšetření',
          doctor: 'MUDr. Petr Černý',
          date: '3. května 2024',
          time: '13:00',
          status: ExaminationStatusEntity.completed,
          icon: MdiIcons.atom,
        ),
      ];

      state = state.copyWith(content: AsyncValue.data(dummyExaminations));
    });
  }
}
