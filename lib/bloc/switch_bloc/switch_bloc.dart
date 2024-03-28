import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableDisableNotification>(_enableDisableNotification);

    on<SliderEvent>(_slider);
  }

  _enableDisableNotification(
      EnableDisableNotification event, Emitter<SwitchState> emit) {
    emit(
      state.copyWith(isSwitch: !state.isSwitch),
    );
  }

  _slider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(
      state.copyWith(slider: event.slider),
    );
  }
}
