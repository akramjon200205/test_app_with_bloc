import 'dart:convert';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/todos_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part 'check_event.dart';
part 'check_state.dart';

class CheckBloc extends Bloc<CheckEvent, CheckState> {
  CheckBloc() : super(CheckInitial()) {
    on<CheckEvent>((event, emit) {});
    on<CheckEventLoad>(
      (event, emit) async {
        try {
          List<TodosModel> listTodoses = [];
          emit(CheckStateProgress());
          var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
          if (response.statusCode == 200) {
            for (var item in jsonDecode(response.body)) {
              listTodoses.add(TodosModel.fromJson(item));
            }
            emit(CheckStateCompleted(listTodos: listTodoses));
          } else {}
        } on SocketException {
          emit(CheckStateFailed(message: "Connection Error"));
        } catch (e) {
          emit(CheckStateFailed(message: e.toString()));
        }
      },
    );
  }
}
