part of 'gallery_bloc.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();
}

class GalleryInitial extends GalleryState {
  @override
  List<Object?> get props => [];
}

class GallerryStateProgress extends GalleryState {
  const GallerryStateProgress();
  @override
  List<Object?> get props => [];
}

class GalleryStateCompleted extends GalleryState {
  const GalleryStateCompleted({required this.listAlboms});
  final List<AlbomsModel> listAlboms;

  @override
  List<Object?> get props => [listAlboms];
}

class GalleryStateFaild extends GalleryState {
  const GalleryStateFaild(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
