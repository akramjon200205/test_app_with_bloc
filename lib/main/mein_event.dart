part of 'mein_bloc.dart';

abstract class MeinEvent extends Equatable {
  const MeinEvent();
}

class MeinEventSetIndexPage extends MeinEvent {
  int indexPage;
  MeinEventSetIndexPage({required this.indexPage});
  
  @override
  List<Object?> get props => [indexPage];
}
