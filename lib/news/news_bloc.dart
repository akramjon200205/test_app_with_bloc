import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NewsEventLoad>(
      (event, emit) async {
        try {
          emit(const NewsStateProgress());
          List<PostsModel> listPosts = [];
          var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
          if (response.statusCode == 200) {
            for (var item in jsonDecode(response.body)) {
              listPosts.add(
                PostsModel.fromJson(item),
              );
            }
            emit(
              NewsStateCompleted(listPosts: listPosts),
            );
          } else {}
        } on SocketException {
          emit(
            const NewsStateFailed(massage: "Connection Error"),
          );
        } catch (e) {
          emit(
            NewsStateFailed(
              massage: e.toString(),
            ),
          );
        }
      },
    );
  }
}
