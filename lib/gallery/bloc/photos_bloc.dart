import 'dart:convert';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/photos_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosInitial()) {
    on<PhotosEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<PhotosEventLoad>(
      (event, emit) async {
        try {
          List<PhotosModel> listPhotos = [];
          emit(PhotosStateProgress());
          var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
          if (response.statusCode == 200) {
            for (final item in jsonDecode(response.body)) {
              listPhotos.add(PhotosModel.fromJson(item));
            }
            emit(PhotosStateCompleted(listPhotos: listPhotos));
          } else {}
        } on SocketException {
          emit(PhotosStateFailed(message: "Connection Error"));
        } catch (e) {
          emit(PhotosStateFailed(message: e.toString()));
        }
      },
    );
  }
}
