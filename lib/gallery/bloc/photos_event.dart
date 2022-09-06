part of 'photos_bloc.dart';

abstract class PhotosEvent extends Equatable {
  const PhotosEvent();
}

class PhotosEventLoad extends PhotosEvent {
  @override  
  List<Object?> get props => [];
}
