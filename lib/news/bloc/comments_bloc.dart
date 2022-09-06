import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/coments_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(CommentsInitial()) {
    on<CommentsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CommentsEventLoad>(
      (event, emit) async {
        try {
          emit(const CommentsStateProgress());
          List<CommentsModel> listComments = [];
          var response = await get(
            Uri.parse('https://jsonplaceholder.typicode.com/comments'),
          );
          if (response.statusCode == 200) {
            for (var element in jsonDecode(response.body)) {
              listComments.add(CommentsModel.fromJson(element));
            }
            emit(CommentsStateCompleted(listComments: listComments));
          } else {}
        } on SocketException {
          emit(const CommentsStateFaild(message: "Connection Error"));
        } catch (e) {
          emit(CommentsStateFaild(message: e.toString()));
        }
      },
    );
  }
}
