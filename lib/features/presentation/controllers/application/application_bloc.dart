import 'dart:async';

import 'package:dz_pos/core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitial()) {
    on<SetupApplication>(_onSetupApplication);
  }

  final appService = AppService();

  FutureOr<void> _onSetupApplication(
    SetupApplication event,
    Emitter<ApplicationState> emit,
  ) {
    // setup old settings

    // check authentication

    emit(ApplicationCompleted());
  }
}
