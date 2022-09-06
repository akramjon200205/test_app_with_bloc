part of 'photos_bloc.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();
}

class PhotosInitial extends PhotosState {
  @override
  List<Object?> get props => [];
}

class PhotosStateProgress extends PhotosState {
  @override
  List<Object?> get props => [];
}

class PhotosStateCompleted extends PhotosState {
  List<PhotosModel> listPhotos;
  PhotosStateCompleted({required this.listPhotos});
  @override
  List<Object?> get props => [listPhotos];
}

class PhotosStateFailed extends PhotosState {
  String message;
  PhotosStateFailed({required this.message});
  
  @override
  List<Object?> get props => [];
}
