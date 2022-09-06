part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();
}

class GalleryEventLoad extends GalleryEvent {
  const GalleryEventLoad();

  @override
  List<Object?> get props => [];
}
