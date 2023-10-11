part of 'khs_bloc.dart';

@freezed
class KhsEvent with _$KhsEvent {
  const factory KhsEvent.started() = _Started;
  const factory KhsEvent.getKhs() = _GetKhs;
}