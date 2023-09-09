part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class LoadingSettingsState extends SettingsState {}

class LoadedSettingsSuccessState extends SettingsState {
  final SettingsEntitiy settings;
  const LoadedSettingsSuccessState(
    this.settings,
  );
}

class LoadedSettingsFailState extends SettingsState {
  const LoadedSettingsFailState(
    String exception,
  );
}
