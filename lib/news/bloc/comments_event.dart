part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();
}

class CommentsEventLoad extends CommentsEvent {
  const CommentsEventLoad();
  @override
  List<Object?> get props => [];
}
