part of 'qrcode_bloc.dart';

@freezed
class QrcodeState with _$QrcodeState {
  const factory QrcodeState.initial() = _Initial;
  const factory QrcodeState.loading() = _Loading;
  const factory QrcodeState.loaded(String data) = _Loaded;
  const factory QrcodeState.error(String message) = _Error;
}
