part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class GetSettingsEvent extends SettingsEvent {}

class ChangeNotificationSettingsEvent extends SettingsEvent {
  final bool newVal;

  const ChangeNotificationSettingsEvent(this.newVal);
}

class ChangeLocationSettingsEvent extends SettingsEvent {
  final bool newVal;

  const ChangeLocationSettingsEvent(this.newVal);
}

class ChangeTemperatureSettingsEvent extends SettingsEvent {
  final String newVal;

  const ChangeTemperatureSettingsEvent(this.newVal);
}

class ChangeWindSpeedSettingsEvent extends SettingsEvent {
  final String newVal;

  const ChangeWindSpeedSettingsEvent(this.newVal);
}
