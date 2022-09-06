part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  const NewsInitial();
  @override
  List<Object?> get props => [];
}

class NewsStateProgress extends NewsState {
  const NewsStateProgress();

  @override
  List<Object?> get props => [];
}

class NewsStateCompleted extends NewsState {
  const NewsStateCompleted({required this.listPosts});
  final List<PostsModel> listPosts;

  @override
  List<Object?> get props => [listPosts];
}

class NewsStateFailed extends NewsState {
  const NewsStateFailed({required this.massage});
  final String massage;

  @override
  List<Object?> get props => [massage];
}
