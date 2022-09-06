part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class NewsEventLoad extends NewsEvent {
  const NewsEventLoad();
  @override
  List<Object?> get props => [];
}
