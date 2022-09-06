part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();
}

class CommentsInitial extends CommentsState {
  @override
  List<Object?> get props => [];
}

class CommentsStateProgress extends CommentsState {
  const CommentsStateProgress();
  @override
  List<Object?> get props => [];
}

class CommentsStateCompleted extends CommentsState {
  const CommentsStateCompleted({required this.listComments});

  final List<CommentsModel> listComments;

  @override
  List<Object?> get props => [listComments];
}

class CommentsStateFaild extends CommentsState {
  const CommentsStateFaild({required this.message});
  final String message;
  @override
  List<Object?> get props => [message];
}
