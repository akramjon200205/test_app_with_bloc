import 'dart:convert';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/alboms_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(GalleryInitial()) {
    on<GalleryEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GalleryEventLoad>(
      (event, emit) async {
        try {
          List<AlbomsModel> listAlboms = [];
          emit(const GallerryStateProgress());
          var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
          if (response.statusCode == 200) {
            for (final item in jsonDecode(response.body)) {
              listAlboms.add(AlbomsModel.fromJson(item));
            }
            emit(GalleryStateCompleted(listAlboms: listAlboms));
          } else {}
        } on SocketException {
          emit(const GalleryStateFaild('Connection error'));
        } catch (e) {
          emit(GalleryStateFaild(e.toString()));
        }
      },
    );
  }
}
