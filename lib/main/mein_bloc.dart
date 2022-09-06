import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mein_event.dart';
part 'mein_state.dart';

class MeinBloc extends Bloc<MeinEvent, MeinState> {
  MeinBloc() : super(MeinState(indexPage: 0)) {
    on<MeinEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<MeinEventSetIndexPage>(
      (event, emit) {
        emit(MeinState(indexPage: event.indexPage));
      },
    );
  }
}


