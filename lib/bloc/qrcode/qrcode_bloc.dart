import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qrcode_event.dart';
part 'qrcode_state.dart';
part 'qrcode_bloc.freezed.dart';

class QrcodeBloc extends Bloc<QrcodeEvent, QrcodeState> {
  QrcodeBloc() : super(const _Initial()) {
    on<_Scanned>((event, emit) {
      emit(const QrcodeState.loading());
      emit(QrcodeState.loaded(event.data));
    });
  }
}
